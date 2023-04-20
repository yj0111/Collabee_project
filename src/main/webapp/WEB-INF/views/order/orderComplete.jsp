<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
<%@ include file= "../common/bootstrap.jspf"%>
<%@ include file= "../common/modal/orderChkModal.jspf"%>
<%@ include file= "../common/modal/nMemberOrderModal.jspf"%>
<style>
	header {
		margin-bottom:100px;
	}
	footer {
		margin-top:100px;
	}
	.btn:active, .btn:focus {
		text-decoration:none;
		outline:none !important;
		box-shadow:none !important;
	}
</style>
</head>
<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>
	
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8  text-center" style="margin-bottom:20px;" >
			<h3 style="font-weight: bolder;">주문 완료</h3>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8">
			<div class="card" style="border:none;">
				<div class="card-header bg-white text-center" style="padding:30px 30px 90px 30px;border:none">
					<div style="margin:10px 20px 30px 20px;">
						<i class="bi bi-check-circle font-weight-bold" style="font-size:3rem;color:#9A30AE;"></i>
					</div>
					<div class="font-weight-bold text-dark" style="font-size:1.3rem;">
					<c:if test="${empty loginMember }">
						${orders.orderName }
					</c:if>
					<c:if test="${not empty loginMember }">
						${loginMember.name }
					</c:if>
						님의 주문이 완료되었습니다.
					</div>
					<div class="font-weight-bold"  style="color: #9A30AE;margin-top:5px;font-size:1.1rem;">
						${orders.deliveryPick.substring(8,10) }일 ${orders.deliveryPick.substring(11,13) }시에 만나요!
					</div>
				</div>
				<div class="card-body bg-white">
					<div class="row">
						<div class="col-sm-2">
						</div>
						<div class="col-sm-8" style="border-top:1px solid lightgray;padding:30px 10px 0 10px;">
							<div class="d-flex flex-row justify-content-between">
								<div class="text-dark font-weight-bold">
									결제 금액
								</div>
								<div class="font-weight-bold">
									<span style="font-size:1.2rem;">
										<fmt:formatNumber pattern="###,###,###" value="${orders.totPrice }" />
									</span>
									<span>
										원
									</span>
								</div>
							</div>
							<c:if test="${not empty loginMember }">
							<div class="d-flex flex-row justify-content-between">
								<div class="text-dark font-weight-bold">
									적립금
								</div>
								<div>
									<span style="color:#9A30AE;">
										+ <fmt:formatNumber pattern="###,###,###" value="${save }" />
									</span>
									<span>
										원
									</span>
								</div>
							</div>
							</c:if>
							<div style="padding-top:20px;">
								<div class="d-flex flex-row justify-content-between" style="background-color:#F5F2F0;padding:30px;">
									<div style="padding-top:10px;">
										<div class="font-weight-bold" style="font-size:0.95rem;color:#614D45;">
											사람에게도 환경에도 더 이로운 배송
										</div>
										<div class="font-weight-bold" style="font-size:0.85rem;color:#A2948F;">
											종이 포장재에 배송됩니다.
										</div>
									</div>
									<div>
										<div class="font-weight-bold" style="font-size:0.95rem;color:#614D45;">
											ALL
										</div>
										<div class="font-weight-bold" style="font-size:0.95rem;color:#614D45;">
											P<i class="bi bi-recycle" style="font-weight:bold;font-size:0.9rem;color:#9A30AE;"></i>PER
										</div>
										<div class="font-weight-bold" style="font-size:0.85rem;color:#614D45;">
											CHALLENGE
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-2">
						</div>
					</div>
				</div>
				<div class="card-footer bg-white" style="border:none;">
					<div class="row">
						<div class="col-sm-2">
						</div>
						<div class="col-sm-8">
							<div class="text-secondary" style="font-size:0.75rem;">
								<ul style="padding:10px 20px;">
									<li>[배송준비중] 이전일 때 주문내역 상세페이지에서 주문 취소가 가능합니다.</li>
									<li>엘리베이터 이용이 어려운 경우 6층 이상부터는 공동 현관 앞 또는 경비실로 대응 배송 될 수 있습니다.</li>
									<li>주문 / 배송 및 기타 문의가 있을 경우, 1:1 문의에 남겨주시면 신속히 해결해드리겠습니다.</li>
								</ul>
							</div>
							<div class="d-flex justify-content-center" style="margin-top:30px;">
								<c:if test="${not empty loginMember }">
						    	<button type="button"class="btn orderListBtn font-weight-bold" onclick="location.href='../mypage/order.do'"
										style="width:250px;border:1px solid #9A30AE;background-color:white;border-radius:3px;padding:15px;color:#9A30AE;font-size:1rem;margin:10px;">
									주문 상세보기
								</button>
								</c:if>
								<c:if test="${empty loginMember }">
						    	<button type="button"class="btn orderListBtn font-weight-bold" data-toggle="modal" data-target="#orderChkModal"
										style="width:250px;border:1px solid #9A30AE;background-color:white;border-radius:3px;padding:15px;color:#9A30AE;font-size:1rem;margin:10px;">
									주문 상세보기
								</button>
								</c:if>
						    	<button id="shoppingBtn" type="button" class="btn font-weight-bold" onclick="location.href='../collections/main.do'"
										style="width:250px;border:1px solid #9A30AE;background-color:#9A30AE;border-radius:3px;padding:15px;color:white;font-size:1rem;margin:10px;">
									쇼핑 계속하기
								</button>
						    </div>
							<div class="d-flex justify-content-center">
						    </div>
						</div>
						<div class="col-sm-2">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<footer>
		<%@ include file= "../common/footer.jspf"%>
	</footer>
</body>
</html>