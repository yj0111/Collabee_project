<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
    
    <%@ include file = "../common/bootstrap.jspf" %>

    <script>
    	
        function getJsonGoodsList() {
        	
        	console.log("getJsonGoodsList 들어옴")
    		
    		$.ajax("../collections/getJsonGoodsList.do", {
    			type: "get",
    			data: $("#options-form").serialize(), 
    			dataType: "json",
    			success: function(data){
    				//alert("성공~~");
    				console.log(data);
    				
    				let dispHtml = "";
    				let sequence = 1;
    				for (let goodsVO of data) {
    					dispHtml += "<form id='item-box-form"+sequence+"'>";
	   					dispHtml += "<div class='card item-box'>";
	   					dispHtml += "<img class='card-img-top' src='../resources/imgs/goods/"+goodsVO.thumSysFilename+"' alt='Card image'>";
	   					dispHtml += "<div class='icon-cart-box-box' style='position:relative; height:0px;'>";			
	   					dispHtml += "<div type='button' data-toggle='modal' data-target='#cart-modal' class='btn btn-primary icon-cart-box' data-productname='"+goodsVO.productName+"' data-saleprice='"+goodsVO.saleprice+"' data-productnum='"+goodsVO.productNum+"'>";			
	   					dispHtml += "<i class='fa-solid fa-cart-shopping'></i>";			
	   					dispHtml += "</div></div>";			
	   					dispHtml += "<div class='card-body'>";
	   					dispHtml += "<p class='card-text --font-large' style='height:54px;'>"+goodsVO.productName+"</p>";
	   					dispHtml += "<p><span class='--color-red --font-large'>"+goodsVO.disRate+"</span><span class='--color-red --font-large'>%</span><span id='saleprice"+sequence+"' class='--font-large --strong' style='margin-left:10px;'>"+(Math.floor(goodsVO.price*(1-goodsVO.disRate*0.01)/10) *10)+"</span><span class='--font-large --strong'>원</span></p>";
	   					dispHtml += "<p class='--font-mid --color-gray --line-mid'><span>"+goodsVO.price+"</span><span>원</span></p>";
	   					dispHtml += "<p class='--font-small --color-gray --strong'>"+goodsVO.pDescription+"</p>";
	   					dispHtml += "<a href='../goods/goodsContent.do?productNum="+goodsVO.productNum+"' class='stretched-link'></a>";
	   					dispHtml += "<input name='productNum' type='hidden' value='"+goodsVO.productNum+"'>";
	   					dispHtml += "</div>";
	   					dispHtml += "</div>";
	   					dispHtml += "</form>";
	   					
	   					sequence++;
	   					
	   					/* $("#saleprice" + sequence) */
    				} 
    				
    				$("#new-item-box").html(dispHtml);
    				$("#search-result-amount").html("총 " +data.length+"건");
    				
    			},
    			error: function(){
    				alert("실패!~~");
    				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    			}
    		}); 
    	}
    </script>

</head>
<body style="width:2000px; margin: auto; margin-top: 50px;">

	<!-- 모달 -->
	<!-- 쇼핑카트 모달 -->
    <%@ include file = "../common/modal/addShoppingCartModal.jspf" %>
    
    
    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>

    <!-- 상단이미지 -->
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <img src="${pageContext.request.contextPath }/resources/imgs/info/new_item/new_info_1.png" style="width: 100%">
        </div>
        <div class="col-sm-2"></div>
    </div>

    <h4 class="text-center" style="margin: 50px 0px;"> 신상품 </h4>
    
    <div class="row">
    
        
        <div class="col-sm-2"></div>
        <!-- aside -->
        <div class="col-sm-2">
	        <form id="options-form">
	        	
	        	<%@ include file = "./sidebar.jspf" %>
	       	</form>
        </div>
        <!-- section -->
        <div class="col-sm-6">
            <ul class="list-group list-group-flush  side-bar-box">
                <li class="list-group-item  d-flex justify-content-between search-filter-top" style="padding: 0px 0px 15px 0px;">
                    <div id="search-result-amount">총 351건</div> 
                    <div> 
                        <ul>
                            <li><div class="form-check filter-top" style="display: inline-block;">
									<label class="form-check-label" for="o-opt1">
									    <input class="form-check-input p-opt opt" type="checkbox" value="" id="o-opt1">
								    	추천순
									</label>
		                    	</div>
                                <div class="dropdown" style="display: inline-block; margin-left:5px; height: 30px; width: 20px;">
                                    <i class="fa-regular fa-circle-question"></i>
                                	<div class="dropdown-menu" style="padding: 20px; width: 300px; border: solid 1px black; position: relative; z-index: 5; right: -300px; top: 0px;"> 소비자 인기도(판매량, 조회수, 상품출시일)를 종합적으로 고려한 순서입니다.</div>
                                </div>
                            </li> 
                            <li><a href="#">판매량순</a></li>
                            <li><a href="#">낮은가격순</a></li>
                            <li><a href="#">높은가격순</a></li>

                        </ul>
                    </div>
                </li>
            </ul>
            
            <div id="new-item-box" class="item-container" style="width: 100%;">
            </div>
        </div>

        <div class="col-sm-2"></div>
    </div>

    


    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
        

</body>
</html>