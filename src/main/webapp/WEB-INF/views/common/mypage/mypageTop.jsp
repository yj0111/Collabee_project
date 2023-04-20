<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script>
$(function(){
	if (${empty loginMember }) {
		alert("로그인 정보가 없습니다.")
		location.href = "../member/login.do";
	}
});
</script>

<script>
// 멤버십정보, 적립금, 쿠폰 정보불러오기
$(function(){
	var mvo = { memberNum : ${loginMember.getMemberNum()} };
	console.log(mvo); 
	
	//총 적립금
	$.ajax("getTotEmoneyAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(emoneyUsage){
			//alert("성공> 받은 데이터 : " + emoneyUsage); 		
			console.log("보유적립금 : " + emoneyUsage + " 원");
			if(emoneyUsage == ""){
				$('#totalEmoney').html('0');					
			} else {
				$('#totalEmoney').html(emoneyUsage);					
			}
		},
		error: function(){
			alert("getTotEmoneyAjax 실패")
		}
	});//ajax끝
		
	//쿠폰 갯수
	$.ajax("getCouponCntAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(couponCnt){
			//alert("성공> 받은 데이터 : " + couponCnt); 		
			console.log("보유쿠폰 : " + couponCnt + " 개");
			$('#couponCnt').html(couponCnt);
		},
		error: function(){
			alert("couponAjax 실패")
		}
	});//ajax끝
	
}); //document onload

// 마이페이지 상단
function emoney() {
	location.href = "emoney.do";
}
function coupon() {
	location.href = "coupon.do";
}
function bannerClick() {
	location.href = "../collections/event.do";
}

function allGrade () {
	alert("[전체등급조회] - 준비중입니다")
}

function nextLevel () {
	alert("[다음달예상등급] - 준비중입니다")	
}

// 마이페이지 네비바
</script>    
<!-- \${ accessToken } : ${accessToken } -->
<!-- 마이페이지 윗부분 -->
			<div id="mypage-cover" style="height: 392px;">
                <div class="d-flex align-items-stretch" id="mypage-top">
 
                  <div class="mypage-top2" style="width: 40%;">
                    <div style="text-align: left;" id="user-grade" >
                      <div style="display: inline-block; height: 48px; margin-right: 20px;">
	                     
	             		<c:if test="${loginMember.grade == 3 }">
	                       	<img src="../resources/imgs/member/grade3.png" style="width: 48px; height: 48px;">
	                 	</c:if>
	             		<c:if test="${loginMember.grade == 2 }">
	                       	<img src="../resources/imgs/member/grade2.png" style="width: 48px; height: 48px;">
	                 	</c:if>
	             		<c:if test="${loginMember.grade == 1 }">
	                       	<img src="../resources/imgs/member/grade1.png" style="width: 48px; height: 48px;">
	                 	</c:if>
            
	             		<c:if test="${loginMember.grade == 0 }">
	                       	<img src="../resources/imgs/member/grade0.png" style="width: 48px; height: 48px;">
	                 	</c:if>
            
                      </div>
                       		
                      <div style="display: inline-block; width: 156px;">
                        <span class="align-left" id="user-name"><b>${loginMember.name }님</b></span>
                      </div>
                    </div>
                      
                    <div class="align-left" id="save-rate"  style="text-align: left;">적립 0.1%</div>
                    <div id="membership-info-button" style="text-align: left; margin: auto;" >
                      <button type="button" class="btn" id="allgrade" style="margin-right: 50px; width: 151px; height: 41px;" onclick="allGrade()">전체등급 보기</button>
                      <button type="button" class="btn" id="nextgrade"style="width: 151px; height: 41px;" onclick="nextLevel()">다음 달 예상등급 보기</button>
                    </div>
                  </div>

                  <div class="mypage-top2" style="width: 30%;">
                      <button type="button" class="btn" style="width: 100%; height: 100%;" onclick="emoney()"> 
                        <div style="padding-bottom: 57px;">
                          <div class="align-left" style="margin-bottom: 10px;"><b>적립금></b></div>
                          <div class="align-left purple-bold ">
								<span id="totalEmoney" ></span> 원
							</div>
                         <!--  <div class="align-left">소멸예정 0원</div> -->
                        </div>
                      </button>
                  </div>

                  <div class="mypage-top2" style="width: 30%; margin: 0;">
                    <button type="button" class="btn" style="width: 100%; height: 100%;" onclick="coupon()">
                      <div style="padding-bottom: 57px;">
                        <div class="align-left" style="margin-bottom:10px;"><b>쿠폰></b></div>
                        <div class="align-left purple-bold">
                        	<span id="couponCnt" ></span> 개
                        </div>
                      </div>
                      <div></div>
                    </button>
                  </div>

                </div>
                <div id="eventbn">
                    <img src="../resources/imgs/member/eventBn.png" alt="이미지 배너" onclick="bannerClick()" style="width: 100%; height: 60px; margin: 0px;">
                </div>
              
              </div>