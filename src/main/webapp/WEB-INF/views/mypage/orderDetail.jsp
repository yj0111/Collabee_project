<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/orderDetail.css">
	
<script>
$(function(){
	
	var orderInfo = { 	"memberNum" : ${loginMember.getMemberNum()},
						"orderNum" : <%= request.getParameter("orderNum") %>};
	console.log("주문 상세페이지>>!!orderNum : " +  <%= request.getParameter("orderNum") %>);
	//주문목록 불러오기
	$.ajax("getOrderDetailAjax.do",{ 
		type: "post",
		data: JSON.stringify(orderInfo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			//alert("주문내역 불러오기 성공"); 		
			console.log(data);
			
			var htmlTag1 = '';
			var htmlTag2 = '';
			var orderNum = data;
			$.each(data, function(index, orderList){ 
				htmlTag1 += '<div class="order-list-continer d-flex align-content-between">';
				
				htmlTag1 += '<div class="order-item">'
								+ '<img src="${pageContext.request.contextPath }/resources/imgs/goods/'+ orderList.thumSysFilename +'" alt="'+ orderList.thumSysFilename +'" class="order-item-thumb">'
								+ '<dl class="order-item-info">'
									+ '<dt class="order-item-name">' + orderList.productName + '</dt>'
								+ '</dl>'
								+	'<dl class="order-item-info">'
                  					+ '<dt class="order-item-price">' + orderList.price + '원 | ' + orderList.count + ' 개 </dt>'
                  				+ ' </dl>'
                  		 + '</div>';
                  		
				htmlTag1 += '<div class="order-item-status">' + orderList.deliveryStatus + '</div>'
	              				+ '<div class="order-item-addCart">'
	             			 		+ '<button type="button" class="btn purpleBtn" onclick="reAdd(' + orderList.productNum + ')"><span>장바구니 담기</span></button>'
						        + '</div>'
					        + '</div>';
					        
					        
		        if(index == 0){ 
					htmlTag2 += '<div><h5 class="infoTitle">결제정보</h5></div>';
					htmlTag2 +=  '<ul class="infoContent">';
					htmlTag2 += '<li>'
								 + '<span class="title1">상품금액</span>'
								 + '<span class="content">' + orderList.totGoodsprice + '<span class="content">원</span> </span>'
							 + '</li>';
							 
					htmlTag2 += '<li><span class="title1">배송비</span>'
								+ '<span class="content">' + orderList.deliveryFee + '<span class="content">원</span> </span>'
								+ '</li>';
						
					htmlTag2 += '<li><span class="title1">결제금액</span>'
	               				  + '<span class="content">' + orderList.totPrice + '<span class="content">원</span></span>'
				               + '</li>';
				               
					htmlTag2 +=  '<li><span class="title1">적립금액</span>' 
					    				+ '<span class="content">' + orderList.amount + '<span class="content">원</span></span>'
								+ '</li>';
								
					htmlTag2 += '<li><span class="title1">결제방법</span>'
									+'<span class="content">' + orderList.ptDetailname + '</span>'
	                			+'</li>';	
	                
					htmlTag2 += '</ul>';
	
	
	            <!-- 주문정보 / 주문번호, 주문자, 결제 일시 -->
		            htmlTag2 += '<div><h5 class="infoTitle">주문정보</h5></div>'
					htmlTag2 += '<ul class="infoContent">';
					htmlTag2 += '<li>'
								+ '<span class="title2">주문번호</span>'
								+ ' <span class="content">' + orderList.orderNum + '</span>'
							+ ' </li>';	
					htmlTag2 += '<li>'
								+ '<span class="title2">보내는 분</span>'
								+ ' <span class="content">' + orderList.orderName + '</span>'
							+ ' </li>';	
					htmlTag2 += '<li>'
								+ '<span class="title2">결제일시</span>'
								+ ' <span class="content">' + orderList.orderDate + '</span>'
							+ ' </li>';	
					htmlTag2 += '</ul>';
	            
	            <!-- 배송정보 / 받는사람, 연락처 주소, 장소 포장?-->
					htmlTag2 += '<div class="css-1bsokvi e1jm6dy15"><h5 class="infoTitle">배송정보</h5></div>';
	           
					htmlTag2 += '<ul class="infoContent">';
					htmlTag2 += '<li>'
								+ '<span class="title2">받는분</span>'
								+ ' <span class="content">' + orderList.orderName + '</span>'
							+ ' </li>';	
					htmlTag2 += '<li>'
								+ '<span class="title2">핸드폰</span>'
								+ ' <span class="content">' + orderList.orderPhone + '</span>'
							+ ' </li>';	
					htmlTag2 += '<li>'
								+ '<span class="title2">주소</span>'
								+ ' <span class="content">' + orderList.orderAddr + ' ' + orderList.orderAddrDetail + '</span>'
							+ ' </li>';	
					htmlTag2 += '<li>'
								+ '<span class="title2">받으실 장소</span>'
								+ ' <span class="content">' + orderList.orderPlace + '</span>'
							+ ' </li>';	
					htmlTag2 += '<li>'
								+ '<span class="title2">공동현관 출입방법</span>'
								+ ' <span class="content">' + orderList.orderRequest + '</span>'
							+ ' </li>';	
					htmlTag2 += '<li>'
								+ '<span class="title2">포장 방법</span>'
								+ ' <span class="content">' + orderList.condition + '</span>'
							+ ' </li>';	
					htmlTag2 += '</ul>';
		        }
           
			$("#orderDetail1").html(htmlTag1);   
			$("#orderDetail2").html(htmlTag2);   
			
			}); //$.each()끝
           
		},
		error: function(){
			alert("주문내역을 불러올 수 없습니다.")
		}
	});//ajax끝
	
	
});
</script>

<script>
	//1:1문의 이동
	function inquiry() {
		location.href="../inquiry/inquiry.do";
	}


	//개별 상품 다시 담기
	function reAdd(goodsNum) {
		// 상품 개수
		var goodsCount = 1;
		
		var sendCart = {
				productNum : goodsNum,
				count : goodsCount
		};
		
		// 장바구니 상품 존재 여부 확인 후 추가
		$.ajax({
			type: "POST",
			url: "../cart/cartAdd.do",
			data: JSON.stringify(sendCart),
			contentType: "application/json",
			dataType: "json",
			success: function(result){
				//alert("성공");
				if (result == 1) {
					getBtnSignal(goodsNum, 1);
				} else if (result == 2) {
					getBtnSignal(goodsNum, 2);
				} else if (result == 3) {
					getBtnSignal(goodsNum, 3);
				} else if (result == 0) {
					alert("오류");
				}
			},
			error: function(){
				alert("실패");
			}
		}); 
	}
	
	//전체 주문 상품 다시 담기
	function allReAdd(){
		// 상품 개수
		var goodsCount = 1;
		
		var sendCart = {
				productNum : goodsNum,
				count : goodsCount
		};
		
		// 장바구니 상품 존재 여부 확인 후 추가
		$.ajax({
			type: "POST",
			url: "../cart/cartAdd.do",
			data: JSON.stringify(sendCart),
			contentType: "application/json",
			dataType: "json",
			success: function(result){
				//alert("성공");
				if (result == 1) {
					//alert("장바구니 추가 성공 알림 보내기");
				} else if (result == 2) {
					//alert("이미 장바구니에 있는 상품 수량 추가 알림 보내기");
				} else if (result == 3) {
					alert("이미 최대 수량입니다");
				} else if (result == 0) {
					//alert("오류");
				}
			},
			error: function(){
				alert("실패");
			}
		}); 
	}
	
	//전체 주문 취소
	function orderCancel(){
		alert("전체 주문 취소 - 준비중입니다.");
	}
	
	
</script>

</head>
 <body style="width: 1900px;">
 
   <header>
		<%@ include file= "../common/header.jspf" %>
   </header>
   
    <div id="container">
     
        <div class="row" id="mypage-top">
            <div class="col-sm-2" style="background-color:#F7F7F7;"></div> 
            
            <div class="col-sm-8" style="background-color:#F7F7F7;">
	             <!-- 마이페이지 상단 --> 
	              <jsp:include page="../common/mypage/mypageTop.jsp" flush="true" />
            </div> 

            <div class="col-sm-2" style="background-color: #F7F7F7;"></div>
        </div>

        <div class="blank"></div>
       
		<div class="row" id="mypage-bottom">
			<div class="col-sm-2"></div>
			
			<!-- 마이페이지네비메뉴 -->
			<jsp:include page="../common/mypage/mypageSide.jsp" flush="true" />
			
			<!-- 마이페이지 콘텐츠 영역 -->
			<div class="col-sm-6"> 
			
			<div class="mypage-top3">
                <div style="width: 100%; height: 50px;">
                  <div id="category-name" style="display: inline-block;">
                    <h4 style="margin-right: 20px; margin-bottom: 35px; ">주문 내역 상세</h4>
                  </div>
                  <div class="orderNumArea"><h5 class="font-weight-bold" id="orderNum">주문번호 <%= request.getParameter("orderNum") %></h5><a id="inquiryLink" onclick="inquiry()">1:1문의 하기 ></a></div>
              </div>
            </div>
				
			<div class="mypage-top4">
			<div id="orderDetail1">
		<!-- DB 에서 LIST 불러와서 반복문 적용
			주문상품 개별정보
           DB 에서 LIST 불러와서 반복문 적용끝 -->
             </div> 

                  
              <!-- 장바구니에 담기 버튼영역 -->
              <div class="allAddCancle">
                <button class="btn whiteBtn" type="button" width="200" height="56" radius="3" onclick="allReAdd()"><span>전체 상품 다시 담기</span></button>
                <button class="btn greyBtn" type="button" width="200" height="56" radius="3" onclick="orderCancel()"><span>전체 상품 주문 취소</span></button>
              </div>


              <!-- 안내 -->
              <div class="notice"><span>주문취소는 [주문완료] 상태일 경우에만 가능합니다.</span></div>

			<div id="orderDetail2">
              <!-- 결제정보 / 금액, 적립금, 결제방법 반복 시작
					주문정보 / 주문번호, 주문자, 결제 일시 
					배송정보 / 받는사람, 연락처 주소, 장소 포장? -->
			</div> <!-- orderDetail2 -->
			
			
			</div><!-- mypage-top4 -->	   
			</div> <!-- col-sm-6 -->
		   
		    <div class="col-sm-2"></div>
		    
		</div>
          
		<div class="blank"></div>
		
	</div>

    <footer>
		<jsp:include page="../common/footer.jspf" flush="true" />
    </footer>
    
 </body>
</html>