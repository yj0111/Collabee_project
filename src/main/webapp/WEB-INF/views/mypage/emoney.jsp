<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/emoney.css">
 
</head>

<script>
$(function(){
	cPage = null;
	var mvo = { memberNum : ${loginMember.getMemberNum()} };
	
	console.log(mvo); 	
	
	$.ajax("getTotEmoneyAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(emoneyUsage){
			//alert("getTotEmoneyAjax 성공> 받은 데이터 : " + emoneyUsage); 		
			console.log(emoneyUsage);
			if(emoneyUsage == ""){
				$('#totEmoney').html(0);					
			} else {
				$('#totEmoney').html(emoneyUsage);					
			}
		},
		error: function(){
			alert("getTotEmoneyAjax 실패")
		}
	});
	
	getList(cPage)

	
	
});
	

function getList(cPage) {
	
	var pageInfo = { "memberNum" : ${loginMember.getMemberNum() },
					"cPage": cPage }
	
	$.ajax("getEmoneyPagination.do",{ //emoney 히스토리가져오기
		type: "post",
		data: JSON.stringify(pageInfo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			//alert("emoneyAjax 성공");
			console.log(data)
			console.log(data.pageContent)
			console.log(data.pageVO)
			let p = data.pageVO
		
			let htmlTag = "";
			let pageTag = "";
			
			$.each(data.pageContent, function(index, emoneyUsage){ 			
				htmlTag += '<li class="d-flex emoney-row">';				
				htmlTag += '<div class="reg-date">' + emoneyUsage.saveDate.substring(0,10) + '</div>';
				htmlTag += '<div class="detail" style="letter-spacing: -0.5px;">' + emoneyUsage.emoneyHistory + '</div>';
				htmlTag += '<div class="validity">' + emoneyUsage.validity+ '</div>';
				htmlTag += '<div class="point">' + emoneyUsage.amount + '</div>';
				htmlTag += '</li>';				
			});//$.each(data.pageContent
			

			if(p.beginPage == 1 ) {
				pageTag += '<li class="pagination-first">';
				pageTag += '<button class="paginationBtn disable"><i class="bi bi-chevron-left"></i></button>';
				pageTag += '</li>';					
			}
			if(p.beginPage != 1 ) {
				pageTag += '<li class="pagination-first">'
		  			+ '<button class="paginationBtn disable"><i class="bi bi-chevron-left"></i></button>'
		  			+ '</li>';
			}
			for(var i = p.beginPage; i <= p.endPage; i++  ){
				if(i == p.nowPage){
					pageTag += '<li class="pagnation-pageNum"><button class="paginationBtn"><div>'+ i + '</div></button></li>';
				}
				if(i != p.nowPage ){
					pageTag +=  '<li class="pagnation-pageNum"><button class="paginationBtn" onclick="getList('+ i + ')"><div>'+ i + '</div></button></li>';
				}
			}
			if(p.endPage < p.totalPage) {
				pageTag += '<li class="pagination-next">'
				+ '<button class="paginationBtn"><i class="bi bi-chevron-right"></i></button>'
				+ '</li>';
			}
			if(p.endPage >= p.totalPage ){
				pageTag += '<li class="pagination-next">'
				+ '<button class="paginationBtn disable"><i class="bi bi-chevron-right"></i></button>'
				+ '</li>';
			}
		
			console.log(pageTag)
			$("#ul").html(htmlTag);
			$("#page").html(pageTag);
			
		}, //success
		erroer: function(){
			alert("emoneyAjax실패");
		}
	}); //ajax끝 

}
	

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
               	<div style="width: 100%; height: 50px;">
                  <div id="category-name" style="display: inline-block;">
                    <h4 style="margin-right: 20px;">적립금</h4>
                  </div>
                  <div style="display: inline; line-height: 38px; vertical-align: bottom;"><small>보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</small></div>
              	</div>
           	</div>
				
			<div class="mypage-top4" style="padding: 15px;">
               
              <section class="d-flex">
                <dl class="d-flex" style="width: 100%; padding-left: 300px">
                  <dt class="label plusPoint">현재 적립금</dt>
                  <dd class="price plusPoint"><span class="unit" id="totEmoney"></span><span> 원</span></dd>
                </dl>
              <!--   <dl class="d-flex">
                  <dt class="label">소멸예정 적립금</dt>
                  <dd class="price minusPoint font-weight-bold">1,497<span class="unit">원</span></dd>
                </dl>
                 -->
              </section>
              <section>
                <div class="d-flex emoney-col">
                  <div class="reg-date">날짜</div>
                  <div class="detail">내용</div>
                  <div class="expire-date">유효기간</div>
                  <div class="point">금액</div>
                </div>
                <ul id ="ul" style="padding: 0px;">
                  <!-- 데이터 있는만큼 반복 페이지당 10개   
                  		emoney 내역 반복 끝 -->
    
                </ul>
                
                
                <ul id="page" class="pagination" style="margin-left: 300px">

                <!--페이징처리-->
                                 
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