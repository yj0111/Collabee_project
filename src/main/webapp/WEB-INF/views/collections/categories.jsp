<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>

    <%@ include file = "../common/bootstrap.jspf" %>

<style>

    /* 카테고리 페이지 전용*/
    #category-page #category-box {
        border: solid var(--border-faint-color) 1px;
        margin: 50px 0px;
        width: 1200px;

    }

    #category-page #category-box ul{
        list-style: none;
        display: flex;
        overflow: auto;
        flex-wrap: wrap;
        padding: 20px 50px;
        width: 1500px;
        margin: auto;
    }

    #category-page #category-box ul li {
        width: 250px;
        margin: 10px 20px;
    }

    #category-page #category-box ul button {
        margin-left: 40px;
        color: var(--font-basic-color);
        text-decoration: none;
        background-color: transparent;
        border: none;
    }

    #category-page #category-box ul button:hover {
        color: var(--main-color);
    }
    
</style>


    <script>
    
 	// 더보기 버튼 클릭 유무 체킹 변수
    let checkMoreItemClick = false;
    let morePlus = 5;
    let moreStartNum = 1;
    let moreEndNum = moreStartNum + morePlus;
    let moreCycle = 1;
    
       $().ready(function(){
    	  
    	   getCategoryName(${division.categoryNum });
       });
        
       
       function getCategoryName(categoryNum) {
       	
	       	console.log("getCategoryName 들어옴")
	   		$.ajax("../collections/getCategoryName.do", {
	   			type: "get",
	   			data: {
	   				categoryNum : categoryNum
	   			}, 
	   			dataType: "json",
	   			success: function(data){
					$("#categoryNameSection").html(data.category);
	   				
				},
				error: function(){
					alert("getCategoryName실패!~~");
				}
			}); 
		}
		        
		function getJsonGoodsListByCategory() {
			
			if (checkMoreItemClick == false) {
        		moreStartNum = 1;
				moreEndNum = moreStartNum + morePlus;
				
				$("#alert-search-end").css('display', 'none');
				moreCycle = 1;
        	}
        	
        	$("#more-item-start").val(moreStartNum );
    		$("#more-item-end").val(moreStartNum + morePlus);
	        	
    		$.ajax("../collections/getJsonGoodsListByCategory.do", {
    			type: "get",
    			contentType: 'text',
    			data: $("#options-form").serialize(), 
    			dataType: "json",
    			success: function(data){
    				//alert("성공~~");
    				console.log(data);
    				
    				let dispHtml = "";
    				
    				if (data.length > 0) {
    					
    					$("#moreButton").css("display", 'block');
    					moreCycle++;
    					
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
		   					dispHtml += "<p class='card-text --font-large product-name' style='height:40px;'>"+goodsVO.productName+"</p>";
		   					dispHtml += "<p>";
		   					if (goodsVO.disRate != 0) {
		   						dispHtml += "<span class='--color-red --font-large disRate'>"+goodsVO.disRate+"</span><span class='--color-red --font-large' style='margin-right: 10px;'>%</span>";
		   					}
		   					dispHtml += "<span id='saleprice"+sequence+"' class='--font-large --strong'>"+priceToString(goodsVO.saleprice)+"</span><span class='--font-large --strong'>원</span></p>";
		   					
		   					if (goodsVO.disRate != 0) {
		   						dispHtml += "<p class='--font-mid --color-gray --line-mid'><span>"+priceToString(goodsVO.price)+"</span><span>원</span></p>";
		   					}
		   					dispHtml += "<p class='--font-small --color-gray --strong saleprice'>"+goodsVO.pDescription+"</p>";
		   					dispHtml += "<a href='../goods/goodsContent.do?productNum="+goodsVO.productNum+"' class='stretched-link'></a>";
		   					dispHtml += "<input name='productNum' type='hidden' value='"+goodsVO.productNum+"'>";
		   					dispHtml += "</div>";
		   					dispHtml += "</div>";
		   					dispHtml += "</form>";
		   					
		   					sequence++;
	    				}
    				} else if(data.length == 0 && moreCycle == 1){
    					dispHtml += "<p style='font-size: 30px; font-align: center'><i class='fa-solid fa-magnifying-glass'></i> 검색된 상품이 없습니다. </p>";
    					$("#moreButton").css("display", 'none');
    				}
    				
    				
    				if (data.length < morePlus+1 && moreCycle != 1) {
     					$("#alert-search-end").css('display', 'block');
     					$("#moreButton").css("display", 'none');
     				} 
    				
    				if (checkMoreItemClick == true) {
	    				$("#new-item-box").append(dispHtml);
   					} else {
	    				$("#new-item-box").html(dispHtml);
   					}
    				moreStartNum = moreEndNum + 1;
    				moreEndNum = moreStartNum + morePlus;
    				
    				run_show_more('OUT');
    				
	    			},
	    			error: function(){
	    				alert("getJsonGoodsListByCategory실패!~~");
	    			}
	    		}); 
    		
    			setColorNowDivision();
	    	}
		
		
		// 더보기 버튼 동작 함수
    	function run_show_more(direction) {
    		if (direction == 'IN') {
	    		checkMoreItemClick = true;
	    		$("#more-item-start").val(moreStartNum);
	    		$("#more-item-end").val(moreEndNum);
	    		getJsonGoodsListByCategory();
    		} else {
	    		checkMoreItemClick = false;
    		}
    	}
		
		
		
	
		function addNowDivision(divisionNum) {
			$("#jsonData-divisionNum").val(divisionNum);
			getJsonGoodsListByCategory();
		}
		
		function setColorNowDivision(){
			$(".sub-category-opt").each(function(){
				if ($(this).val() == $("#jsonData-divisionNum").val()){
					$(this).css('color', 'var(--main-color)');
				} else {
					$(this).css('color', 'var(--font-basic-color)');
				}
			});
		}
		
		function resetDivision() {
			$("#jsonData-divisionNum").val(0);
			getJsonGoodsListByCategory();
		}
		
		// 판매량순, 낮은가격순, 높은 가격순 필터 값 input value 넣는 함수
        function setSearchFilter(type) {
        	console.log("setSearchFilter" + type);
        	$("#filterType-input").val(type);
        	getJsonGoodsListByCategory();
        }
		
        function setFilterType(type){
       		$("input[name=filterType]").val(type);
       		getJsonGoodsListByCategory()
       	}
        
        $().ready(function(){
        	
        	$("#filterType-input").val("recommend");
        });
		
    </script>
    
</head>
<body style="width:1900px; margin: auto;">

	<!-- 모달 -->
	<!-- 쇼핑카트 모달 -->
    <%@ include file = "../common/modal/addShoppingCartModal.jspf" %>

    <!-- header -->
    <%@ include file = "../common/header.jspf" %>
    

	<section id="category-page">
	
	    
	    <div class="row">
	
	        <div class="col-sm-2"></div>
	        <div class="col-sm-8">
				
	    				<h4 id="categoryNameSection" class="text-center" style="margin-top: 50px;"> <카테고리명> </h4>
			            <div id="category-box">
			                <ul>
			                	<li><button value="0" onclick="resetDivision()" class="sub-category-opt">전체보기</button></li>
				            	<c:forEach var="vo" items="${divisionVOList }" varStatus="status">
			                    	<li><button value="${vo.divisionNum }" onclick="addNowDivision(this.value)" class="sub-category-opt">${vo.division }</button></li>
			<%--                     	<li><a href="${pageContext.request.contextPath}/collections/categories.do?divisionNum=${vo.divisionNum }" class="sub-category-opt">${vo.division }</a></li> --%>
				                </c:forEach>
			                </ul>
			            </div>
	
	        </div>
	        <div class="col-sm-2"></div>
	    </div>
	
	
	
	
	    <div class="row">
	    
	        
	        <div class="col-sm-2"></div>
	        <!-- aside -->
	        <div class="col-sm-2">
	        	<form id="options-form">
		        	<%@ include file = "./sidebar.jspf" %>
		            <!-- categoryNum 폼에 넘기는 부분 -->
		            <input type="hidden" name="categoryNum" value="${division.categoryNum }">
		            <input id="filterType-input" type="hidden" name="filterType" value="">
		            <input id="jsonData-divisionNum" type="hidden" name="divisionNum" value="${division.divisionNum }">
		            <input id="usingPage-input" type="hidden" name="usingPage" value="${usingPage }">
		            <input id="show-more-count" type="hidden" name="moreBegin" value="1">
            	<input id="more-item-start" type="hidden" name="moreStartNum" value="">
            	<input id="more-item-end" type="hidden" name="moreEndNum" value="">
		            
	        	</form>
	            
	        </div>
	        <!-- section -->
	        <div class="col-sm-6">
	            <ul class="list-group list-group-flush  side-bar-box">
	                <li class="list-group-item  d-flex justify-content-between search-filter-top" style="padding: 0px 0px 15px 0px;">
	                    <div id="search-result-amount"><!-- 총 -건 --></div>
	                    <div> 
	                        <ul>
	                            <li><button onclick="setSearchFilter('recommend')">추천순</button>
                                <div class="dropdown" style="display: inline-block; margin-left:5px; height: 30px; width: 20px;">
                                    <i class="fa-regular fa-circle-question"></i>
                                	<div class="dropdown-menu" style="padding: 20px; width: 300px; border: solid 1px black; position: relative; z-index: 5; right: -300px; top: 0px;"> 소비자 인기도(판매량, 조회수, 상품출시일)를 종합적으로 고려한 순서입니다.</div>
                                </div>
                            </li> 
	                            <li><button onclick="setSearchFilter('sales')">판매량순</button></li>
	                            <li><button onclick="setSearchFilter('lowPrice')">낮은가격순</button></li>
	                            <li><button onclick="setSearchFilter('highPrice')">높은가격순</button></li>
	
	                        </ul>
	                    </div>
	                </li>
	            </ul>
	            <div id="new-item-box" class="item-container" style="width: 100%;">
	            </div>
	            <div id="show-more-area" style="display: flex; justify-content: center;">
            	<button id="moreButton" onclick="run_show_more('IN')" style="width: 180px; height: 60px; font-size: 20px; color: white; background-color: #9A30AE; font-weight: 800;">더보기</button>
            	<p id="alert-search-end" style='font-size: 30px; display: none;'> 상품조회의 끝입니다. </p>
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