<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/coupon.css">
   	
</head>

<script>
$(function(){	
	var mvo = { memberNum : ${loginMember.getMemberNum()} };
	console.log(mvo); 
	//alert("JSON.stringify(mvo) : " + JSON.stringify(mvo)); 

	$.ajax("couponAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			console.log(data);
			
			let htmlTag = "";
			let couponBox = data.Array;
			$.each(data, function(index, couponBox){ 
				console.log("couponBox.issueDate :" + couponBox.issueDate);
				htmlTag += '<li class="d-flex emoney-row">';				
				htmlTag += '<div class="coupon-num">' + couponBox.couponNum + '</div>';
				htmlTag += '<div class="coupon-name">' + couponBox.couponName + '</div>';
				htmlTag += '<div class="dis-price">' + couponBox.disPrice + '</div>';
				htmlTag += '<div class="coupon-date">' + couponBox.couponDate.substring(0,10) + '</div>';				
				if (couponBox.usageState == 'Y') {
					htmlTag += '<div class="usage-state minusPoint">' + couponBox.usageState + '</div>';									
				}
				if (couponBox.usageState == 'N') {
					htmlTag += '<div class="usage-state plusPoint">' + couponBox.usageState + '</div>';
				}
				htmlTag += '</li>';
			});
			$("#ul").html(htmlTag);
		
		},
		erroer: function(){
			alert("쿠폰 목록 불러오기 실패");
		}
	}); //ajax끝 
	
});

</script>


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
	                <div style="width: 100%; height: 35px;">
	                  <div id="category-name" style="display: inline-block;">
	                    <h4 style="margin-right: 20px;">쿠폰</h4>
	                  </div>
	                  <div style="display: inline; line-height: 38px; vertical-align: bottom;"><small>적용가능한 쿠폰을 확인해보세요</small></div>
	              	</div>
            	</div>
				
			<div class="mypage-top4">
              <section>
                <div class="d-flex emoney-col">
                  <div class="coupon-num">쿠폰번호</div>
                  <div class="coupon-name">쿠폰명</div>
                  <div class="dis-price">할인금액</div>
                  <div class="coupon-date">사용기간</div>
                  <div class="usage-state">사용여부</div>
                </div>
                <ul id ="ul" style="padding: 0px;">
                <!--
                	데이터 있는만큼 반복 페이지당 10개    
               		coupon목록 들어가는 곳 
               		->
                </ul>
                
                <!--페이징처리-->
                  <ul class="pagination" style="margin-left: 300px">
                    <li class="pagination-first">
                      <button class="paginationBtn"><i class="bi bi-chevron-double-left"></i></button>
                    </li>
                    <li class="pagination-prev">
                        <button class="paginationBtn"><i class="bi bi-chevron-left"></i></button>
                    </li>
                    <li class="pagnation-pageNum">
                      <button class="paginationBtn"><div>1</div></button>
                    </li>
                    <li class="pagnation-pageNum">
                      <button class="paginationBtn"><div>2</div></button>
                    </li>
                    <li class="pagination-next">
                      <button class="paginationBtn"><i class="bi bi-chevron-right"></i></button>
                    </li>
                    <li class="pagination-last">
                      <button class="paginationBtn"><i class="bi bi-chevron-double-right"></i></button>
                    </li>
                  </ul>
  
              </section>
			</div> <!-- mypage-top4 -->
				
			</div> <!-- col-sm-6 -->
		   
		    <div class="col-sm-2"></div>
		    
		</div>
          
		<div class="blank"></div>
		
	</div>

    <footer>
    	<%@ include file= "../common/footer.jspf" %>
    </footer>
    
 </body>
</html>