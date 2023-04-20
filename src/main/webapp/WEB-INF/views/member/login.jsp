<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>
	
	<script src="${pageContext.request.contextPath }/resources/js/mypageScript.js"></script>

<style>
	header {
		margin-bottom:100px;
	}
	footer {
		margin-top:100px;
	}
      input{
        width: 340px;
        height: 54px;
        padding: 0px 11px 1px 15px;
        margin-bottom: 10px;
      }
      .text-center{
        margin: 3px;
      }
      .text-right{
        width: 340px;
        text-align: right; 
        margin: auto;
      }

      form {
        margin: auto;
        width: 640px;
      }
      #fillbtn {
        background-color: #692498; 
        color: white; 
        width: 240px; 
        height: 56px;
      }
      #borderbtn {
        background-color: white; 
        color: #692498; 
        border:0.5px solid #692498; 
        width: 240px; 
        height: 56px;
      }
      a{
        text-decoration: none;
      }

</style>
<% String findIdLocation = "findId.do";  %>
<% String findPwLocation = "findPw.do";  %>
<% String result = request.getParameter("result"); %>

<!--  카카오로그인-->  
<% String code = (String)request.getAttribute("code");%>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js" integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
<!-- 네이버로그인 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
  Kakao.init('59184fe7137fbddc12ce3777347a15a4'); //SDK초기화 사용하려는 앱의 JavaScript 키 입력
  console.log(Kakao.isInitialized());
</script> 

<script>
	//카카오 로그인 버튼 클릭
	function loginWithKakao() {
		Kakao.Auth.authorize({
			redirectUri: 'http://localhost:8080/collabee/member/loginWithKakao.do',
			scope: 'account_email,gender'
		});
	
  	}

	//네이버 로그인 버튼 클릭
	function loginWithNaver() {
		location.href='https://nid.naver.com/oauth2.0/authorize?'
					+ 'response_type=code&client_id=buqjifQ22odVst5wLWTD&state=collabeeState&'
					+ 'redirect_uri=http://localhost:8080/collabee/member/loginWithNaver.do'
	}	
	

</script>



<script>
$(function(){
	var id = document.getElementById("id");
	var password = document.getElementById("password");	
    var loginFrm = document.getElementsByName("loginFrm");
    var loginResult = <% request.getAttribute("result");%>
    var loginMember = ${loginMember };
    
    //var mvo = $("#mvo").val();
	console.log('로그인페이지 loginMember : ' + loginMember);
	
 	if  (loginMember != null) {
		alert("잘못된 접근입니다. 메인화면으로 이동합니다.");
		location.href = "../collections/main.do";
	}
 	if (loginResult == false) {
		alert("콜라비 회원이 아닙니다. <br>회원가입 후 카카오 로그인을 실행해주세요.");
	} 

	
});
</script>

<script>
	function login() {
		var id = document.getElementById("id");
		var password = document.getElementById("password");	
		
		let mvo = { id : id.value , password : password.value }; 
		console.log(mvo);
		console.log(JSON.stringify(mvo)); // JS객체를 JSON 문자열로 바꿔줄 수 있음
		
		$.ajax("loginAjax.do", {
			type: "post",
			data: JSON.stringify(mvo), // 서버쪽으로 JSON 문자열 전달 
			contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
			dataType: "json", //서버로부터 응답받는 데이터형식
			success: function(data) {
				console.log("loginAjax.do 실행>>");
				console.log(data);
				
				if (data.result == "N") {
					alert("로그인 정보를 확인하세요");
					loginFrm.reset();
					id.focus();
					return false;
				} else if (data.result == "L") {
					alert("탈퇴한 회원입니다.");
					loginFrm.reset();
					return false;
				} else if (data.result == "D") {
					alert("휴면회원입니다.");					
					return false;
				} else if (data.result == "A") {
					loginFrm.action = "sessionSetLoginMember.do";
					loginFrm.submit();
					return false;					
				}

					
			},
			error: function() {
				alert("실패");
			}
			
		});
	}
	
	function signup() {
	  location.href = "../member/signup.do";
	}
	
		
</script>

</head>
  	<header>
  		<%@ include file= "../common/header.jspf"%>
    </header>
<!-- <b>Session에 저장된 \${loginMember } : ${loginMember }</b -->
	
    
    <div id="container">
    
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
              <div id="container">
                  <h4 class="text-center" style="padding-bottom: 50px; font-weight: bold; padding-bottom: 50px;"">로그인</h4>
              </div>

                <div class="form-group">
                  <form name="loginFrm" method="post">
                    <div class="col-xs-8 col-xs-offset-4 text-center">
	                   <div><input type="hidden" id="mvo" value="${mvo}"></div>
                      <div><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" onKeyPress="if( event.keyCode==13 ){login();}"></div>
                      <div><input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요" onKeyPress="if( event.keyCode==13 ){login();}"></div>
                    </div>
                    <div id="findArea" class="text-right" style="margin-bottom: 20px;">
                      <a href="<%= findIdLocation %>" class="text-dark"><small>아이디 찾기</small></a>
                      <span class="text-dark"><small>|</small></span>
                      <a href="<%= findPwLocation %>" class="text-dark"><small>비밀번호 찾기</small></a>
                    </div>
                    <div class="form-group">
                      <div class="text-center">
                          <button type="button" class="btn text-center" id="fillbtn" style="width: 340px; height: 54px;" onclick="login()"><b>로그인</b></button>
                      </div>  
                      <div class="text-center">
                          <button type="button" class="btn text-center" id="borderbtn" style="width: 340px; height: 54px;" onclick="signup()"><b>회원가입</b></button>
                      </div>  
                      <div class="text-center" style="padding-top:20px; border-bottom: 1px solid grey; width: 340px; margin: auto;" >
                      	<small>소셜로그인</small>
                      	<br>
                      </div>
                      	
                      <div class="text-center">
                      	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
                      	<img src="${pageContext.request.contextPath }/resources/imgs/member/kakaoBtn.png" width="140px" height="50px" alt="카카오 로그인 버튼" /></a>
                      	<a id="naver-login-btn" href="javascript:loginWithNaver()">
                      	<img src="${pageContext.request.contextPath }/resources/imgs/member/naverBtn.png" width="140xp" alt="네이버 로그인 버튼" /></a>
                      </div>
                    </div>

                  </form>
                </div>
              

            </div>

            
            <div class="col-sm-2"></div>
        </div>
    </div>    
    
    
    <footer>
		<%@ include file= "../common/footer.jspf" %>
    </footer>

</body>
</html>