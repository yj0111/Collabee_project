<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


	function publish_coupon(frm){
		frm.submit();
	}
</script>
</head>

<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">

	<div class="container-fluid">
	 <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>
    <!-- 사이드바 -->
    <div class="row" style="padding-top:50px; padding-bottom: 50px">
	    <div class="col-sm-2"></div>
	    <div class="col-sm-2">
	        	<%@ include file = "./adminSideNav.jspf" %>
	    </div>
	
    <!-- 메인 -->
    <div class="col-sm-6">
        <div style="width: 800px;">
        <div class="main" style="border-bottom:2px solid black";>
            <h4>쿠폰 발행</h4>
        </div>
        <br>
            <form action="couponsInsert.do" id="insert-coupon-form" method="get">
					<!-- 쿠폰번호 <input class="form-control form-control" name="couponNum" disabled/>
					<br> -->
					쿠폰명 <input type="text" class="form-control form-control" name="couponName" autofocus placeholder="쿠폰명을 입력하세요."/>
					<br>
					할인금액 <input type="text" class="form-control form-control" name="disPrice" placeholder="할인금액을 입력하세요."/>
					<br>
					수량 <input type="text" class="form-control form-control" name="count" placeholder="발행할 쿠폰의 수량을 입력하세요."/>
					<br>
					유효기간 <input type="date" class="form-control form-control" name="couponDate" placeholder="쿠폰의 유효(사용)기간을 입력하세요."/>
					<br>
					최소 구매금액 <input type="text" class="form-control form-control" name="leastCost" placeholder="최소 구매금액을 입력하세요."/>
					<br>    
			        <div class="col-sm-2"></div>
					<div style="display: flex; justify-content: center;">
	 					<button type="button" class="btn" onclick="publish_coupon(this.form)" style="border: none; color: white;">쿠폰등록</button> &nbsp;&nbsp;
						<input type="reset" class="btn" style="border: none; color: white;" value="초기화">
					</div>
				</form>
        <div class="col-sm-2"></div>
        </div>
    </div>
    </div>
    
  </body>
	<br><br>
  <!-- footer -->
  <footer>
	<%@ include file = "../common/footer.jspf" %>	
  </footer>
</html>
