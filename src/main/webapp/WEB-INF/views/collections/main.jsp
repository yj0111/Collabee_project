<%@page import="com.spring.collabee.biz.member.impl.MemberDAO"%>
<%@page import="com.spring.collabee.biz.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>콜라비</title>
    <%@ include file = "../common/bootstrap.jspf" %>
	
    <style>
    
        /* 캐러셀 부분*/
        .carousel-item-box {
            margin: 0px;
        }

        .top-img-carousel img {
            width: 100%;
        }
        
        .icon-cart-box-box {
            height: 0px;
            left: 10px;
        }

        .card .icon-cart-box i {
            color: white;
        }

        .prev-item-btn {
            background-color: white; 
            position: relative; left:-15px; bottom: 400px; 
            width: 50px; height: 50px; 
            border:none; border-radius: 50%;
        }
        .next-item-btn {
            background-color: white; 
            position: relative; left:1200px; bottom: 400px; 
            width: 50px; height: 50px; 
            border:none; border-radius: 50%;
        }

        .prev-item-btn i, .next-item-btn i {
            font-size: 24px;
        } 




		/* 아이템 박스 부분 */

        .item-container{
        display: flex;
        justify-content: space-between;
        }

        .carousel-inner .card {
            border: none;
        }

        .item-container .card .card-body {
            padding: 20px 0px;
        }

        .item-container .card p {
            margin-bottom: 10px;
        }


        .carousel-item-box button, .carousel-item-box div[data-toggle] {
            z-index: 2;
        }
        
        .carousel-item-box .item-box {
        	width: 300px;
    		height: 600px;
        }
        
        .carousel-item-box .item-box .card-img-top {
        	height: 380px;
        }
        
        .item-box p.product-name {
        	height: 40px;
        }
		
		.item-box p.disRate {
			margin-right: 10px;
		}

        
    </style>

    <script>
    	
    	console.log("아아아변경2 ${pageContext.request.contextPath }");
    	
        let sum = 0;
        let insum = 0;
        $(function(){
            var tott = $("#total").val();

            $(".opt").change(function(){
                insum = 0;
                $(".opt:checked").each(function(){
                    insum += Number($(this).val());
                    console.log($(this).val());
                });
                sum = Number(tott) + insum;
                $("#total").val(sum);
            });
        });       
    	
        
    </script>
</head>
<body style="width:1900px; margin: auto;">

	<!-- 모달 -->
	<!-- 쇼핑카트 모달 -->
    <%@ include file = "../common/modal/addShoppingCartModal.jspf" %>
    

    <!-- header -->
    <%@ include file = "../common/header.jspf" %>
	
    <section id="main-section">

	<section>
	    <div class="row">    
	    
	    <!-- 상단 캐러셀 이미지 -->
	        <div class="col-sm-12">
	            <div id="top-img-carousel" class="carousel slide" data-ride="carousel">
	
	                <!-- Indicators -->
	                <ul class="carousel-indicators" style="z-index: 1;">
	                    <li data-target="#demo" data-slide-to="0" class="active"></li>
	                    <li data-target="#demo" data-slide-to="1"></li>
	                    <li data-target="#demo" data-slide-to="2"></li>
	                    <li data-target="#demo" data-slide-to="3"></li>
	                    <li data-target="#demo" data-slide-to="4"></li>
	                </ul>
	
	                <div class="carousel-inner">
	                    <div class="carousel-item active">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_001.avif" alt="국물요리백서">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_002.avif" alt="얼리크리스마스">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_003.avif" alt="금주의 과일가게">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_004.avif" alt="다채로운 돼지고기">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_005.avif" alt="New York">
	                    </div>
	                </div>
	                
	                <a class="carousel-control-prev" href="#top-img-carousel" data-slide="prev">
	                    <span class="carousel-control-prev-icon"></span>
	                </a>
	                <a class="carousel-control-next" href="#top-img-carousel" data-slide="next">
	                    <span class="carousel-control-next-icon"></span>
	                </a>
	            </div>
	        </div>
	    </div>
	
	
	
	    <div class="row">
	        <div class="col-sm-2"></div>
	        
	        <div class="col-sm-8" style="padding: 0px;">
	        
	        	<!-- 기획전 1 -->
	            <div style="text-align:center;margin:80px 0px 30px 0px;">
	                <h4 style="font-weight:600;"> ${specialList[0].title } </h4>
	                <h6>${specialList[0].sDescription }</h6>
	            </div>
	            
	            
	            <div class="carousel-item-box" style="padding: 0px; width: 100%;">
	                <div id="section1" class="carousel slide w-100" data-ride="carousel" data-interval="false">
	                    <div class="carousel-inner w-100" role="listbox">
	                        <c:forEach var="goodsVO" items="${special1 }" varStatus="status">
	                        <c:choose>
	                        	<c:when test="${status.count == 1 }">
                       		<div class="carousel-item active">
	                        	</c:when>
	                        	<c:when test="${status.count%4 == 1 }">
                       		<div class="carousel-item">
	                        	</c:when>
	                        </c:choose>
	                        <%-- C:/MyStudy/temp${goodsVO.thumPath }/${goodsVO.thumSysFilename } --%>
	                            <div class="col-3 float-left">
	                                    <div class="card  item-box">
	                                        <img class="card-img-top" src="../resources/imgs/goods/${goodsVO.thumSysFilename }" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box" data-productname="${goodsVO.productName }" data-saleprice="${goodsVO.saleprice }" data-productnum="${goodsVO.productNum }">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large product-name">${goodsVO.productName }</p>
	                                            <p>
	                                            <c:if test="${goodsVO.disRate != 0 }">
	                                            <span class="--color-red --font-large disRate">${goodsVO.disRate }%</span>
	                                            </c:if>
	                                            <span id='saleprice${status.index+1 }' class='--font-large --strong saleprice'><fmt:formatNumber value="${goodsVO.saleprice }" pattern="#,###" /></span><span class='--font-large --strong'>원</span></p>
	                                            <c:if test="${goodsVO.disRate != 0 }">
                                           	 		<p class='--font-mid --color-gray --line-mid'><span><fmt:formatNumber value="${goodsVO.price }" pattern="#,###" /></span><span>원</span></p>
	                                            </c:if>
	                                            <p class="--font-small --color-gray --strong">${goodsVO.pDescription }</p>
	                                            <a href="../goods/goodsContent.do?productNum=${goodsVO.productNum }" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                        	<c:if test="${status.count%4 == 0 or status.last}">
	                        </div>
	                        	</c:if>
	                        </c:forEach>
                    	</div>
	                    <button class="prev-item-btn" href="#section1" role="button" data-slide="prev">
	                        <i class="fa-solid fa-chevron-left"></i>
	                    </button>
	                    <button class="next-item-btn" href="#section1" role="button" data-slide="next">
	                        <i class="fa-solid fa-chevron-right"></i>
	                    </button>
               		</div>
	            </div>
				
				
				<!-- 기획전 2 -->
	            <div style="text-align:center;margin:80px 0px 30px 0px;">
	                <h4 style="font-weight:600;"> ${specialList[1].title } </h4>
	                <h6>${specialList[1].sDescription }</h6>
	            </div>
	
	            <div class="carousel-item-box" style="padding: 0px; width: 100%;">
	                <div id="section2" class="carousel slide w-100" data-ride="carousel" data-interval="false">
	                    <div class="carousel-inner w-100" role="listbox">
	                        <c:forEach var="goodsVO" items="${special2 }" varStatus="status">
	                        <c:choose>
	                        	<c:when test="${status.count == 1 }">
                       		<div class="carousel-item active">
	                        	</c:when>
	                        	<c:when test="${status.count%4 == 1 }">
                       		<div class="carousel-item">
	                        	</c:when>
	                        </c:choose>
	                            <div class="col-3 float-left">
	                                    <div class="card  item-box">
	                                        <img class="card-img-top" src="../resources/imgs/goods/${goodsVO.thumSysFilename }" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box" data-productname="${goodsVO.productName }" data-saleprice="${goodsVO.saleprice }" data-productnum="${goodsVO.productNum }">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large product-name">${goodsVO.productName }</p>
	                                            <p>
	                                            	<c:if test="${goodsVO.disRate != 0 }">
			                                            <span class="--color-red --font-large disRate">${goodsVO.disRate }%</span>
		                                            </c:if>
	                                            <span id='saleprice${status.index+1 }' class='--font-large --strong saleprice'><fmt:formatNumber value="${goodsVO.saleprice }" pattern="#,###" /></span><span class='--font-large --strong'>원</span></p>
	                                            <c:if test="${goodsVO.disRate != 0 }">
                                           	 		<p class='--font-mid --color-gray --line-mid'><span><fmt:formatNumber value="${goodsVO.price }" pattern="#,###" /></span><span>원</span></p>
	                                            </c:if>
	                                            <p class="--font-small --color-gray --strong">${goodsVO.pDescription }</p>
	                                            <a href="../goods/goodsContent.do?productNum=${goodsVO.productNum }" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                        	<c:if test="${status.count%4 == 0 or status.last}">
	                        </div>
	                        	</c:if>
	                        </c:forEach>
	                    	</div>
                		</div>
	                    <button class="prev-item-btn" href="#section2" role="button" data-slide="prev">
	                        <i class="fa-solid fa-chevron-left"></i>
	                    </button>
	                    <button class="next-item-btn" href="#section2" role="button" data-slide="next">
	                        <i class="fa-solid fa-chevron-right"></i>
	                    </button>
               		</div>
	            
	            <!-- 기획전 3 -->
	            <div style="text-align:center;margin:80px 0px 30px 0px;">
	                <h4 style="font-weight:600;"> ${specialList[2].title } </h4>
	                <h6>${specialList[2].sDescription }</h6>
	            </div>
	
	            <div class="carousel-item-box" style="padding: 0px; width: 100%;">
	                <div id="section3" class="carousel slide w-100" data-ride="carousel" data-interval="false">
	                    <div class="carousel-inner w-100" role="listbox">
	                        <c:forEach var="goodsVO" items="${special3 }" varStatus="status">
	                        <c:choose>
	                        	<c:when test="${status.count == 1 }">
                       		<div class="carousel-item active">
	                        	</c:when>
	                        	<c:when test="${status.count%4 == 1 }">
                       		<div class="carousel-item">
	                        	</c:when>
	                        </c:choose>
	                            <div class="col-3 float-left">
	                                    <div class="card  item-box">
	                                        <img class="card-img-top" src="../resources/imgs/goods/${goodsVO.thumSysFilename }" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box" data-productname="${goodsVO.productName }" data-saleprice="${goodsVO.saleprice }" data-productnum="${goodsVO.productNum }">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
		                                        <div class="card-body">
	                                            <p class="card-text --font-large product-name">${goodsVO.productName }</p>
	                                            <p>
	                                            	<c:if test="${goodsVO.disRate != 0 }">
			                                            <span class="--color-red --font-large disRate">${goodsVO.disRate }%</span>
		                                            </c:if>
	                                            <span id='saleprice${status.index+1 }' class='--font-large --strong saleprice'><fmt:formatNumber value="${goodsVO.saleprice }" pattern="#,###" /></span><span class='--font-large --strong'>원</span></p>
	                                            <c:if test="${goodsVO.disRate != 0 }">
                                           	 		<p class='--font-mid --color-gray --line-mid'><span><fmt:formatNumber value="${goodsVO.price }" pattern="#,###" /></span><span>원</span></p>
	                                            </c:if>
	                                            <p class="--font-small --color-gray --strong">${goodsVO.pDescription }</p>
	                                            <a href="../goods/goodsContent.do?productNum=${goodsVO.productNum }" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                        	<c:if test="${status.count%4 == 0 or status.last}">
	                        </div>
	                        	</c:if>
	                        </c:forEach>
	                    	</div>
                		</div>
	                    <button class="prev-item-btn" href="#section3" role="button" data-slide="prev">
	                        <i class="fa-solid fa-chevron-left"></i>
	                    </button>
	                    <button class="next-item-btn" href="#section3" role="button" data-slide="next">
	                        <i class="fa-solid fa-chevron-right"></i>
	                    </button>
               		</div>
	            </div>
			
			<!-- col-sm-8 닫는 태그 -->
	        </div>
	        <div class="col-sm-2"></div>
	    </div>
	
	</section>
    </section>


    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>



</body>
</html>