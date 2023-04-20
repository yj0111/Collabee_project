<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://kit.fontawesome.com/ae242928e2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css" type="text/css">
    
	<%@ include file = "../common/bootstrap.jspf" %>
	
<style>

    

    .coupon-img {
        margin-bottom: 20px;
    }

    .coupon-img img {
        width: 100%;
    }

    .event-title {
        margin: 20px 0px;
        font-size: 30px;
    }

	#coupon-box {
		display: flex;
        flex-wrap: wrap;
	}
    #coupon-inner {
        width: 380px;
        justify-content: space-between;
        margin: 20px 0px;  
        margin-right: 30px;
    }

    #coupon-box .coupon-container {
        width: 380px;
        height: 200px;
        border: solid 1px var(--font-faint-color);
        margin-bottom: 20px;
        padding: 20px;
    }

    #coupon-box .coupon-container div {
        margin: 10px;
    }
    #coupon-box .coupon-container div:nth-child(4) {
        display: flex;
        justify-content: space-between;
    }

    #coupon-box .coupon-container button {
        border: none;
        background-color: var(--main-color);
        color: var(--font-white-color);
        width: 100px;
        height: 50px;
        border-radius: 10px;;
    }
</style>

<script>
	function getCoupon(couponNum) {
		
		
		if(${loginMember eq null}) {
			alert("로그인 후 이용 가능합니다");
			location.href = "${pageContext.request.contextPath }/member/login.do";
			return;
		}
		

		let memberNum_val = Number('${loginMember.memberNum }');
    	let couponNum_val = Number(couponNum);
		
		let obj = {	memberNum : memberNum_val,
					couponNum : couponNum_val
		};
		
		$.ajax("../coupons/insertCouponIntoCustom.do", {
			type: "get",
			data: obj,

			contentType: "application/json",
			dataType: "json",
			success: function(data){
				if (data.state != null && data.state == "exist") {
					$('#doubleCouponAlert').modal('show');
				} else {
					$('#getCouponAlert').modal('show');
				}
			},
			error: function(){
			}
		});  
	}
</script>
</head>
<body style="width:1900px; margin: auto; margin-top: 50px;">

	<!-- 쿠폰받기 확인 모달 -->
	<%@ include file = "../common/modal/getCouoponAlert.jspf" %>
	<%@ include file = "../common/modal/doubleCouponAlert.jspf" %>
	 <button type="button" id="getCouoponAlertBtn" data-toggle="modal" data-target="#getCouoponAlert" data-result="" style="display: none;"></button>

    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>




    <!-- 쿠폰 이미지 -->

    <section>
	    <div class="row">
	        <div class="col-sm-2"></div>
	        <div class="col-sm-8">
                <div class="event-title">받을 수 있는 쿠폰 목록</div>
	            <div id="coupon-box">	                
	                <c:forEach var="coupon" items="${couponsList }">
		                <div id="coupon-inner">
		                    <div class="coupon-container">
		                        <div class="--font-mid --strong"> ${coupon.couponName } </div>
		                        <div class="--font-small"><fmt:formatDate value="${coupon.couponDate }" pattern="yyyy-MM-dd" />까지</div>
		                        <div class="--font-large --strong"><fmt:formatNumber value="${coupon.disPrice }" pattern="#,###" />원</div>
		                        <div><span class="--font-small --color-gray"><span><fmt:formatNumber value="${coupon.leastCost }" pattern="#,###" /></span>원 이상 구매시 적용</span> 
		                        <button onclick="getCoupon(${coupon.couponNum })">쿠폰받기</button>
	                        	</div>
	                    	</div>
                    	</div>
	                </c:forEach>
                </div>
	                
	
	            <div class="event-title" style="display: block;">진행중인 이벤트</div>
	
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/1.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/2.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/3.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/4.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/5.avif">
	            </div>
	            
	        </div>
	        <div class="col-sm-2"></div>
	    </div>
	</section>
    


    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>

</body>
</html>