<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberCSS/findPw.css">

<script>
$(function(){ //document load
    var id = document.getElementById("id");
    var email = document.getElementById("email");
    var code;
   	var findPassword;
    
    
    // 아이디, 이메일 확인메시지
    let failid =  document.querySelector('.idmismatch-message');
    let failemail =  document.querySelector('.emailmismatch-message');

    id.onkeyup = function () {
      if (isMoreThan4Length(id.value)){
        failid.classList.add('hide')
      } else {
        failid.classList.remove('hide')
      }
    }
    function isMoreThan4Length(value) {
        return value.length >= 4
    }

    email.onkeyup = function () {
      if (email_check(email.value)) {
        failemail.classList.add('hide')
      } else {
        failemail.classList.remove('hide')
      }
    }  
    //이메일 정규식
    function email_check(email) {
      var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      return (email != '' && email != 'undefined' && regex.test(email));
    }

  });

  function emailAuth () {
    alert("비밀번호찾기");

    var id = document.getElementById("id");
    var email = document.getElementById("email");
    var showResult = document.getElementById("showResult"); // 비번 확인 창

    if (id.value == "") {
      alert("아이디 입력하세요.");
      id.focus();
      return false;
    }

    if (email.value == "") {
        alert("이메일 주소를 입력하세요.");
        email.focus();
        return false;
    }
	
    //전달 데이터확인
    //console.log("아이디 : -" + id.value + "-");
    //console.log("이메일 : -" + email.value + "-");

    var mvo = { id: id.value, email: email.value };
	$.ajax("findPwAjax.do", {
		type: "post",
		data: JSON.stringify(mvo), // 서버쪽으로 JSON 문자열 전달 
		contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
		dataType: "json", //서버로부터 응답받는 데이터형식
		success: function(data) {
			console.log(data);			
			if (data.password === null) {
				alert("정보를 다시 입력해주세요");
				emailFrm.reset();
				id.focus();
				return false;
			} 
			if (data != null) { //회원데이터가 있는 경우
				findPassword = data.password; // 이메일 인증성공시 보여줄 password 
				//console.log("findPwAjax 실행후 받은 pw :" + findPassword);
				var findPwArea = $('.findPwArea');
				var mailAuthArea = $('.mailAuthArea');
				var mvo = { id: id.value, email: email.value }
				//alert("이메일인증시도(mvo): " +JSON.stringify(mvo));
				$.ajax("mailAuthAjax.do",{
					type: "post",
					data: JSON.stringify(mvo), // 서버쪽으로 JSON 문자열 전달 
					contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
					dataType: "json", //서버로부터 응답받는 데이터형식
					success: function(data) {
						//alert("mailAuthAjax return data : " + data);
						findPwArea.toggleClass('hide'); //안보임
						mailAuthArea.toggleClass('hide'); //보임
						code = data;
						alert("인증번호가 전송되었습니다");	
					},
					error: function() {
						alert("이메일 인증 발송 실패");
					}
					
				});//end of mailAuthAjax
				return false;
			}

		},
		error: function() {
			alert("회원정보 조회 실패");
		}		
	}); //end of findPwAjax
    
  }// emailAuth ()
  
  
  function authChk() {
	//alert("authChk 클릭");
	var resultArea = $('.resultArea'); // 인증완료 후 비밀번호 확인
	var mailAuthArea = $('.mailAuthArea'); // 인증완료 후 비밀번호 확인
	var authNum = $('#authNum').val();
	//인증결과 메시지
	const correct = $('.correct-message'); //이메일 인증 성공
	const mismatch = $('.mismatch-message'); //이메일 인증 실패
	alert("authNum:" + authNum +", code : " + code);
	  if(String(authNum) ===String(code)){
		  	//alert("이메일인증성공 findPassword: " + findPassword);
			resultArea.toggleClass('hide');
			mailAuthArea.toggleClass('hide');
			showResult.setAttribute("value", findPassword);	
			
		}else{
			alert("인증번호가 다릅니다.");
			mismatch.toggleClass('hide');
			$('#authNum').val(''); //jQuery값 초기화
			return false;
		}
  }//authChk()
  

   function loginPageGo() {
	location.href = "../member/login.do";  
  }
  
</script>

</head>
<body>
   <header style="margin-bottom: 100px">
		<%@ include file= "../common/header.jspf"%>
    </header>
    <div id="container">
        <div class="row">
            <div class="col-sm-2"></div>
            
            <div class="col-sm-8">

              <div>
                  <h4 class="text-center" style="font-weight: bold; padding-bottom: 50px;">비밀번호 찾기</h4>
              </div>
              
              <div id="authBox" style="width: 400px; margin: auto;">
      
                <div class="findPwArea " id="findPwArea">
                  <form name="findPwFrm">
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요">
                        <div class="idmismatch-message hide	purple-message">가입시 등록한 아이디를 기입해주세요</div>
                    </div>
                    <div class="form-group">
                      <label for="email">이메일</label>
                      <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요">
                      <div class="emailmismatch-message hide red-message">가입시 등록한 이메일을 기입해주세요</div>
                    </div>

                    <div class="text-center">
                      <div><button type="button" id="authbtn" onclick="emailAuth()">이메일 인증</button></div>
                    </div>
                  </form>
                </div> <!-- findPwArea -->
                
                <div class="mailAuthArea hide">
                <br>
                <div>
					<input class="form-control mailChk" id="authNum" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
                </div>
                <div  style="margin-left:30px">
                	<button type="button" id="authChkbtn" onclick="authChk()" >인증번호 확인</button>
                </div>
				<div>
					<div class="correct-message hide purple-message">인증번호가 일치합니다</div>
					<div class="mismatch-message hide red-message">인증번호를 확인해주세요</div>
				</div>
				</div> <!-- mailAuthArea -->
					                
			
				<div class="resultArea hide" id="resultArea">
					<div class="text-center">비밀번호 확인</div>
					<div><input type="text" id="showResult" readonly class="form-control-plaintext text-center" value=""></div>
					
					<div class="text-center">
                      <div><button type="button" id="authbtn" onclick="loginPageGo()">확인</button></div>
                    </div>
				</div>
				

              </div>
            </div>
            
            <div class="col-sm-2"></div>
        </div>
        
    </div>    
    
    
    <footer style="margin-top: 200px">
		<%@ include file= "../common/footer.jspf" %>
		
    </footer>
</body>
</html>