<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>

	<%@ include file= "../common/bootstrap.jspf"%>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberCSS/findId.css">

<script>
$(function(){ //document load
    var name = document.getElementById("name");
    var email = document.getElementById("email");
    
    // 이름, 이메일 확인메시지
    let failname =  document.querySelector('.namemismatch-message');
    let failemail =  document.querySelector('.emailmismatch-message');

    name.onkeyup = function () {
      if (isMoreThan2Length(name.value)){
        failname.classList.add('hide')
      } else {
        failname.classList.remove('hide')
      }
    }
    function isMoreThan2Length(value) {
        return value.length >= 2
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

    ("#showResult").attr("value",findId)
	

    
});

  function findId () {
    //alert("아이디 찾기");
    var name = document.getElementById("name");
    var email = document.getElementById("email");
    var showResult = document.getElementById("showResult"); // 아이디 확인
    let findIdFrm = document.findIdFrm;
    
    if (name.value == "") {
        alert("이름을 입력하세요.");
        name.focus();
        return false;
    }

    if (email.value == "") {
        alert("이메일 주소를 입력하세요.");
        email.focus();
        return false;
    }

    //전달 데이터확인
    //console.log("-" + document.findIdFrm.name.value + "-");
    //console.log("-" + document.findIdFrm.email.value + "-");

    let mvo = { name: name.value, email: email.value }
   
	$.ajax("findIdAjax.do", {
		type: "post",
		data: JSON.stringify(mvo), // 서버쪽으로 JSON 문자열 전달 
		contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
		dataType: "json", //서버로부터 응답받는 데이터형식
		success: function(data) {
			console.log(data.id);
			var findId = data.id;
			//console.log("아이디 *처리 : "+findId)
			if (data.id == null) {
				alert("회원정보를 확인 후 다시 입력해주세요");
				findIdFrm.reset();
				name.focus();
				return false;
			} else {
				//alert("아이디 찾음");				
				document.getElementById("emailAuthArea").classList.add('hide');
				document.getElementById("resultArea").classList.remove('hide');
				$('#showResult').html(findId);
				return false;
			}

		},
		error: function() {
			alert("실패");
		}
		
	});
    
  }// findId()
  
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
                  <h4 class="text-center" style="font-weight: bold; padding-bottom: 50px;">아이디 찾기</h4>
              </div>
              
              <div id="authBox" style="width: 400px; margin: auto;">
     
                <div class="emailAuthArea" id="emailAuthArea">
                  
                  <form name="findIdFrm" method="post">
                    <div class="form-group">
                        <label for="name" >이름</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요">
                        <div class="namemismatch-message hide">가입시 등록한 이름을 기입해주세요</div>
                    </div>
                    <div class="form-group">
                      <label for="phone">이메일</label>
                      <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요">
                      <div class="emailmismatch-message hide">가입시 등록한 이메일을 기입해주세요</div>
                    </div>

                    <div class="text-center">
                      <div><button type="button" id="authbtn" onclick="findId()">확인</button></div>
                    </div>
                  </form>
                </div>
		
				<div class="resultArea hide" id="resultArea">
		
					<div class="text-center"  style="margin-bottom:20px" >
					<!-- <b><input type="text" id="showResult" readonly class="form-control-plaintext text-center"  value=""></b> -->
						<b><span id="showResult"></span></b>
					</div>
					
					<div class="text-center">
                      <div><button type="button" id="authbtn" onclick="loginPageGo()">로그인 하기</button></div>
                    </div>
				</div>

              </div>
            </div> <!--  <div class="col-sm-8"> -->
            
            <div class="col-sm-2"></div>
        </div>
        
    </div>    
    
    
    <footer style="margin-top: 200px">
		<%@ include file= "../common/footer.jspf" %>
    </footer>
</body>
</html>