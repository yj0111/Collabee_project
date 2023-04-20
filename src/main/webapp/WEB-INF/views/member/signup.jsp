<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
	<%@ include file="../common/bootstrap.jspf" %> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberCSS/signup.css">

	<%-- <script src="${pageContext.request.contextPath }/resources/js/signupScript.js"></script> --%>
</head>


<!-- 카카오지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
$(function(){ //document load
	//카카오 지도
   document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
            }
        }).open();
    }); // 카카오지도 끝
	
	
    // 회원가입 항목 
    var id = document.getElementById("id");
    var password = document.getElementById("password");
    var password2 = document.getElementById("password2");
    var name = document.getElementById("name");
    var email = document.getElementById("email");
    var phone = document.getElementById("phone");
    var address = document.getElementById("address");
    var addressDetail = document.getElementById("addressDetail");
    var agree1 = document.getElementById("agree1");
	var gender = document.querySelector("input[name=gender]").value;	
	var year= document.getElementById("birthYear");
	var month= document.getElementById("birthMonth");
	var day= document.getElementById("birthDay");
	
    var signupFrm = document.getElementsByName("signupFrm");
    // 아이디 성공, 실패 메시지
    let failuremessage = document.querySelector('.failure-message');
    let duplicateMsg = document.querySelector('.duplicateId-message');
    let availableMsg = document.querySelector('.availableId-message');
    
    id.onkeyup = function () {
	    let mvo = { id: id.value }   
		console.log("mvo : " + mvo.id)
		
    	if (isMoreThan4Length(id.value)) {
            failuremessage.classList.add('hide') //네글자이상이면숨김
        
            $.ajax("confirmIdAjax.do",{
			type: "post",
			data: JSON.stringify(mvo),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
					/* alert("성공"); */
					console.log(data);
					
					//중복확인결과
				    let duplicateMsg = document.querySelector('.duplicateId-message');
				    let availableMsg = document.querySelector('.availableId-message');
	
				    if(data == false){
						console.log("아이디 중복");
						duplicateMsg.classList.remove('hide');
						availableMsg.classList.add('hide');
					    return false;
					}
					if(data == true){
						console.log("사용가능아이디");
						availableMsg.classList.remove('hide');
						duplicateMsg.classList.add('hide');
						return false;
					}
				},
				erroer: function(){
					alert("실패");
				}
			}); //ajax끝 	
		
        } else {
            failuremessage.classList.remove('hide'); //네글자 이하면 보임 
    		availableMsg.classList.add('hide');
    		duplicateMsg.classList.add('hide');
            
        }	
    }// id.onkeyup끝
    // 아이디 4글자 이상 확인
    function isMoreThan4Length(value) {
        return value.length >= 4;
    }
    
    //비밀번호 영문자+숫자+특수조합(8~15자리 입력) 정규식
    var passwordReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
 	let testMismatchMessage = document.querySelector('.testMismatch-message');
 	let availablePwMessage = document.querySelector('.availablePw-message');
   
 	password.onkeyup = function () {
    	if (!passwordReg.test(password.value)) {
    		testMismatchMessage.classList.remove('hide')
    		availablePwMessage.classList.add('hide') 
    	} else {
    		availablePwMessage.classList.remove('hide')   
    		testMismatchMessage.classList.add('hide')   
    	}
    }
    
    // 비밀번호 일치 불일치 체크
    let mismatchmessage = document.querySelector('.mismatch-message')
    let matchmessage = document.querySelector('.match-message');
    password2.onkeyup = function () {
	    if ( isMatch(password.value, password2.value) ) {
	        mismatchmessage.classList.add('hide')
	        matchmessage.classList.remove('hide')
	    }
	    else {
	        mismatchmessage.classList.remove('hide')
	        matchmessage.classList.add('hide')
	    }
    }
    //비밀번호 값과 비밀번호 확인값 일치 확인
    function isMatch (password, password2) {
        if ( password === password2 ) {
            return true;
       	} else {
            return false;
        }
    }
   	// 이메일 형식
   	 email.onkeyup = function () {
	   	//var emailReg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;	   
  		//let failureMsg = document.querySelector('.failure-message-message');
	  	//var email = document.getElementById("email");
	   console.log ("email : " + email.value);   
	    /* if (!emailReg.test(email)){
   			failureMsg.classList.remove('hide');
   		}  */
   	}
    
   	phone.onkeyup = function () {
   	  console.log ("phone : " + phone.value);
   	}
   	
   	addressDetail.onkeyup = function () {
   	  console.log ("address : " + address.value);
   	  console.log ("addressDetail : " + addressDetail.value);  		
   	}
   	
   	
	var year= document.getElementById("birthYear");
	var month= document.getElementById("birthMonth");
	var day= document.getElementById("birthDay");
	
	day.onkeyup = function () {
		var birthday = year.value + month.value + day.value;
		console.log("birth :  " + birthday);	
	}
   	
   	
    // 휴대폰 번호만 입력
    let numberchkmessage = document.querySelector('.numberchk-message');
    $("input[onlyNumber]").on('keyup', function(){
        $(this).val($(this).val().replace(/[^0-9]/g, ""));
    });
	
    //전체동의 클릭
    $("#allchk").click(function(){
        if($("#allchk").is(":checked")) {
            $(".chk").prop("checked", true);
        } else {
            $(".chk").prop("checked", false);
        }
    }); 
    //전체동의 중 체크박스 하나 풀었을때 전체 체크 해제
    $(".chk").click(function(){
        if($("input[name='chk']:checked").length == 4) {
            $("#allchk").prop("checked", true);
        } else {
            $("#allchk").prop("checked", false);
        }
    });
    
}); //document load끝
	//이메일 중복검사
	function confirmEmail () {
		 var email = document.getElementById("email");	
	
		if (email.value == ""){ //script 파일에 있는 jquery 객체임
			alert("이메일을 입력하세요");
			email.focus(); 
			return false;
		} else {
			let mvo = { email: email.value }  ;
			
			console.log(JSON.stringify(mvo));
	
			$.ajax("signUpConfirmEmailAjax.do",{
				type: "post",
				data: JSON.stringify(mvo),
				contentType: "application/json",
				dataType: "json",
				success: function(data){
						//alert("성공"); 
						console.log("data: " + data);
						
						//중복확인결과
					
					    let failureMsg = document.querySelector('.failure-message-message');
					    let duplicateMsg = document.querySelector('.duplicateEamil-message');
					    let availableMsg = document.querySelector('.availableEmail-message');
					    var email = document.getElementById("email");
					    
					    if(data.result == "duplicate"){
							console.log("이메일 중복");
							duplicateMsg.classList.remove('hide');
							email.value = ""; //input 태그 초기화
							email.focus();
							return false;
						}
						if(data.result == "available"){
							console.log("사용가능 이메일");
						 	availableMsg.classList.remove('hide');
							duplicateMsg.classList.add('hide'); 
							return false;
						}
				},
				erroer: function(){
					alert("실패");
				}
			}); //ajax끝
		}// else 끝
	}
   // 회원가입 폼 유효성 검사 및 데이터 전송
	function signupChk() { 
		//alert("회원가입클릭");	    
		var id = document.getElementById("id");
	    var password = document.getElementById("password");
	    var name = document.getElementById("name");
	    var email = document.getElementById("email");
	    var phone = document.getElementById("phone");
	    var address = document.getElementById("address");
	    var addressDetail = document.getElementById("addressDetail");
		var gender = document.querySelector("input[name=gender]").value;	
		
		var year= document.getElementById("birthYear");
		var month= document.getElementById("birthMonth");
		var day= document.getElementById("birthDay");
		var birthday = year.value + month.value + day.value;
		console.log("birth :  " + birthday);
        if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
            alert("아이디를 입력하세요.");
            id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
            return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
        };
        
        if (password.value == "") {
            alert("비밀번호를 입력하세요.");
            password.focus();
            return false;
        };
        
        //비밀번호 영문자+숫자+특수조합(8~15자리 입력) 정규식
        var passwordReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
        
        if (!passwordReg.test(password.value)) {
            alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~15자리 사용해야 합니다.");
            pwd.focus();
            return false;
        };
        
        if (password.value != password2.value) {
            alert("비밀번호가 다릅니다");
            password2.focus();
            return false;
        }
        //이름 정규식 한글/2자 이상	
      	var regname = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
        
       if(!regname.test(name.value)) {    
           return false;
        }
        if (name.value == "") {
            alert("이름을 입력하세요.");
            name.focus();
            return false;
        };
        
        if (email.value == "") {
            alert("이메일 주소를 입력하세요.");
            email.focus();
            return false;
        }
        if (address.value == "") {
            alert("주소를 입력하세요.");
            address.focus();
            return false;
        }
        
        
        //(필수)체크박스 미체크시 
        if (!agree1.checked || !agree2.checked || !agree4.checked) { 
            alert("약관 동의를 체크하세요.");
            agree.focus();
            return false;
        }
        console.log("mvo만들기");
        //입력 값 전송     
        var mvo = {	id: id.value, password: password.value, name: name.value,
        			email: email.value , phone:phone.value , address: address.value,
        			gender: gender , birth: birthday, 
        			addressDetail: addressDetail.value };
    
 		console.log("회원가입 입력 데이터 : " + mvo);
 		console.log("JSON.stringify(mvo) : " + JSON.stringify(mvo));
    	
   	
 		$.ajax("signupAjax.do",{
			type: "post",
			data: JSON.stringify(mvo),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
					console.log("data: " +data);
					let signupFrmArea = document.querySelector('.signupFrmArea');
					let signupResultArea = document.querySelector('.signupResultArea');
					
					if (data == false) {
						alert("알수없는 오류로 회원가입에 실패했습니다.");
					}
					if (data == true) {
						signupResultArea.classList.remove('hide');
						signupFrmArea.classList.add('hide');
						$('#signupId').html(id.value);
					}
			},
			erroer: function(){
				alert("실패");
			}
		}); //ajax끝
        
        
	}	
   function login () {
	   //alert("로그인버튼클릭");
	   location.href="../member/login.do";
   }
   
</script>


<body>
<%-- \${confirmIdResult} : ${confirmIdResult} --%>
	<header>
		<%@ include file="../common/header.jspf" %> 
		<%-- <jsp:include page="../common/header.jspf" flush="true" /> --%>
    </header>
    
    <div id="container">
       
        <div class="row">
            <div class="col-2"></div>
            
            <div class="col-8">
                <div id="content-container">
                    
                <div class="signupFrmArea"> <!-- 회원가입폼 -->       
                   <div id="container">
                        <h4 class="text-center" style="padding-bottom: 50px; color: #666666; font-weight: bold;">회원가입</h4>
                    </div>
                    
                    <div id="text-right" style="border-bottom: 2px solid #666666; padding-bottom: 10px;">
                        <span class="text-danger">*</span><small>필수입력사항</small>
                    </div>

                    <div class="d-flex align-items-stretch justify-content-center">
                       
                        <form name="signupFrm" id="signupFrm" method="post"> <!--signup.do-->
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>아이디</b></small><span class="text-danger">*</span></div>
                                <div class="form2">
                                    <div class="input-area">
                                        <input type="text" class="form-control" id="id" name="id" required="required" placeholder="아이디를 입력해주세요" style="width: 333px;">
                                    </div>
                                    <div>
                                        <div class="failure-message hide red-message">아이디는 네글자 이상이여야 합니다</div>
                                        <div class="duplicateId-message hide red-message">이미 사용중인 아이디입니다</div>
                                        <div class="availableId-message hide purple-message">사용 가능한 아이디입니다♡</div>
                                    </div>

                                </div>
                                
                                <div class="form3"></div>
                            </div>
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>비밀번호</small><span class="text-danger">*</span></div>                                
                                <div class="form2">
                                    <input type="password" class="form-control" id="password" name="password" required="required" placeholder="비밀번호를 입력해주세요" style="width: 333px;">
                                    <div class="testMismatch-message hide red-message">영문자+숫자+특수 문자 조합으로 8~15자리를 입력해주세요 </div>
                                    <div class="availablePw-message hide purple-message">사용 가능한 비밀번호입니다♡</div>
                                </div>
                                <div class="form3"></div>    	
                            </div>
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>비밀번호확인</b></small><span class="text-danger">*</span></div>                                
                                <div class="form2">
                                    <div>
                                        <input type="password" class="form-control" id="password2" name="password2" required="required" placeholder="비밀번호를 한번 더 입력해주세요" style="width: 333px;">
                                    </div>
                                    <div>
                                        <div class="mismatch-message hide red-message">비밀번호가 일치하지 않습니다</div>
                                        <div class="match-message hide purple-message">비밀번호가 일치합니다 ♡</div>
                                    </div>                                
                                </div>	
                                <div class="form3"></div> 
                            </div>
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>이름</b></small><span class="text-danger">*</span></div>
                                <div class="form2"><input type="text" class="form-control" id="name" name="name" required="required" placeholder="이름을 입력해주세요" style="width: 333px;"></div>
                                <div class="form3"></div> 
                            </div>
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>이메일</b></small><span class="text-danger">*</span></div>
                                <div class="form2">
                                    <div class="input-area">
                                		<input type="text" class="form-control" id="email" name="email" required="required" placeholder="예:marketCollabee@collabee.com" style="width: 333px;">
                                	</div>
                                	<div>
                                		<div class="failure-message hide red-message">이메일 형식에 맞춰주세요</div>
	                                	<div class="duplicateEamil-message hide red-message">이미 사용중인 이메일입니다</div>
    	                                <div class="availableEmail-message hide purple-message">사용 가능한 이메일입니다♡</div>
                                	</div>
                                </div>
                                
                                <div class="form3" onclick="confirmEmail()"><button class="chk-button"><small><b>중복확인</b></small></button></div>
                            </div>
                            <div class="form-group form-inline" style="margin-bottom: 0px;">
                                <div class="form1"><small><b>휴대폰</b></small><span class="text-danger">*</span></div>
                                <div class="form2">
                                    <div>
                                        <input type="text" class="form-control" id="phone" name="phone" required="required" placeholder="숫자만 입력해주세요"  style="width: 333px;" onlyNumber>
                                    </div>
                                    <div>
                                        <div class="numberchk-message hide">휴대폰 번호를 입력해주세요</div>
                                    </div>
                                </div>
                                <div class="form3"></div> 
                            </div>
                            <div class="form-group form-inline" style="height: 150px">
                                <div class="form1"><small><b>주소</b></small><span class="text-danger">*</span></div>
                                <div class="form2">
                                	<input type="text" readonly class="form-control"  id="address" name="address" style="width: 333px; margin-bottom: 20px; background-color: white;">
                                	<input type="text" class="form-control"  id="addressDetail" name="addressDetail" required="required" placeholder="" style="width: 333px;">
                                </div>
                                <div class="form3" id="address_kakao"><button type="button" class="chk-button"><small><b>주소찾기</b></small></button></div>
                            </div>
                            <div class="">
                                <div class="form-group form-inline">
                                <div class="form1"><small><b>성별</b></small></div>
                                    <div class="form2">
                                        <label class="form-check-label" style="width: 333px;">
                                            <div class="genchk"><input type="radio" class="form-check-input" name="gender" value="male">남 자</div>
                                            <div class="genchk"><input type="radio" class="form-check-input" name="gender" value="female">여 자</div>
                                            <div class="genchk"><input type="radio" class="form-check-input" name="gender" value="no_select" checked>선택안함</div>
                                        </label>
                                    </div>
                                </div>
                            </div>
				<div class="form-group form-inline">
                      <div class="form1"><small><b>생년월일</b></small></label></div>
                      <div class="form2" style="border: 1px solid lightgray; border-radius: 5px;">

                        <div class="d-flex align-content-between">
                          <div class="birth">
                            <div>
                              <input data-testid="input-box" id="birthYear" name="birthYear" placeholder="YYYY" type="text" class="birthFrmGroup" value="">
                            </div>
                          </div>
                          <div><span class="bi-slash-lg"></span></div>
                          <div class="d-flex align-content-between">
                            <div>
                              <input data-testid="input-box" id="birthMonth" name="birthMonth" placeholder="MM" type="text" class="birthFrmGroup" value="">
                            </div>
                          </div>
                            <div><span class="bi-slash-lg"></span></div>
                            <div class="css-1dkwuq4 e1uzxhvi6">
                              <div>
                                <input data-testid="input-box" id="birthDay" name="birthDay" placeholder="DD" type="text" class="birthFrmGroup" value="">
                              </div>
                            </div>
                        </div>

                      </div>
                      <div class="form3"></div>
				</div>
                            <hr>

                            <div class="form-group d-flex align-content-between" >
                                <div class="form1" style="margin-left: 20px;">
                                    <small><b>이용약관동의</b></small>
                                </div>
                                
                                <div class="form-group" style="width: 80%;">
                                    <div class="form-check">
                                        <label for="allchk">
                                            <div class="agreeleft" style="margin-top: 0px;">
                                                <input type="checkbox" class="allchk" id="allchk" name="allchk">
                                                <i class="circle"></i>
                                                <span class="agreeleft">전체동의합니다</span>
                                            </div>
                                        </label>
                                        <p class="text-left"><small style="font-weight: lighter; letter-spacing: -1px;">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</small></p>
                                    </div>
                                    <div class="form-check">
                                        <label for="agree1">
                                            <div class="agreeleft">
                                            <input type="checkbox" class="chk" name="agree1" id="agree1">
                                                <i class="circle"></i>
                                                <span class="agreetext">이용약관 동의</span><span class="text-secondary agreetext font-weight-bold">(필수)</span>
                                                <button type="button" class="btn agreetext font-weight-bold" data-toggle="modal" data-target="#agreeModal1">약관보기></button>
                                                <div class="modal fade" id="agreeModal1">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                      <div class="modal-content">
                                                      
                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">이용약관(필수)</h4>
                                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                                        </div>
                                                        
                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                          Modal body.. <!-- 내용불러오기 -->
                                                        </div>
                                                        
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer"  style="text-align: center;">
                                                            <div class="modalBtn"><button type="button" class="btn" data-dismiss="modal" style="color:purple;">확인</button></div>
                                                        </div>
                                                        
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label for="agree2">
                                            <div class="agreeleft">
                                                <input type="checkbox" class="chk" name="agree2" required="required" id="agree2">
                                                <i class="circle"></i>
                                                <span class="agreetext">개인정보 수집.이용 동의</span><span class="text-secondary agreetext font-weight-bold">(필수)</span>
                                                <button type="button" class="btn agreetext font-weight-bold" data-toggle="modal" data-target="#agreeModal2">약관보기></button>
                                                <div class="modal fade" id="agreeModal2">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                      <div class="modal-content">
                                                      
                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">개인정보 수집.이용 동의(필수)</h4>
                                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                                        </div>
                                                        
                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                          Modal body.. <!-- 내용불러오기 -->
                                                        </div>
                                                        
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer"  style="text-align: center;">
                                                            <div class="modalBtn"><button type="button" class="btn" data-dismiss="modal" style="color:purple;">확인</button></div>
                                                        </div>
                                                        
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div> 
                                    <div class="form-check">
                                        <label for="agree3">
                                            <div class="agreeleft">
                                                <input type="checkbox" class="chk" name="agree3" id="agree3">
                                                <i class="circle"></i>
                                                <span class="agreetext">개인정보 수집.이용 동의</span><span class="text-secondary agreetext">(선택)</span>
                                                <button type="button" class="btn agreetext font-weight-bold" data-toggle="modal" data-target="#agreeModal1">약관보기></button>
                                                <div class="modal fade" id="agreeModal1">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                      <div class="modal-content">
                                                      
                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">이용약관(선택)</h4>
                                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                                        </div>
                                                        
                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                          Modal body.. <!-- 내용불러오기 -->
                                                        </div>
                                                        
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer"  style="text-align: center;">
                                                            <div class="modalBtn"><button type="button" class="btn" data-dismiss="modal" style="color:purple;">확인</button></div>
                                                        </div>
                                                        
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div> 
                                    <div class="form-check">
                                        <label for="agree4">
                                            <div class="agreeleft">
                                                <input type="checkbox" class="chk" name="agree4" id="agree4">
                                                <i class="circle"></i>
                                                <span class="agreetext">본인은 만14세 이상입니다.</span><span class="text-secondary agreetext font-weight-bold">(필수)</span>
                                            </div>
                                        </label>
                                    </div> 
                                
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-8 col-xs-offset-4 text-center">
                                    <button type="button" onclick="signupChk()" class="btn text-center" style="background-color: #692498; color: white; width: 240px; height: 56px;"><b>가입하기</b></button>
                                </div>  
                            </div>

                        </form>
                    </div>
				</div> <!-- signupFrmcontainer-->  
				
				<div class="signupResultArea text-center hide">
					<h3>회원가입 성공</h3>
					<br>
					<div><div>아이디</div><div><span id="signupId"></span></div></div>
					<br>
					<div class="col-xs-8 col-xs-offset-4 text-center">
                         <button type="button" onclick="login()" class="btn text-center" style="background-color: #692498; color: white; width: 240px; height: 56px;"><b>콜라비와 쇼핑하기</b></button>
                    </div>  
				</div>
				
                </div> <!-- content-container -->
           
            </div><!-- col-8 -->
            
            <div class="col-2"></div>
          
        </div>

    </div>
    
    <footer>
   		<%@ include file= "../common/footer.jspf" %>
		<%-- <jsp:include page="../common/footer.jspf" flush="true" /> --%>
    </footer>
    
</body>
</html>
