function confirmEmail () {
	 var email = document.getElementById("email");	

	if (email.value == ""){ //script 파일에 있는 jquery 객체임
		alert("이메일을 입력하세요");
		email.focus(); 
		return false;
	} else {
		let mvo = { email: email.value }   
		console.log("mvo : " + mvo.email)

		$.ajax("confirmEmailAjax.do",{
			type: "post",
			data: JSON.stringify(mvo),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
					/* alert("성공"); */
					console.log("data: " +data);
					
					//중복확인결과
				    let duplicateMsg = document.querySelector('.duplicateEmail-message');
				    let availableMsg = document.querySelector('.availableEmail-message');
	
				    if(data == false){
						console.log("이메일 중복");
						alert("이메일 중복");
						email.value = "";
						email.focus();
						return false;
					}
					if(data == true){
						console.log("사용가능 이메일");
					/* 	availableMsg.classList.remove('hide');
						duplicateMsg.classList.add('hide'); */
						return false;
					}
			},
			erroer: function(){
				alert("실패");
			}
		}); //ajax끝
	}// else 끝
}
