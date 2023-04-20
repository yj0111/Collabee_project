<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
<%@ include file= "../common/bootstrap.jspf"%>
<%@ include file= "../common/modal/changeOrderDataModal.jspf"%>
<%@ include file= "../common/modal/agreeModal1.jspf"%>
<%@ include file= "../common/modal/agreeModal2.jspf"%>
<%@ include file= "../common/modal/agreeModal3.jspf"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/order.css">
<style>
	header {
		margin-bottom:100px;
	}
	footer {
		margin-top:300px;
	}
	/* 쿠폰 */
	.select {
	  position: relative;
	}
	
	.select .option-list {
	  position: absolute;
	  top: 100%;
	  left: 0;
	  width: 100%;
	  overflow: hidden;
	  max-height: 0;
	}
	
	.select.active .option-list {
	  max-height: none;
	}
	
	/* 테마 적용하기 */
	#theme {}
	#theme .select {
	  box-shadow: 0 0 2px rgba(0,0,0,0.3);
	  border-radius: 5px;
	  padding: 10px 15px;
	  cursor: pointer;
	}
	#theme .select .option-list .option:hover{
	  color: #B03FE3;
	  background-color:lavender;
	  transition: all .3s;
	}
	#theme .select .option-list {
		list-style: none;
		padding: 0;
		border-radius: 5px;
		box-shadow: 0 0 2px rgba(0,0,0,0.3);
	}
	#theme .select .option-list .option, .option2 {
		background-color: white;
	 	padding: 10px 15px;
	}

	
</style>
</head>
<body  style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>
	
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8  text-center" style="margin-bottom:20px;">
			<h3 style="font-weight: bolder;">주문서</h3>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-6" style="white-space: nowrap;">
			<div class="card" style="border:none;">
			    <div class="card-header bg-white" id="headingOne" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
		        	<p class="text-left" style="margin:0;">
		        		<span>
							<span style="font-size:1.2rem;font-weight:bold;">
								주문 상품
							</span>
		        		</span>
				    	<button class="btn btn-link float-right" onclick="openList()" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							<span><i class="bi bi-chevron-down" style="color:black;"></i></span>
				        </button>
					</p>
			    </div>
				<div class="orderInfo text-center text-dark font-weight-bold" data-size="${orderGoods.size()}" data-productName="${orderGoods[0].productName }" style="padding:35px;font-size:1rem;white-space: nowrap;">
				<c:if test="${orderGoods.size() != 1 }">
					<span>
						${orderGoods[0].productName } 외
					</span>
					<span style="color:#9A30AE;">
						${orderGoods.size() - 1 }개
					</span>
					 상품을 주문합니다.
				 </c:if>
				 <c:if test="${orderGoods.size() == 1 }">
				 	<span>
						${orderGoods[0].productName }
					</span>
					 을(를) 주문합니다.
				 </c:if>
				</div>
			    <c:forEach var="goods" items="${orderGoods }" varStatus="status">
				<!-- 할인가 없는 상품 -->
			    <div class="card-body product" style="display: none;padding:25px 10px 10px 5px;">
			    	<div class="d-flex  flex-row justify-content-between">
			    		<div class="item">
							<img class="productImgCart"  src="../resources/imgs/goods/${goods.thumSysFilename }" width="80px" >
				     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
			     				<c:if test="${goods.productName.length() > 39 }">
			     					${goods.productName.substring(0,39) }<br>
			     					${goods.productName.substring(39,cartGoods.productName.length()) }
			     				</c:if>
			     				<c:if test="${goods.productName.length() <= 39 }">
			     					${goods.productName }
			     				</c:if>
				     		</span>
			    		</div>
			    		<div class="item" style="margin-top:38px;">
				     		<span class="text-right text-dark font-weight-bold">
			     				${goods.count }개
			     			</span>
			     				<c:if test="${goods.saleprice == goods.price }">
				     			<span class="goodsPrice text-right text-dark font-weight-bold" style="width:200px;" data-price="${goods.price * goods.count }">
			     					<fmt:formatNumber pattern="###,###,###" value="${goods.price * goods.count }" /> 원
			     				</span>
			     				</c:if>
			     				
								<!-- 할인가 있는 상품 -->
			     				<c:if test="${goods.saleprice != goods.price }">
				     			<span class="goodsPrice text-right text-dark font-weight-bold" style="width:200px;" data-price="${goods.saleprice * goods.count }">
			     					<fmt:formatNumber pattern="###,###,###" value="${goods.saleprice * goods.count }" /> 원
		     					<span class="text-secondary text-right" style="font-size:0.8rem;">
					     			<del>
					     				<fmt:formatNumber pattern="###,###,###" value="${goods.price * goods.count }" /> 원
					     			</del>
				     			</span>
			     				</span>
			     				</c:if>
			    		</div>
			    	</div>
		     	</div>

				</c:forEach>
			     			     	
	    	</div>
	    	<c:if test="${not empty loginMember}">
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<p class="text-left" style="margin:0 0 10px 0;">
		        		<span>
							<span style="font-size:1.2rem;font-weight:bold;">
								주문자 정보
							</span>
		        		</span>
		        	</p>
			    </div>
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			보내는 분
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
				    		<span>
				    			${loginMember.name }
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			휴대폰
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
				    		<span>
				    			${loginMember.phone.substring(0,3)}-${loginMember.phone.substring(3,7)}-${loginMember.phone.substring(7,11)}
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			이메일
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
				    		<span>
				    			${loginMember.email }
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:10px 0 10px 0;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left text-secondary" style="width: 200px;font-size: 0.7rem;">
				    		<span>
				    			이메일을 통해 주문처리과정을 보내드립니다.
				    			<br>
				    			정보 변경은 마이콜라비>개인정보 수정 메뉴에서 가능합니다.
				    		</span>
						</div>
			    	</div>
			    	
			    </div> 
  			</div>
  			</c:if>
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								배송 정보
							</div>
							<div class="info-title text-right text-secondary font-weight-bold" style="font-size:0.8rem;">
		        				배송지 변경 안내
		        				<i class="bi bi-question-circle" style="font-size:0.9rem;margin-left:2px;"></i>
	        				</div>
		        		</div>
		        	</div>
			    </div>
			    <div class="info-text font-weight-bold" style="background-color:#B03FE3;color:white;border:1px solid #B03FE3;padding:15px;border-radius:5px;font-size:0.7rem;">
					<span>장바구니, 홈에서 배송지를 변경할 수 있어요</span>
				</div>
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			배송지
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 700px;font-size: 0.85rem;white-space: normal;">
			    			<span class="orderAddr">
					    	<c:if test="${empty loginMember }">
								<c:if test="${empty nmember.orderAddr }">
									<span style="color:#9A30AE;">배송지를 등록해주세요!</span>
								</c:if>						
								<c:if test="${not empty nmember.orderAddr }">
									${nmember.orderAddr }&nbsp;${nmember.orderAddrDetail }
								</c:if>
							</c:if>
							<c:if test="${not empty loginMember }">
								<c:if test="${empty nmember.orderAddr }">
									${loginMember.address }&nbsp;${loginMember.addressDetail }
								</c:if>						
								<c:if test="${not empty nmember.orderAddr }">
									${nmember.orderAddr }&nbsp;${nmember.orderAddrDetail }
								</c:if>
							</c:if>
							</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:30px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			상세 정보
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
			    			<span class="orderNamePhone">
			    			<c:if test="${empty loginMember }">
								<span style="color:#FFCD4A;">상세정보를 입력해주세요!</span>
							</c:if>
							<c:if test="${not empty loginMember }">
								${loginMember.name }, ${loginMember.phone.substring(0,3)}-${loginMember.phone.substring(3,7)}-${loginMember.phone.substring(7,11)}
							</c:if>
							</span>
						</div>
			    	</div>
			    	<div class="d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
				    		<span class="orderPlaceRequest">
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:5px 0 10px 0;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left text-dark" style="width: 200px;">
				    		<button type="button" class="btn btn-sm text-dark font-weight-bold" style="border:1px solid lightgray;font-size: 0.7rem;"
				    			data-toggle="modal" data-target="#changeOrderDataModal">
				    			수정
				    		</button>
						</div>
			    	</div>
			    </div> 
  			</div>
  			
	    	<div class="card" style="border:none;margin-top:50px;">
	    		 <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<p class="text-left" style="margin:0 0 10px 0;">
		        		<span>
							<span style="font-size:1.2rem;font-weight:bold;">
								배송 시간 선택
							</span>
		        		</span>
		        	</p>
			    </div>
			    <div class="card-body" style="padding:50px 10px;">
		    		<table class="deliveryTable">
		    			<thead>
		    			</thead>
		    			<tbody>
		    			</tbody>
		    		</table>
			    </div> 
  			</div>
  			<c:if test="${not empty loginMember}">
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								쿠폰 / 적립금
							</div>
		        		</div>
		        	</div>
			    </div>
			    
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    			쿠폰 적용
			    		</div>
			    		<div class="item text-left" style="width: 600px;font-size: 0.8rem;white-space: nowrap;">
			    			<section id="theme">
					    		<div class="select">
						    		<div class="selectTitle text-dark">사용가능 쿠폰 ${couponCnt }장 / 전체 ${couponCntN + couponCnt }장</div>
							    		<ul class="option-list text-secondary">
								            <li class="option" value="7777" >
								            	<span style="width:300px;padding:0 10px;">쿠폰 적용 안함</span>
								            </li>
								           <c:forEach var="coupon" items="${couponList }" varStatus="status">
									            <li class="option" value="${coupon.couponNum }" data-disPrice="${coupon.disPrice }">
										            <span style="width:300px;padding:0 10px;">${coupon.couponName }</span> 
										            <span style="color:#B03FE3;"><fmt:formatNumber pattern="###,###,###" value="${coupon.leastCost }" />원 이상 구매시 <fmt:formatNumber pattern="###,###,###" value="${coupon.disPrice }" />원 할인</span> 
									           	</li>
								            </c:forEach>
								           <c:forEach var="coupon" items="${couponListN }" varStatus="status">
									            <li class="option2" style="color:#9C9C9C;background-color:#F6F6F6;" value="${coupon.couponNum }">
										            <span style="width:300px;padding:0 10px;">${coupon.couponName }</span> 
										            <span style=""><fmt:formatNumber pattern="###,###,###" value="${coupon.leastCost }" />원 이상 구매시 <fmt:formatNumber pattern="###,###,###" value="${coupon.disPrice }" />원 할인</span> 
									           	</li>
								            </c:forEach>
							    		</ul>
							        </div>
					        </section>
					        <div style="padding-top:5px;">
					        	<a href="../inquiry/inquiry.do" style="color:#9A30AE;text-decoration: none !important;font-size: 0.7rem;">
					        		쿠폰 사용 문의 (고객센터) >
					        	</a>
					        </div>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:30px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			적립금 적용
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 180px;font-size: 0.85rem;white-space: nowrap;">
				    		<input class="emoney"  type="number" value="0" style="padding:5px;border:1px solid lightgray;">
						</div>
			    		<button type="button" class="emoneyTotBtn btn-sm text-dark font-weight-bold" style="background-color:white;padding:7px;border:1px solid lightgray;font-size: 0.7rem;">
			    			모두 사용
			    		</button>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
				    		<span>
				    			사용가능 적립금
				    			<span class="totEmoney font-weight-bold" data-emoney="${orders.usageAmount}">
				    				${orders.usageAmount}
				    			</span>
				    			원
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:10px 0 10px 0;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left text-secondary" style="width: 200px;font-size: 0.7rem;">
				    		<span>
				    			적립금 내역: 마이콜라비>적립금
				    		</span>
						</div>
			    	</div>
			    </div> 
  			</div>
  			</c:if>
  			
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								결제 수단
							</div>
		        		</div>
		        	</div>
			    </div>
			    
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    			결제 수단 선택
			    		</div>
			    		<div class="item text-left" style="width: 700px;font-size: 0.8rem;white-space: nowrap;">
				    		<button type="button" class="kakaoBtn btn font-weight-bold" style="padding:15px;width:390px;border:1px solid lightgray;">
				    			<i class="bi bi-chat-fill"></i> Pay
				    		</button>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 700px;">
				    		<div class="btn-group" style="width:390px;">
								<button type="button" class="cardBtn btn font-weight-bold" style="padding:15px 12px;font-size: 0.8rem;border:1px solid lightgray;">
									신용카드
								</button>
								<button type="button" class="easyBtn btn font-weight-bold" style="padding:15px 12px;font-size: 0.8rem;border:1px solid lightgray;">
									간편 결제
								</button>
								<button type="button" class="phoneBtn btn font-weight-bold" style="padding:15px 12px;font-size: 0.8rem;border:1px solid lightgray;">
									휴대폰
								</button>
							</div>
						</div>

			    	</div>
			    	
			    	<div id="cardPick1" class="payPick d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
			    			<select name="ptNum" title="결제수단" id="select2" style="margin:20px 0 0 200px;width:270px;padding:10px;border:1px solid lightgray;">
					            <option>현대</option>
					            <option>신한 </option>
					            <option>비씨(페이북)</option>
					            <option>KB국민</option>
					            <option>삼성</option>
					            <option>롯데</option>
					            <option>하나(외환)</option>
					            <option>NH채움</option>
					            <option>우리</option>
					            <option>수협</option>
					            <option>씨티</option>
					            <option>광주</option>
					            <option>전북</option>
					            <option>제주</option>
					            <option>신협체크</option>
					            <option>MG새마을체크</option>
					            <option>저축은행체크</option>
					            <option>우체국카드</option>
					            <option>KDB산업은행</option>
					            <option>카카오뱅크</option>
					        </select>
						</div>
			    	</div>
			    	<div id="cardPick2" class="payPick d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
			    			<select name="ptNum" title="결제수단할부" id="select2" style="margin:5px 0 10px 200px;width:270px;padding:10px;border:1px solid lightgray;">
					            <option>일시불</option>
					            <option>2개월(무이자)</option>
					            <option>3개월(무이자)</option>
					            <option>4개월</option>
					            <option>5개월</option>
					            <option>6개월</option>
					            <option>7개월</option>
					            <option>8개월</option>
					            <option>9개월</option>
					            <option>10개월</option>
					            <option>11개월</option>
					            <option>12개월</option>
					        </select>
					        <div style="padding-top:5px;">
					        	<span class="text-secondary" style="font-size: 0.7rem;">
					        		은행계열/체크/기프트/선불/법인/개인사업자/기업카드는 무이자 할부 시 제외
					        	</span>
					        </div>
						</div>
			    	</div>
			    	<div id="easyPick" class="payPick d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    		</div>
			    		<div class="item text-dark text-left font-weight-bold" style="margin:20px 0 0 200px;font-size: 0.9rem;">
			    			<span style="margin:7px;">
			    				<label style="cursor:pointer;">
			    				<input type="radio" class="easyPay" value="3" name="ptNum" style="width:25px;height:25px;vertical-align: middle;" checked> 네이버페이
		    					</label>
		    				</span>
		    				<span style="margin:10px;">
		    					<label style="cursor:pointer;">
		    					<input type="radio" class="easyPay" value="4" name="ptNum" style="width:25px;height:25px;vertical-align: middle;"> 토스
		    					</label>
		    				</span>
					        <div style="margin:7px;">
					        <label style="cursor:pointer;">
			    				<input type="radio" class="easyPay" value="5"  name="ptNum" style="width:25px;height:25px;vertical-align: middle;"> 무통장입금
					        </label>
					        </div>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:30px 0 10px 0;">
			    		<div class="item text-left text-secondary" style="width: 200px;font-size: 0.7rem;">
				    		<span>
				    			※ 카카오페이, 네이버페이, 토스 결제시 결제하신 수단으로만 환불되는 점 양해 부탁드립니다.
				    		</span>
						</div>
			    	</div>
			    </div> 
  			</div>
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								개인정보 수집 / 제공
							</div>
		        		</div>
		        	</div>
			    </div>
			    
			    <div class="card-body" style="padding:15px 10px;">
			    	<form action="#">
				    	<div class="text-dark font-weight-bold" style="font-size:1rem;">
				    		<label>
								<input type="checkbox" name="cb0" class="check-all">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;">
									결제 진행 필수 전체 동의
								</span>
							</label>
				    	</div>
				    	<div class="text-dark" style="font-size:0.8rem;">
				    		<label>
								<input type="checkbox" name="cb1" id="cb1" class="check-one">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;text-decoration: underline;"
									data-toggle="modal" data-target="#agreeModal1">
									(필수) 개인정보 수집 · 이용 및 처리 동의
								</span>
							</label>
				    	</div>
				    	<div class="text-dark" style="font-size:0.8rem;">
				    		<label>
								<input type="checkbox" name="cb2" id="cb2" class="check-one">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;text-decoration: underline;"
									data-toggle="modal" data-target="#agreeModal2">
									(필수) 개인정보 제3자 제공 동의
								</span>
							</label>
				    	</div>
				    	<div class="text-dark" style="font-size:0.8rem;">
				    		<label>
								<input type="checkbox" name="cb3" id="cb3" class="check-one">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;text-decoration: underline;"
									data-toggle="modal" data-target="#agreeModal3">
									(필수) 전자지급 결제대행 서비스 이용약관 동의
								</span>
							</label>
				    	</div>
			    	</form>
			    	<div class="text-secondary" style="font-size:0.7rem;">
			    		<ul style="list-style: none;padding:30px 0 0 0;">
							<li>※ [주문 완료] 상태일 경우에만 주문 취소 가능합니다.</li>
							<li>※ 미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
							<li>※ 쿠폰, 적립금 사용 금액을 제외한 실 결제 금액 기준으로 최종 산정됩니다.</li>
							<li>※ 배송 불가 시 결제 수단으로 환불됩니다. 상품이 품절일 경우 신속하게 환불해 드리겠습니다.</li>
						</ul>
			    	</div>
			    </div> 
  			</div>
		    <div class="d-flex justify-content-center">
		    	<button id="orderBtn" type="button" class="btn font-weight-bold"
					style="width:250px;border:1px solid #9A30AE;background-color:#9A30AE;border-radius:3px;padding:15px;color:white;font-size:1rem;">
					<c:if test="${orders.totPrice >= 40000 }">
						<fmt:formatNumber pattern="###,###,###" value="${orders.totPrice }" /> 원 결제하기
					</c:if>
					<c:if test="${orders.totPrice < 40000 }">
						<fmt:formatNumber pattern="###,###,###" value="${orders.totPrice + 3000 }" /> 원 결제하기
					</c:if>
				</button>
		    </div>
		</div>
		<!-- 결제 메뉴 -->
		<div class="col-sm-2">
			<div class="quickPayMenu">
				
				<div style="padding:15px">
					<p class="font-weight-bold text-dark" style="margin-bottom: 10px;">
						<span style="font-size:1.2rem;">
							결제 금액
						</span>
					</p>
				</div>
				
				<div style="padding: 0 20px;">
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							상품금액
						</div>
						<div class="totPriceTemp font-weight-bold" data-totPrice="${orders.totPrice }" style="margin-bottom: 10px;">
							<fmt:formatNumber pattern="###,###,###" value="${orders.totPrice }" /> 원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary" style="font-size:0.8rem;">
						<div style="margin-bottom: 5px;">
							┕ 상품금액
						</div>
						<div class="totGoodsprice" data-totGoodsprice="${orders.totGoodsprice }" style="margin-bottom: 5px;">
							<fmt:formatNumber pattern="###,###,###" value="${orders.totGoodsprice }" /> 원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary" style="font-size:0.8rem;">
						<div style="margin-bottom: 10px;">
							┕ 상품할인금액
						</div>
						<div class="totDiscount" data-totDiscount="${orders.totDiscount }" style="margin-bottom: 10px;">
							- <fmt:formatNumber pattern="###,###,###" value="${orders.totDiscount }" /> 원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							배송비
						</div>
						<div class="font-weight-bold" style="margin-bottom: 10px;">
							<c:if test="${orders.totPrice >= 40000 }">
								0 원
							</c:if>
							<c:if test="${orders.totPrice < 40000 }">
								+ 3,000 원
							</c:if>
						</div>
					</div>
					<c:if test="${not empty loginMember}">
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							쿠폰 할인
						</div>
						<div class="couponDisPrice font-weight-bold" style="margin-bottom: 10px;color:#FFCD4A;">
							0 원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							적립금 사용
						</div>
						<div class="emoneyDisPrice font-weight-bold" style="margin-bottom: 10px;color:#FFCD4A;">
							0 원
						</div>
					</div>
					</c:if>
					
				</div>
				
				<div class=""style="padding: 20px 20px;">
					<div class="d-flex flex-row justify-content-between font-weight-bold" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							최종결제금액
						</div>
						<div class="totPrice" data-saverate="${orders.saverate }" data-totPrice="${orders.totPrice }" style="margin-bottom: 10px;color:#9A30AE;font-size: 1.3rem;">
							<c:if test="${orders.totPrice >= 40000 }">
								<fmt:formatNumber pattern="###,###,###" value="${orders.totPrice }" /> 원
							</c:if>
							<c:if test="${orders.totPrice < 40000 }">
								<fmt:formatNumber pattern="###,###,###" value="${orders.totPrice + 3000 }" /> 원
							</c:if>
						</div>
					</div>
					<c:if test="${not empty loginMember}">
					<div class="text-right font-weight-bold text-dark" style="font-size:0.7rem;">
						<div>
							<button class="btn font-weight-bold" style="color:white;background-color: #FFCD4A;border-radius:15px;width:32px;padding:1px;font-size:0.6rem;">
								적립
							</button>
							<span class="saveEmoneyOrder text-secondary" data-saverate="${orders.saverate }" style="font-size:0.7rem;">
								구매 시 <fmt:formatNumber pattern="###,###,###" value="${(orders.saverate / 100) * orders.totPrice }" /> 원 (${orders.saverate }%)
							</span>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<footer>
		<%@ include file= "../common/footer.jspf"%>
	</footer>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>


// 주문 상품 목록
function openList() {
	if($('.orderInfo').css('display') != 'none') {
		$('.orderInfo').css('display', 'none');		
		$('.product').css('display', 'block');		
	} else {
		$('.orderInfo').css('display', 'block');		
		$('.product').css('display', 'none');		
	}
}
$(function() {
	
	// 숫자 1000단위 표기
	function addComma(value){
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
	}
	// 배송시간 선택
	let today = new Date();
	var dateHtml = '<tr><th style="color:#FFCD4A;">샛별배송</th>';
	var dateVal = '';
	var timeVal = '';
	var deliveryHtml = '';
	
	for(var i = 1; i < 6; i++) {
		var tomorrow = new Date(today.setDate(today.getDate()+1));
		var year = tomorrow.getFullYear();
		var month = tomorrow.getMonth() + 1;
		var date = tomorrow.getDate();
		var day = tomorrow.getDay();
		
		if (day == 0 ) {
			day = '일';
		} else if (day == 1) {
			day = '월';
		} else if (day == 2) {
			day = '화';
		} else if (day == 3) {
			day = '수';
		} else if (day == 4) {
			day = '목';
		} else if (day == 5) {
			day = '금';
		} else if (day == 6) {
			day = '토';
		}
		dateHtml += '<th>' + month + '/' + date + ' (' + day + ')' + '</th>';
		if (i == 1) {
			timeVal = ' 06:00:00';
			deliveryHtml += '<tr><td style="color:#9A30AE;font-weight:bold;">~06:00까지</td>';
		} else if (i == 2) {
			timeVal = ' 10:00:00';
			deliveryHtml += '<tr><td style="color:#9A30AE;font-weight:bold;">06:00~10:00</td>';
		} else if (i == 3) {
			timeVal = ' 13:00:00';
			deliveryHtml += '<tr><td style="color:#9A30AE;font-weight:bold;">10:00~13:00</td>';
		} else if (i == 4) {
			timeVal = ' 17:00:00';
			deliveryHtml += '<tr><td style="color:#9A30AE;font-weight:bold;">13:00~17:00</td>';
		} else if (i == 5) {
			timeVal = ' 21:00:00';
			deliveryHtml += '<tr><td style="color:#9A30AE;font-weight:bold;">17:00~21:00</td>';
		}
	
		var deltoday = new Date();
		for (var t = 0; t < 5; t++) {
			var delday = new Date(deltoday.setDate(deltoday.getDate()+1));
			var delyear = delday.getFullYear();
			var delmonth = delday.getMonth() + 1;
			var deldate = delday.getDate();
			dateVal = delyear + '-' + delmonth + '-' + deldate;
			
			if (i == 1 && t == 0) {
				deliveryHtml += '<td><label style="padding:0;margin:0;cursor:pointer;"><input type="radio" value="' + dateVal + timeVal + '" name="deliveryPick" checked> 예약가능</label></td>';
			} else {
				deliveryHtml += '<td><label style="padding:0;margin:0;cursor:pointer;"><input type="radio" value="' + dateVal + timeVal + '" name="deliveryPick"> 예약가능</label></td>';
			}
		}
		deliveryHtml += '</tr>'
	}
	dateHtml += '</tr>';
	$(".deliveryTable").find("thead").html(dateHtml);
	$(".deliveryTable").find("tbody").html(deliveryHtml);
	
	
	// 배송 정보 수정
	$('.chkPhone').css('display', 'none');
	$('.extraPlace').css('display', 'none');
	
	// 휴대폰 11글자 입력 표기 
	$("#orderPhone").keyup(function(e) {
		if ($('#orderPhone').val().length != 11){
			$('.chkPhone').css('display', 'block');
		} else {
			$('.chkPhone').css('display', 'none');
		}
	});
	
	// 기타 장소 세부사항 표기
	$('input:radio[name=orderPlace]').click(function (){
		var orderPlaceVal = $('input:radio[name=orderPlace]:checked').val();
		var orderPlaceTitle = '<span class="text-dark">기타 장소 세부 사항 <span class="text-danger"><sup>*</sup></span></span>';
		if (orderPlaceVal == 4) {
			$('.extraPlaceTh').html(orderPlaceTitle);
			$('.extraPlace').css('display', 'block');
		} else {
			$('.extraPlaceTh').html('');
			$('.extraPlace').css('display', 'none');
		}
	});
	// 주문자 정보와 동일
	$('.check-order').click(function (){
		if ($('.check-order').is(':checked')) {
			var orderNameChk = $('.check-order').attr('data-name');
			var orderPhoneChk = $('.check-order').attr('data-phone');
			var orderAddrChk = $('.check-order').attr('data-addr');
			var orderAddrDetailChk = $('.check-order').attr('data-addrDetail');
			$('#orderName').val(orderNameChk);
			$('#orderPhone').val(orderPhoneChk);
			$('#address_kakao').val(orderAddrChk);
			$('#address_detail').val(orderAddrDetailChk);
		} else {
			$('#orderName').val('');
			$('#orderPhone').val('');
			$('#address_kakao').val('');
			$('#address_detail').val('');
			$('#orderName').attr('placeholder').val(" 이름을 입력해 주세요.");
			$('#orderPhone').attr('placeholder').val(" 숫자만 입력해 주세요.");
			$('#address_kakao').attr('placeholder').val(" 주소를 입력해주세요.");
			$('#address_detail').attr('placeholder').val(" 나머지 주소를 입력해주세요.");
		}
	});
	
	// 총 결제 금액 계산
	
	var deliveryFeeOrder = 0;
	var saveRate = 0;
	
	function totalPriceTemp() {

		var totPriceTemp = $('.totPriceTemp').attr('data-totPrice');
		totPriceTemp = parseInt(totPriceTemp);
		
		var totPriceOrder = totPriceTemp;
		var totPriceEnd = totPriceTemp;
		var saveEmoney = 0;
		saveRate = $('.totPrice').attr('data-saverate');
		var percent = saveRate;
		
		if (saveRate != 0) {
			saveRate = (saveRate / 100);
		}
		
		if (totPriceOrder < 40000 ) {
			deliveryFeeOrder = 3000;
			totPriceOrder += 3000;
		}
		if (selectDisPrice != "" || selectDisPrice != null || selectDisPrice != undefined || ( selectDisPrice != null && typeof selectDisPrice != "object" && Object.keys(selectDisPrice).length)) {
			if ((typeof selectDisPrice) != 'object' || (typeof selectDisPrice) != 'number'){
				selectDisPrice = parseInt(selectDisPrice);
			} 
			if (isNaN(selectDisPrice) == true) {
				selectDisPrice = 0;
			}
			if (selectDisPrice == 0) {
				$('.couponDisPrice').html(selectDisPrice + ' 원');
			} else {
				$('.couponDisPrice').html('- ' + addComma(String(selectDisPrice)) + ' 원');
			}

			totPriceOrder -= selectDisPrice;
			totPriceEnd -= selectDisPrice;
		} else {
			$('.couponDisPrice').html('0 원');
		}
		if (usageAmountOrder != '0' || usageAmountOrder != 0) {
			usageAmountOrder = parseInt(usageAmountOrder);
			
			totPriceOrder -= usageAmountOrder;
			totPriceEnd -= usageAmountOrder;
			
			$('.emoneyDisPrice').html('- ' + addComma(String(usageAmountOrder)) + ' 원');
		} else {
			$('.emoneyDisPrice').html('0 원');
		}
		if (saveRate != 0) {
			saveEmoney = (totPriceEnd * saveRate);
			saveEmoney = Math.round(saveEmoney);
			$('.saveEmoneyOrder').html('구매 시 ' + addComma(String(saveEmoney)) + ' 원 (' + percent + '%)');
		}
		
		$('.totPrice').attr('data-totPrice', totPriceOrder);
		// 최종 금액 
		$('.totPrice').html(addComma(String(totPriceOrder)) + ' 원');
		$('#orderBtn').html(addComma(String(totPriceOrder)) + ' 원 결제하기');
	}
	
	
	// 배송지 변경 안내 hover
	$('.info-title').hover(function() {
		$('.info-text').css('display', 'block');
	}, function(){
		$('.info-text').css('display', 'none');
	});
	
	// 전체 선택 check box
	$('.check-all').click( function() {
		$('.check-one').prop('checked', this.checked);
		$('.check-all').prop('checked', this.checked);
	});
	$('.check-one').click( function() {
		var selectNumber = $('input:checkbox[class=check-one]:checked').length;
		if (selectNumber == 3) {
			$('.check-all').prop('checked', this.checked);
		} else {
			$('.check-all').prop('checked', false);
		}
	});
	
	// 결제 박스
	var currentPosition = parseInt($(".quickPayMenu").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		var newPosition = position + currentPosition - 100 + "px";
		var endPosition = position + currentPosition - 200 + "px";
		// 일정 위치에서 멈추기
		if (Math.round( $(window).scrollTop()) > $(document).height() - $(window).height()) {
			$(".quickPayMenu").stop().animate({"top":endPosition},800);
		} else {
   			$(".quickPayMenu").stop().animate({"top":newPosition},800);
		}
	}).scroll();
	
	// 결제 수단 선택
	var pay = '';
	
	// 카카오페이 결제
	$('.kakaoBtn').click( function() {
		pay = '1';
		
		$('.kakaoBtn').css('background-color', '#F6E500');
		$('.kakaoBtn').css('border', '1px solid #F6E500');
		
		$('.cardBtn, .easyBtn, .phoneBtn').css('background-color', 'white');
		$('.cardBtn, .easyBtn, .phoneBtn').css('color', 'black');
		$('.cardBtn, .easyBtn, .phoneBtn').css('border', '1px solid lightgray');
		
		$('.payPick').css('display', 'none');
	});
	
	// 카드 결제
	$('.cardBtn').click( function() {
		pay = '2';
		
		$('.cardBtn').css('background-color', '#9A30AE');
		$('.cardBtn').css('color', 'white');
		$('.cardBtn').css('border', '1px solid #9A30AE');

		$('.kakaoBtn, .easyBtn, .phoneBtn').css('background-color', 'white');
		$('.kakaoBtn, .easyBtn, .phoneBtn').css('color', 'black');
		$('.kakaoBtn, .easyBtn, .phoneBtn').css('border', '1px solid lightgray');
		
		$('.payPick').attr('style', 'display: none !important');
		$('#cardPick1').attr('style', 'display: block !important');
		$('#cardPick2').attr('style', 'display: block !important');
	});
	
	// 간단 결제
	$('.easyBtn').click( function() {
		pay = '3';
		
		$('.easyBtn').css('background-color', '#9A30AE');
		$('.easyBtn').css('color', 'white');
		$('.easyBtn').css('border', '1px solid #9A30AE');
		
		$('.kakaoBtn, .cardBtn, .phoneBtn').css('background-color', 'white');
		$('.kakaoBtn, .cardBtn, .phoneBtn').css('color', 'black');
		$('.kakaoBtn, .cardBtn, .phoneBtn').css('border', '1px solid lightgray');
		
		$('.payPick').attr('style', 'display: none !important');
		$('#easyPick').attr('style', 'display: block !important');
	});
	
	// 휴대폰 결제
	$('.phoneBtn').click( function() {
		pay = '6';
		
		$('.phoneBtn').css('background-color', '#9A30AE');
		$('.phoneBtn').css('color', 'white');
		$('.phoneBtn').css('border', '1px solid #9A30AE');
		
		$('.kakaoBtn, .cardBtn, .easyBtn').css('background-color', 'white');
		$('.kakaoBtn, .cardBtn, .easyBtn').css('color', 'black');
		$('.kakaoBtn, .cardBtn, .easyBtn').css('border', '1px solid lightgray');
		
		$('.payPick').attr('style', 'display: none !important');
	});
	
	$('.easyPay').click(function (){
		pay = $('input:radio[class=easyPay]:checked').val();
	});
	// 알림창
	function alertNull(msg) {
		Swal.fire({
			title: '',
			text: msg,
			showCancelButton: false,
			confirmButtonColor: '#9A30AE'
		});
	}	
	
	// 주문 번호 생성
	function createOrderNum(){
		const date = new Date();
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		
		let orderNum = year + month + day;
		for(let i=0;i<8;i++) {
			orderNum += Math.floor(Math.random() * 8);	
		}
		return orderNum;
	}
	
	// 결제 API
	var IMP = window.IMP;
	
	// 카카오페이 결제
	function kakaoPay(orderNumSend, orderTotPriceSend, sendData) {
		IMP.init("imp50825346");
		var goodsNamePay = $('.orderInfo').attr('data-productName');
		var listSize = $('.orderInfo').attr('data-size');
		var orderNameValue = $('#orderName').val();
		var orderPhoneValue = $('#orderPhone').val();
		var orderAddrValue = $('#address_kakao').val();
		var orderAddrDetailValue = $('#address_detail').val();
		if (listSize != 1) {
			goodsNamePay = goodsNamePay + ' 외';
		}
		IMP.request_pay({
		    pg : 'kakaopay',
		    merchant_uid: orderNumSend, // 상점에서 관리하는 주문 번호
		    name : goodsNamePay,
		    amount : orderTotPriceSend,
		    buyer_name : orderNameValue,
		    buyer_tel : orderPhoneValue,
		    buyer_addr : orderAddrValue + orderAddrDetailValue,
		}, function(rsp) {
			if (rsp.success) {
				$.ajax({
					type: "POST",
					url: "orderSend.do",
					data: JSON.stringify(sendData),
					contentType: "application/json",
					
					success: function(data){
						Swal.fire({
							icon: 'success',
							title: '결제 완료',
							showConfirmButton: false,
							timer: 1500
						});
						location.href="orderComplete.do";
					},
					error: function(){
						alert("주문 넣기 실패")
					}
				}); 
		        
			} else {
	          alert("결제 실패");
			}
		});
	}
	// 카드 결제
	function cardPay(orderNumSend, orderTotPriceSend, sendData) {
		IMP.init("imp50825346");
		var goodsNamePay = $('.orderInfo').attr('data-productName');
		var listSize = $('.orderInfo').attr('data-size');
		var orderNameValue = $('#orderName').val();
		var orderPhoneValue = $('#orderPhone').val();
		var orderAddrValue = $('#address_kakao').val();
		var orderAddrDetailValue = $('#address_detail').val();
		if (listSize != 1) {
			goodsNamePay = goodsNamePay + ' 외';
		}
		IMP.request_pay({
		    pg : 'html5_inicis',
		    merchant_uid: orderNumSend, // 상점에서 관리하는 주문 번호
		    name : goodsNamePay,
		    amount : orderTotPriceSend,
		    buyer_name : orderNameValue,
		    buyer_email : 'snoopy1234@gmail.com',
		    buyer_tel : orderPhoneValue,
		    buyer_addr : orderAddrValue + orderAddrDetailValue,
		    naverPopupMode : true, 
		}, function(rsp) {
			if (rsp.success) {
				$.ajax({
					type: "POST",
					url: "orderSend.do",
					data: JSON.stringify(sendData),
					contentType: "application/json",
					
					success: function(data){
						Swal.fire({
							icon: 'success',
							title: '결제 완료',
							showConfirmButton: false,
							timer: 1500
						});
						location.href="orderComplete.do";
					},
					error: function(){
						alert("주문 넣기 실패")
					}
				}); 
		        
			} else {
	          alert("결제 실패" + rsp.error_msg);
			}
		});
	}

	
	// 주문하기 버튼
	$('#orderBtn').click( function() {
		var orderNumSend = createOrderNum();
		orderNumSend = orderNumSend.substring(2,16);
		var orderNameSend = $('#orderName').val();
		var orderDeliveryPickSend = $('input:radio[name=deliveryPick]:checked').val();
		if (saveRate != 0) {
			var orderCouponNumSend = selectVal;
		} else {
			var orderCouponNumSend = 7777;
		}
		var orderUsageAmountSend = usageAmountOrder;
		var orderPtNumSend = pay;
		var orderTotGoodsPrice = $('.totGoodsprice').attr('data-totGoodsprice');
		var orderTotDiscount = $('.totDiscount').attr('data-totDiscount');
		var orderTotPriceSend = $('.totPrice').attr('data-totPrice');
		if (orderNameSend != ''){
			if (orderCouponNumSend != '' || orderCouponNumSend != 0 || orderCouponNumSend != '0') {
					if (orderPtNumSend != '') {
						if ( $('#cb1').is(':checked') && $('#cb2').is(':checked') && $('#cb3').is(':checked') ) {
							if (orderCouponNumSend == '7777' || orderCouponNumSend == 7777) {
								orderCouponNumSend = 0;
							}
							var sendData = {
									orderNum : orderNumSend,
									deliveryPick : orderDeliveryPickSend,
									deliveryFee : deliveryFeeOrder,
									totGoodsprice : orderTotGoodsPrice,
									totDiscount : orderTotDiscount,
									totPrice : orderTotPriceSend,
									couponNum : orderCouponNumSend,
									usageAmount : orderUsageAmountSend,
									ptNum : orderPtNumSend
							};
							if (orderPtNumSend == 1) {
								kakaoPay(orderNumSend, orderTotPriceSend, sendData);
							} else if (orderPtNumSend == 2) {
								cardPay(orderNumSend, orderTotPriceSend, sendData);
							} 
							else {
								$.ajax({
									type: "POST",
									url: "orderSend.do",
									data: JSON.stringify(sendData),
									contentType: "application/json",
									
									success: function(data){
										Swal.fire({
											icon: 'success',
											title: '결제 완료',
											showConfirmButton: false,
											timer: 1500
										});
										location.href="orderComplete.do";
									},
									error: function(){
										alert("주문 넣기 실패")
									}
								}); 
							}
							
							
						} else {
							alertNull('결제 진행 필수 동의에 체크해주세요.');
						}
					} else {
						alertNull('결제  수단을 선택해주세요.');
					}
			} else {
				alertNull('쿠폰을 선택해주세요.');
			}
		} else {
			alertNull('배송 정보를 입력해주세요.');
		}
	});
	
	// 쿠폰 selectbox
	function onClickSelect(e) {
		  const isActive = e.currentTarget.className.indexOf("active") !== -1;
		  if (isActive) {
		    e.currentTarget.className = "select";
		  } else {
		    e.currentTarget.className = "select active";
		  }
	}

	document.querySelector("#theme .select").addEventListener("click", onClickSelect);
	
	 var selectVal = '';
	 var selectDisPrice = '';
	function onClickOption(e) {
	  const selectedValue = e.currentTarget.innerHTML;
	  // 쿠폰 값~~~~~~~~~~~~~
	  selectVal = e.currentTarget.value;
	  if (selectVal != '0' || selectVal != 0|| selectVal != 7777 || selectVal != '7777') {
		  selectDisPrice = e.currentTarget.getAttribute('data-disPrice');
	  } else if (selectVal == '0' || selectVal == 0|| selectVal == 7777 || selectVal == '7777' ) {
		  selectDisPrice = '0';
	  }
	  document.querySelector("#theme .selectTitle").innerHTML = selectedValue;
	  totalPriceTemp();
	}

	var optionList = document.querySelectorAll("#theme .option");
	for (var i = 0; i < optionList.length; i++) {
	  var option = optionList[i];
	  option.addEventListener("click", onClickOption);
	}
	
	var usageAmountOrder = 0;
	// 적립금 사용
	$(".emoney").change(function() {
		usageAmountOrder = $(this).val();
		totalPriceTemp();
	});

	// 적립금 모두 사용
	$('.emoneyTotBtn').click( function() {
		var totEmoney = $('.totEmoney').attr('data-emoney');
		$('.emoney').val(totEmoney);
		
		usageAmountOrder = totEmoney;
		totalPriceTemp();
	});
// end
});
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = '';
                
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우(R)
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
			$('#address_kakao').val(addr); // 주소 넣기
			$('#address_detail').focus(); //상세입력 포커싱
		}
	}).open();
}
function changeAddr() {
	if ($('#address_kakao').val().replace(/\s/gi, "") != '' && $('#address_detail').val().replace(/\s/gi, "") != '') {
		var addr = $('#address_kakao').val();
		var addrDetail = $('#address_detail').val();
		var sendAddr = {
				address : addr,
				addressDetail : addrDetail
			};
		$.ajax({
			type: "POST",
			url: "../cart/changeAddr.do",
			data: JSON.stringify(sendAddr),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
				let addrHtml = addr + " " + addrDetail;
				$(".addressView").html(addrHtml);
			},
			error: function(){
			}
		}); 
		$('#changeAddressModal').modal('hide');
	} else {
		Swal.fire({
			icon: 'warning',
			title: '', 
			text: '주소와 상세 주소를 모두 입력해주세요.',
			showConfirmButton: false,
			timer: 1500
		});
	}
}

// 배송 정보 유효성 검사 및 입력
function changeOrder() {
	if ($('#orderName').val().replace(/\s/gi, "") != '') {
		if ($('#orderPhone').val().replace(/\s/gi, "") != '') {
			if ($('#orderPhone').val().length == 11) {
				if ($('#address_kakao').val() != '' && $('#address_detail').val() != '') {
					if ($('input:radio[name=orderPlace]:checked').val() == 4 && $('.extraPlaceText').val().replace(/\s/gi, "") == '') {
						alertWarning('기타 장소 세부사항을 입력해주세요.');
					} else {
						var orderNameVal = $('#orderName').val();
						var orderPhoneVal = $('#orderPhone').val();
						var orderAddrVal = $('#address_kakao').val();
						var orderAddrDetailVal = $('#address_detail').val();
						var orderPlaceVal = $('input:radio[name=orderPlace]:checked').val();
						var orderRequestVal = '';
						var extraPlace = '';
						
						if (orderPlaceVal == 1) {
							orderPlaceVal = '문 앞';
						} else if (orderPlaceVal == 2) {
							orderPlaceVal = '경비실';
						} else if (orderPlaceVal == 3) {
							orderPlaceVal = '택배함';
						} else if (orderPlaceVal == 4) {
							orderPlaceVal = '기타 장소';
							extraPlace = ' (' + $('.extraPlaceText').val() + ')';
						}
						if ($('.orderRequest').val() != '') {
							orderRequestVal = $('.orderRequest').val();
						}
						var sendOrderData = {
								orderName : orderNameVal,
								orderPhone : orderPhoneVal,
								orderAddr : orderAddrVal,
								orderAddrDetail : orderAddrDetailVal,
								orderPlace : orderPlaceVal + extraPlace,
								orderRequest : orderRequestVal
							};
						$.ajax({
							type: "POST",
							url: "changeOrderData.do",
							data: JSON.stringify(sendOrderData),
							contentType: "application/json",
							dataType: "json",
							success: function(data){

								var orderNamePhoneHtml = data.orderName + ', ' + data.orderPhone.substring(0, 3) + '-' + data.orderPhone.substring(3, 7) + '-' + data.orderPhone.substring(7, 11);
								var orderPlaceRequestHtml = data.orderPlace;
								if (data.orderRequest != '') {
									orderPlaceRequestHtml += ' | ' + data.orderRequest;
								}
								var orderAddrHtml = data.orderAddr + ' ' + data.orderAddrDetail;
								
								
								$('.orderNamePhone').html(orderNamePhoneHtml);
								$('.orderPlaceRequest').html(orderPlaceRequestHtml);
								$('.orderAddr').html(orderAddrHtml);
								$(":radio[name=orderPlace]").radioSelect(data.orderPlace);
							},
							error: function(){
							}
						}); 
						$('#changeOrderDataModal').modal('hide');
					}
				} else {
					alertWarning('주소와 상세 주소를 모두 입력해주세요.');
				}
			} else {
				alertWarning('휴대폰 번호 11자리를 모두 입력해주세요.');
			}
		} else {
			alertWarning('휴대폰 번호를 입력해주세요.');
		}
	} else {
			alertWarning('이름을 입력해주세요.');
	}
}
function radioSelect(val) {
	  this.each(function() {
	    var $this = $(this);
	    if($this.val() == val)
	      $this.attr('checked', true);
	  });
	  return this;
}
function alertWarning(msg) {
	Swal.fire({
		icon: 'warning',
		title: '', 
		text: msg,
		showConfirmButton: false,
		timer: 1500
	});
}

</script>	
</body>
</html>