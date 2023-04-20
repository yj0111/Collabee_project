<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8" />
    <title>콜라비</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <%@ include file = "../common/bootstrap.jspf" %>
    
    <style>

        .list-group-item a{
        text-decoration: none;
        color:black;
        }
        .list-group-item:hover {
        background-color: #FEF7FF;
        }     
        .list-group-item:hover > a {
        font-weight: bold;
        text-decoration: none;
        color:#B03FE3;
        }
        .list-group-item:hover > span {
        font-weight: bold;
        text-decoration: none;
        color:#B03FE3;
        }
        .list-group-item a {
        width: 100%;
        display: block;
        }
        li span{font-size: large;
        font-weight: bold;
        color: black;
        }
        h2{
        font-weight: bold;
        }
        h4{
        font-weight: bolder;
        } 
        h4 span{
        vertical-align: middle;
        font-size: small;
        color: gray;
        }
        .main{
        padding-bottom: 24px;
        padding-top: 10px ;
        }
        .btn {
            background-color: #9A30AE;
            color: none;
        }
        button {
            border: none;
            box-shadow:none !important;
        }
        .inquiry_btn{
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        width: 120px;
        height: 44px;
        border-radius: 3px;
        color: rgb(255, 255, 255);
        background-color: #9A30AE;
        border: 0px none;
        font-size: small;
        float: right;
        }
        button:hover {
        background-color: none;
        }

        /* 쿠폰등록 전용 css*/

</style>  

<script>
function setThumbnail(event) {
    var fileUpload = event.target.parentNode; //이벤트 대상자의 부모
    var reader = new FileReader();

    reader.onload = function(event) {
    var img = document.createElement("img");
    fileUpload.appendChild(img);
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", 200);
    img.setAttribute("class", "pre_img");
    };
    reader.readAsDataURL(event.target.files[0]);
}


	function edit_coupon() {
		$(".edit-form").each(function(){
			$(this).attr("disabled", false);
		});
		
		$(".first-show").each(function(){
			$(this).css("display", "none");
		});
		$(".second-show").each(function(){
			$(this).css("display", "inline-block");
		});
	} 
	
	function edit_coupon2() {
		$(".edit-form").each(function(){
			$(this).attr("disabled", true);
		});
		
		$(".first-show").each(function(){
			$(this).css("display", "inline-block");
		});
		$(".second-show").each(function(){
			$(this).css("display", "none");
		});
	}


	function update_coupon(){
		location.href = "couponsModify.do?couponNum=${coupons.couponNum }";
	}
	
	
	/* const input = document.querySelector('#number');
		input.addEventListener('keyup', function(e) {
			let value = e.target.value;
			value = Number(value.replaceAll(',', ''));
			if(isNan(value)) {
				input.value = 0;
			} else {
				const formatValue = value.toLocaleString('ko-KR');
				input.value = formatValue;
			}
	}); */
</script>
</head>

<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">

	<div class="container-fluid">
	<!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>
	

    <!-- 사이드바 -->
    
    <script>
    	function update_coupon(frm){
    		console.log(frm);
    		frm.submit();
    	}
    </script>

    <div class="row" style="padding-top:50px; padding-bottom: 50px">
	    <div class="col-sm-2"></div>
	    <div class="col-sm-2">
	        	<%@ include file = "./adminSideNav.jspf" %>
    	</div>


	    <!-- 메인 -->
	    <div class="col-sm-6">
	        <form action="couponsModify.do" id="coupon-form" method="post">
	        	<div style="width: 800px;">
			        <div class="main" style="border-bottom:2px solid black";>
			            <h4 class="first-show">쿠폰 조회</h4>
			            <h4 class="second-show" style="display: none;">쿠폰내용 변경</h4>
			        </div>
			        <br>
			                쿠폰번호 <input type="number" class="form-control" name="couponNum" value="${coupons.couponNum}" readonly/>
			                <br>
			                쿠폰명 <input type="text" class="form-control edit-form" name="couponName" value="${coupons.couponName}" disabled/>
			                <br>
			                할인금액 <input type="number" id="number" class="form-control edit-form" name="disPrice" value="${coupons.disPrice}" disabled/>
			                <br>
			                수량 <input type="number" class="form-control edit-form" name="count" value="${coupons.count}" disabled/>
			                <br>
			                유효기간 <div class="form-control first-show" style="display: inline-block;">
			                <fmt:formatDate value="${coupons.couponDate }" pattern="yyyy-MM-dd" />
		                </div>
		                <input type="date" class="form-control edit-form second-show" name="couponDate" style="display: none;"/>
			                
			                <br>
			                <br>
			                최소 구매금액 <input type="number" id="number" class="form-control edit-form" name="leastCost" value="${coupons.leastCost}" disabled/>
			                <br>  
			<!-- ${fn:substring(content.couponDate,0,10) } -->
				    <div style="display: flex; justify-content: center;">
				        <button id="coupon-edit-btn" class="inquiry_btn first-show" onclick="edit_coupon()" type="button" style="width: 60px; height: 44; border-radius: 3; margin-left: 10px; font-size: 15px;">수정</button>
				        <button class="inquiry_btn first-show" onclick="javascript:location.href='couponsDelete.do?couponNum=${coupons.couponNum }'" type="button" style="width: 60px; height: 44; border-radius: 3; margin-left: 10px; font-size: 15px;">삭제</button>
				        <button class="inquiry_btn second-show" onclick="update_coupon(this.form)" type="button" style="width: 60px; height: 44; border-radius: 3; margin-left: 10px; font-size: 15px; display: none;">저장</button>
				        <button id="cancle" class="inquiry_btn second-show" onclick="edit_coupon2()" type="button" style="width: 60px; height: 44; border-radius: 3; margin-left: 10px; font-size: 15px; display: none;">취소</button>
				    </div>
			    </div>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
  <br><br>
    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
</html>
