<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:scriptlet> pageContext.setAttribute("newline", "\n"); </jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
<%@ include file= "../common/bootstrap.jspf"%>
<%@ include file= "../common/modal/insertQnA.jspf"%>
<%@ include file= "../common/modal/insertReview.jspf"%>
<%@ include file= "../common/modal/insertReviewConfirm.jspf"%>
<%@ include file= "../common/modal/reviewDoubleAlert.jspf"%>
<%@ include file= "../common/modal/updateQnA.jspf"%>
<%@ include file= "../common/modal/updateReview.jspf"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
<style>
    .border {
        display: inline-block;
        width: 400px;
        height: 70px;
        margin: 6px;
        padding: 11px 10px 11px 15px;
    }
    .col-3 img{
        width: 450px;
        height: 608px;
        margin-left: 50px;
    }
    .de_img img{
        width: 100%;
    }
    .col-3, .col-5 {
        margin-top: 10px; 
    }
    .sec {
        width: 560px;
    }
    #delivery{
        font-weight: 700;
        line-height: 1.36;
        letter-spacing: -0.5px;
        margin-bottom: 6px;
        width: 500px;
    }
    .name {
        display: flex;
        flex-direction: column;
    }
    .name2{
        display: flex;
        flex: 1 1 0%;
        /*box-pack: justify;*/
        justify-content: space-between;
    }
    .name2 h1 {
        width: 500px;
        font-weight: 500;
        font-size: 24px;
        color: rgb(51, 51, 51);
        line-height: 34px;
        letter-spacing: -0.5px;
        word-break: keep-all;
        margin-right: 20px;
    }
    .name h2 {
        padding-top: 5px;
        font-size: 16px;
        font-weight: 400;
        color: rgb(181, 181, 181);
        line-height: 19px;
        letter-spacing: -0.5px;
    }
    .price {
        display: flex;
        flex-direction: row;
        align-items: flex-end;
        padding-top: 19px;
        font-weight: bold;
        line-height: 30px;
        letter-spacing: -0.5px;
    }
    .pr {
        padding-right: 4px;
        font-size: 28px;
        color: rgb(51, 51, 51);
    }
    .ice {
        display: inline-block;
        position: relative;
        top: 3px;
        font-size: 18px;
        color: rgb(51, 51, 51);
        vertical-align: top;
    }
    .bo {
        display: flex;
        flex-direction: row;
        /*box-align: center;*/
        align-items: center;
        margin-top: 14px;
    }
    #bo1 {
        font-weight: 500;
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    .bo2 {
        color: rgb(51, 51, 51);
        letter-spacing: -0.5px;
        font-weight: 500;
        font-size: 14px;
    }
    .con {
        margin-top: 20px;
    }
    .deli {
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    .deli dt {
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        color: rgb(102, 102, 102);
        line-height: 19px;
    }
    .deli dd {
            display: flex;
        flex: 1 1 0%;
        flex-direction: column;
    }
    .p1 {
        color: rgb(51, 51, 51);
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        overflow: hidden;
    }
    .p2 {
        display: block;
        font-size: 12px;
        color: rgb(102, 102, 102);
        padding-top: 4px;
        line-height: 16px;
        white-space: pre-line;
    }
    .seller {
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    #dt1 {
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        line-height: 19px;
    }
    .dd1{
        display: flex;
        flex: 1 1 0%;
        flex-direction: column;
        color: rgb(51, 51, 51);
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        overflow: hidden;
    }
    .package{
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    #dt2{
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        line-height: 19px;
    }
    .dd2 {
        display: flex;
        flex: 1 1 0%;
        flex-direction: column;
    }
    .p3{
        color: rgb(51, 51, 51);
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        overflow: hidden;
    }
    .p4 {
        display: block;
        font-size: 12px;
        color: rgb(102, 102, 102);
        padding-top: 4px;
        line-height: 16px;
        white-space: pre-line;
    }
    .sel {
        padding-bottom: 40px;
        border-bottom: 1px solid rgb(244, 244, 244);
    }
    .dl {
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    #dt3 {
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        line-height: 19px;
    }
    
    .btn1 {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-top: 12px;
        
    }
    .button {
        display: inline-flex;
        flex-direction: row;
        align-items: center;
        border: 1px solid rgb(221, 223, 225);
        width: 88px;
        border-radius: 3px;
        margin-left: 10px;
    }
    .minus{
        background-color: white;
        border: 1px solid white;
    }
    .plus{
        background-color: white;
        border: 1px solid white;
    }
    .btn btn-primary {
        background-color: #9A30AE;
    }
    
    #su{
        display: inline-flex;
        overflow: hidden;
        white-space: nowrap;
        justify-content: center;
        font-size: 14px;
        font-weight: 600;
        color: rgb(51, 51, 51);
        text-align: center;
        width: 31px;
        height: 28px;
        line-height: 28px;
    }
    
    .price2 {
        font-weight: bold;
        font-size: 12px;
        color: rgb(51, 51, 51);
        padding-right: 5px;
        margin-right: 20px;
    }
    .box1{
        padding-top: 30px;
    }
    .box2{
        letter-spacing: -0.5px;    
    }
    .box3{
        display: flex;
        /*box-pack: end;*/
        justify-content: flex-end;
        align-items: flex-end;
        margin-right: 20px;
    }
    .sp1{
        padding-right: 12px;
        font-size: 13px;
        font-weight: 500;
        color: rgb(51, 51, 51);
        line-height: 20px;
    }
    .sp2{
        font-weight: bold;
        font-size: 32px;
        color: rgb(51, 51, 51);
        line-height: 36px;
    }
    .sp3{
        padding-left: 5px;
        font-size: 20px;
        font-weight: 600;
        color: rgb(51, 51, 51);
        line-height: 30px;
    }
    .box4{
        display: flex;
        justify-content: flex-end;
        padding-top: 10px;
        margin-right: 20px;
    }
    .sp4{
        background-color: #FFCD4A;
        margin: 1px 6px;
        padding: 0px 7px;
        border-radius: 8px;
        font-size: 12px;
        font-weight: 800;
        color: white;
        line-height: 20px;
    }
    #sp5{
        line-height: 1.5;
        font-size: 1em;
    }
    .str{
        font-weight: 650;
        font-size: 17px;
    }
    .box5{
        display: flex;
    }
    .bu1{
        display: block;
        margin: 5px;
        width: 56px;
        height: 56px;
        border-radius: 3px;
        background-color: white;
        border: 1px solid lightgray;
    }
    .bi bi-heart {
        font-size: 20px;
        color: #9A30AE;
    }

    .bi bi-bell {
        font-size: 20px;
    }
    .bu2{
        width: 56px;
        height: 56px;
        background-color: white;
        border: 1px solid lightgray;
        border-radius: 3px;
        margin: 5px;
    }
    .box6{
        display: inline-block;
        font-size: 16px;
        font-weight: 500;
    }
    .sp8{
        margin: 5px;
    }
    .menu{
        width: 800px;
        height: 35px;
        /*text-align: center;*/
        z-index: 20;
        position: sticky;
        top: 56px;
        width: 100%;
        margin-top: 20px;
        margin-bottom: 20px;
        color: black;
        margin-left: 10px;
    }
    .menu ul {
        display: flex;
        flex-wrap: wrap;
        height: 60px;
        /*text-align: center;*/
        background-color:  #FEF7FF;
        background-position: 10px;;
    }
    .menu ul li {
        list-style: none;
        float: left;
        text-align: center;
        line-height: 30px;
        vertical-align: middle;
        display: flex;
    }
    .menu .link {
        width: 190px;
        text-decoration: none;
        display: flex;
        font-weight: bold;
        justify-content: center;
        align-items: center;
        height: 100%;
        text-align: center;
    }
    #demo {
        margin-left: 20px;
    }
    .review {
        margin-left: 70px;
        /*border-bottom: 1px solid rgb(244, 244, 244);*/
    }
    .qna {
        margin-left: 70px;
    }
    .sec2 ul li {
        list-style: disc;
    }
    .re_sp {
        position: absolute;
        margin-left:  left: 20px;
        font-weight: 500;
    }
    .re_bu {
        margin-right: 70px;
        justify-content: flex-end;
        font-weight: 400;
        display: flex;
        font-size: 14px;
    }
    .re_bu button {
        border: none;
        background-color: transparent;
        position: relative;
        font-size: 14px;
    }
    .notice {
        background-color: #E0E0E0;
        margin: 0;
        padding: 5px 7px;
        border-radius: 3px;
        font-size: 15px;
        font-weight: 800;
        color: dimgray;
    }
    .grade {
        border: 1px solid #692498;
        margin: 0;
        padding: 0px 3px;
        border-radius: 5px;
        font-size: 11px;
        font-weight: 800;
        color: #692498;
    }
    .review2 {
        border: none;
        margin-left: 200px;
        margin-right: 50px;
    }
    .rec_btn {
        background-color: transparent;
        border: 1px solid darkgray;
        margin: 0;
        padding: 3px 7px;
        border-radius: 15px;
        font-size: 13px;
        font-weight: 500;
        color: dimgray;
        
    }
    .thum {
        float: right;
    }
    .div_re {
        /*border-bottom: 1px solid rgb(244, 244, 244);*/
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .find-btn{
        text-align: center;
        padding-top: 15px;
    }
    .find-btn1 {
        display :inline-block;
        border: black;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
    }
    .find-btn1 {
        border: solid 1px darkgray;
    }
    .find-btn2 {
        display: inline-block;
        border: 1px solid dimgray;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
    }
    .find-btn2:hover {
        border: solid 1px darkgray;
    }
    table {
        border: 1px solid black;
        width: 95%;
    }
    .card{
        border: white;
       }

      .card-header{
        background-color: white;
        height: 55px;
        padding-top: 13px;
      }
      .card-header a{
        color: black;
        text-decoration: none;
        vertical-align: middle;
      }
      .card-header div{
        text-align: center;
        font-size: 10.5pt;
      }
    .card-body{
        border-top-color: white;
      }
    .clicked {
        font-weight: 900;
      }
    .panel-faq-container {
      margin-bottom: -16px;
    }
    .panel-faq-title {
      color: black;
      cursor: pointer;
    }
    .panel-faq-answer {
      height: 0;
      overflow: hidden;
      /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
      왜? 닫기 버튼을 누를 때 변화가 티남 */
      transition: all 1s;
    }
    #btn-all-close {
      margin-bottom: 10px;
      background-color: white;
      border: none;
      cursor: pointer;
      padding: 10px 25px;
      float: right;
    }
    #btn-all-close:hover {
        transition: all 0.35s;
    }
    .active {
      display: block;
      /* 높이를 정해줘야지만 transition이 적용됨 */
      height: 600px;
    }
    tbody tr {
        border-bottom-color: lightgray;
        border-bottom-width: 2px;;
    }
    .table {
        text-align: center;
    }
    .i-heart {
        font-size: 25px;
    }
    .i-bell {
        font-size: 25px;
    }
    .main {
        color: #9A30AE;
        font-weight: bold;
    }
    .main2{
        color: #9A30AE;
        font-weight: bold;
    }
    .main3 {
        color: #9A30AE;
    }
        .mypage-top4{
      padding: 20px 0px 15px 0px;
    }
    .inquiryPro-col {
      text-align: center; 
      padding: 20px 0px; 
      border-top: 2px solid black;
      border-bottom: 1px solid black;
    }
    .inquiryPro-row {
      text-align: center; 
      padding: 20px 0px; 
      border-bottom: 1px solid lightgray;
      font-size: small;
    }
    .inquiryPro-Area {
      padding: 20px 26px 0px 100px;
    }
    
    .inquiryPro-col> div {
      font-weight: bold;
      font-size: small;
      letter-spacing: -1px;   
    }
    .answerPro {
      list-style-type: none;
    }
    .answerPro-row {
      padding: 20px 0px;
    }
    .answerPro-Area {  
      padding: 20px 26px 30px 100px;
    }
    
        /* 상품문의 썸네일 */
    .Q_proImg {
      border: 1px solid slateblue;
      width: 60px;
      height: 60px;
      margin-left: 20px;
    }
    
    /* 문의글 메뉴(제목) */
    .Q_titleWrap { 
      width: 640px; 
      text-align: center;
    }
    
    /* 문의글 제목 */
    .Q_titleWrapCon {
      width: 640px; 
      text-align: left; 
      margin-left: 20px;
    }
    
    .pro_name {
      margin-top: 10px;
    }
    /* 작성일 */
    .Q_date {
      width: 220px;
    }
    .Q_writer {
        width: 220px;
    }
    /* 답변상태 */
    .Q_state {
      width: 220px;
    }
    
    .category > span {
      font-size: small;
      color: #666666;
    }

    .category {
      margin-bottom: 20px;
    }
    
    .inquiryPro-Area {
      margin-bottom: 40px;
    }
    .answerPro-Area {
      margin-bottom: 40px;
      background-color: #FEF7FF;
    }
    .iconArea {
      border: 1px solid slateblue;
      width: 24px;
      height: 24px;
    }
    .content {
      margin-left: 10px;
      font-size: small;
      font-weight: lighter;
    }
    
    .item-count-btn button {
	    background-color: white;
	    font-size: 20px;
	    font-weight: 1200px;
	    
	}
	
	.item-count-btn * {
	    height: 30px;
	    line-height: 32px;
	    font-weight: 700;
	}
    
    

</style>  
  
<script>

    
	function checkReviewNotYet(){
    	
    	let localData = {
    			memberNum : '${loginMember.memberNum }',
    			productNum : '${goods.productNum }'
    	};
    	
    	$.ajax({
    		type: "GET",
    		url: "checkReviewNotYet.do",
    		data: {
    			memberNum : '${loginMember.memberNum }',
    			productNum : '${goods.productNum }'
    	},
    		contentType: "application/json",
    		dataType: "json",
    		success: function(data){
    			
    		},
    		error: function() {
    		}
    	});
    }
	
	  //찜하기 (수진)
    // 
   	/* function addPickList (){{
   		alert("찜하기 클릭")
	      	if (${loinMember } == "" ) {
	      		location.href = "../member/login.do";
	      	} else {     		
	      		var addPickInfo {
	      			"memberNum" : ${loinMember.memberNum },
	      			"productNum" : ${goods.productNum}
	      			}
	 	    	let htmlTag = '';
	  	    	$.ajax({
	  	    		url : "../mypage/addPickList.do",
	  	    		type : "post",
	  	    		data : JSON.stringify(addPickInfo),
	  	    		contentType: "application/json",
	  	            dataType: "json",
	  	    		success : function(data){
	  	    			console.log(data)
	  	    			htmlTag += '<span>';
	  	    			if (data == 0) {
	  	    				htmlTag += '<i class="bi bi-heart" style="color:#9A30AE"></i>'  	    				
	  	    			}
	  	    			if (data == 1) {
	  	    				htmlTag += '<i class="bi bi-heart"></i>'
	  	    			}
	  	    			htmlTag += '</span>'
	  	    			
	  	    			$('#pickStatus').html(htmlTag);
	  	    		},
	  	    		error : function () {
	  	    			alert("알수없는 오류로 찜하기 실패")
	  	    		}
	  	    	});//ajax 끝
	      		
	      	}//else끝
	      	
 	 	} */
    
    
    //닫기/자세히보기
    $(function(){
        $(".btn-primary").click(function(){
            if ($(this).html() == '자세히보기') {
                $(this).html('닫기');
            } else {
                $(this).html('자세히보기');
            }
        });
    });
    

    
    //아코디언
    window.onload = function () {
      // panel-faq-container
      const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체

      // panel-faq-answer
      let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

      // btn-all-close
      const btnAllClose = document.querySelector("#btn-all-close");

      // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
      for( let i=0; i < panelFaqContainer.length; i++ ) {
        panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
          // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
          panelFaqAnswer[i].classList.toggle('active');
        });
      };

      /* btnAllClose.addEventListener('click', function() {
        // 버튼 클릭시 처리할 일  
        for(let i=0; i < panelFaqAnswer.length; i++) {
            panelFaqAnswer[i].classList.remove('active');
        };
      }); */
    }
    
    
    function tryInsertReview(checkVal) {
    	
    	$('#myModal').modal('show');
    }
    
    //insertReview
    function insertReview(){
		var frm = document.getElementById('frm2');
	
		frm.action="insertReview.do";
		frm.method="POST";
		
		frm.submit();
	}
    
    //updateReview
     function updateReivew(){
    	var frm = document.getElementById('updateR');
    	console.log(frm);
    	frm.action ="updateReview.do";
    	frm.submit();
    } 
    
    function reviewDoubleCheck(){
    	
    	let result;
    	
    	let localData = {
    			memberNum : '${loginMember.memberNum }',
    			productNum : '${goods.productNum }'
    	};
    	
    	$.ajax({
    		type: "GET",
    		url: "reviewDoubleCheck.do",
    		data: {
    			memberNum : '${loginMember.memberNum }',
    			productNum : '${goods.productNum }'
    	},
    		contentType: "application/json",
    		dataType: "json",
    		success: function(data){
    			
    			result = data.result;
    			tryInsertReview(result);
    		},
    		error: function() {
    		}
    	});
    }
    

	
	//insertQnA
	function insertQuestion(){
		var frm = document.getElementById('frm');
		console.log(frm);
		frm.action = "insertQnA.do";
		frm.submit();
	}
	
	
	  function updateQuestion(){
		var frm = document.getElementById('updateQ');
		console.log(frm);
		frm.action ="updateQnA.do";
		frm.submit();
	}  
	
	
    
    
    function add_shoppingcart(){
    	var goodsNum = Number(${goods.productNum});
    	var goodsCount = Number($("#cart-cnt").html());
    	
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
				if (result == 1) {
					getBtnSignal(${goods.productNum }, 1);
				} else if (result == 2) {
					getBtnSignal(${goods.productNum }, 2);
				} else if (result == 3) {
					getBtnSignal(${goods.productNum }, 3);
				} else if (result == 0) {
					alert("오류");
				}
			},
			error: function(){
			}
		}); 
    }
    
    let total;
    let price;
    let cnt = 1;

    function cartCal(param){
    	
    	
        if ($(param).attr("name") == 'plus') {
            cnt = Number($(param).prev().html()) + 1;
        } else {
            cnt = Number($(param).next().html()) - 1;
        }
        $("#cart-cnt").html(cnt);
        $("#cart-total").html(setCommaRegular(cnt * Number(${goods.saleprice })));
        /* $("#accumulate").html(setCommaRegular(cnt * Math.round(total * ${loginMember.accumulRate } / 100)));  */
        
    	check_under_one()
    }

    
   
        
        // 모달 내부 내용을 input과 form으로 구현한 경우 모달이 닫힐 때 실행될 함수를 적는 부분
        /* $("#cart-modal").on('hidden.bs.modal', function(event){
       		$(this).find("#cart-modal-form")[0].reset();
        });  */
        
    
    function close_modal_reset(){
    	$("#cart-cnt").html(1);
    }
    
   	function check_under_one() {
   		if ($("#cart-cnt").html() == 1) {
	    	$("#cart-modal-minus").css("color", "lightgray");
	    	console.log($("button[name=minus]")[0]);
	    	$("#cart-modal-minus").attr("disabled", "disabled");
	    } else {
	    	$("#cart-modal-minus").css("color", "black");
	    	$("#cart-modal-minus").removeAttr("disabled");
	    }
   		
   		
   		if ($("#cart-cnt").html() == 10) {
	    	$("#cart-modal-plus").css("color", "lightgray");
	    	console.log($("button[name=plus]")[0]);
	    	$("#cart-modal-plus").attr("disabled", "disabled");
	    } else {
	    	$("#cart-modal-plus").css("color", "black");
	    	$("#cart-modal-plus").removeAttr("disabled");
	    }
   	}
   	
   	function setCommaRegular(data){
   		return data.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
   	}
   	
   	$().ready(function(){
   		
   		check_under_one();
   		
   		$("#cart-price").html(setCommaRegular(${goods.saleprice }));
    	$("#cart-total").html(setCommaRegular(cnt * ${goods.saleprice }));
    	
    	
 			/* $("#accumulate").html(setCommaRegular(Math.round(toModal_saleprice * ${loginMember.accumulRate } / 100)));  */
   	});
    
    
    
</script>    
</head>
<body style="width: 1900px; margin: auto;">
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>

<!-- main -->
<div class="container-fluid">
  <div class="row" style="padding-top: 50px; padding-bottom: 50px;">
    <div class="col-2" style="background-color:white;"></div>
	    <!-- 상세 메인 -->  
	    <div class="col-3" style="width: 550px; height: 708px;">
	        <img src="../resources/imgs/goods/${goods.thumSysFilename }" alt="상품사진">  
	    </div>
	    
    	<div class="col-1"></div>
    	
    	<div class="col-4">
	    	<section class="sec">
	        <div id="delivery" class="text-secondary">${goods.deliveryType }</div>
	        <div class="name">
	            <div class="name2">
	                <h1>${goods.productName }</h1>
	            </div>    
	                <h2 class="text-secondary">${goods.pDescription }</h2>    
	        </div>
	            <h2 class="price">
		            <div style="display: flex; flex-direction: column; justify-content: center; float: left; margin-right: 10px;">	
		            	<div>
		            <c:if test="${goods.disRate != 0 }">
		                <span style="color: red; margin-right: 10px;">${goods.disRate }%</span>
		            </c:if>
		                <span class="pr"><fmt:formatNumber value="${goods.saleprice }" pattern="#,###" /></span>
		                <span class="ice">원</span>
		                </div>
		            <c:if test="${goods.disRate != 0 }">
		                <div>
				            <span style="text-decoration:line-through; font-size: 18px;" class="text-secondary"><fmt:formatNumber value="${goods.price }" pattern="#,###" />원</span>
		                </div>
		            </c:if>
		            </div>  
	            </h2> 
	        <div class="bo">
	        	<c:if test="${not empty loginMember.id }">
		            <span id="bo1" class="text-secondary"> ${loginMember.grade }  &nbsp;|&nbsp; </span>
		            <span class="bo2">
		                <strong> ${loginMember.accumulRate }%</strong> 적립
		            </span>	
	        	</c:if>
	        	<c:if test="${empty loginMember.id }">
	        		<span id="bo1" class="text-secondary">로그인 후, 적립 혜택이 제공됩니다.</span>
	        	</c:if>
	        </div>
	    <div class="con">
	            <dl class="deli">
	                <dt class="text-dark">배송</dt>
	                <dd>
	                    <p class="p1">${goods.deliveryType }</p>
	                    <p class="p2">${goods.pDescription }</p>
	                </dd>
	            </dl>
	            <dl class="seller">
	                <dt id="dt1" class="text-dark">판매자</dt>
	                <dd class="dd1">${goods.seller }</dd>
	            </dl>
	            <dl class="package">
	                <dt id="dt2" class="text-dark">포장타입</dt>
	                <dd class="dd2">
	                    <p class="p3">${goods.condition }</p>
	                </dd>
	            </dl>
	    </div>
	    
	            <form action="cart.do" method="POST" enctype="multipart/form-data">
	        <div class="sel">
	            <dl class="dl">
	                <dt id="dt3" class="text-dark">상품선택</dt>
	                <div class="container">
	                    <span class="border">${goods.productName }</span>
	                    <div class="btn1">
	                    <div class="item-count-btn" style="display: flex; width: 110px; height: 35px; border: solid 1px lightgray; border-radius: 5px; justify-content:space-between;">
                            <button type="button" id="cart-modal-minus" style="height: 30px; border: 0; line-height: 28px;" name="minus" onclick="cartCal(this)">-</button>
                            <div id="cart-cnt">1</div>
                            <button type="button" id="cart-modal-plus" style="height: 30px; border: 0; line-height: 28px;" name="plus" onclick="cartCal(this)">+</button>
                        </div>
	                    <div>
	                    	<c:if test="${goods.disRate ne 0}">
	                        <span style="text-decoration:line-through; font-size:14px;"><fmt:formatNumber value="${goods.price }" pattern="#,###" />원</span>
	                        </c:if>
	                        <span id="cart-price" class="price2" style="font-size:14px;"><fmt:formatNumber value="${goods.saleprice }" pattern="#,###" />원</span>
	                    </div>
	                    </div>    
	                </div>    
	            </dl>    
	        </div>    
	         <!-- 상세 메인 상품 선택 (장바구니넣기) -->
	        <div class="box1">
	            <div class="box2">
	                <div class="box3">
	                    <span class="sp1">총 상품금액 : </span>
	                    <span class="sp2" id="cart-total"></span>
	                    <span class="sp3">원</span>
	                </div>
	                <c:if test="${not empty loginMember.id }">
	                <div class="box4">
	                    <span class="sp4">적립</span>
	                    <span id="sp5" class="text-dark">구매 시
	                        <strong class="str">${loginMember.accumulRate }% 적립</strong>
	                    </span>
	                </div>
	                </c:if>
	                <c:if test="${empty loginMember.id }">
	                	<span id="bo1" class="text-secondary" style="margin-left: 335px;">로그인 후, 적립 혜택이 제공됩니다.</span>
	                </c:if>
	            </div>
	        </div>
	        
	        <!-- 찜하기 수진 수정  -->	        
	        <div class="box5">
	            <button class="bu1" id="btn-heart" type="button" onclick="addPickList()">
	                <div class="i-heart">
	                    <i id="heart " class="bi bi-heart"></i>
	                </div>
	            </button>
	            <div class="btn">
	                <button class="btn btn-primary3 active" type="button" onclick="add_shoppingcart()" style="width: 450px; height: 55px; margin-left: 20px; 
	                color: white; background-color: #692498; border: #692498; text-align: center">장바구니 담기</button>
	            </div>
	       		</form> 
	        </div>
	    </section>
    	</div>
    
    <div class="col-2" style="background-color:white;"></div>
  </div>
    
  <div class="row">
    <div class="col-2" style="background-color:white;"></div>
    <div class="col-8">
    <br><br><br>
        <!-- 상품 설명 -->
        <nav class="menu">
            <ul style="margin-right: 20px; background-color: #DCDCDC;  text-align: center;">
                <li>
                    <a class="link" href="#pro-de" style="color: black; font-weight: bold; margin-left: 250px;">상품 설명 </a>
                </li>
                <li style="margin-right: 20px; margin-left: 30px;">
                    <a class="link" href="#pro-re" style="color: black; font-weight: bold; ">후기</a>
                </li>
                <li>
                    <a class="link" href="#pro-q" style="color: black; font-weight: bold;">문의</a>
                </li>
            </ul>  
        </nav>    

        <!-- 상품 설명 (교환 / 배송 / 취소) -->
        <div>
            <a id="pro-de"></a>
            <div style="text-align: center;" class="de_img">
                
                <img src="../resources/imgs/goods/${goods.detaileSysFilename }" alt="상세이미지">
                    
            </div>
            <hr>
            <div class="container">
                
                <div class="border" style="width: 1080px; height: 55px;">
                  <strong style="color: #692498; float: left; margin-right: 30px;">교환 및 환불 안내</strong>
                  <p style="float: left;">교환 및 환불이 필요하신 경우 고객행복센터로 문의해주세요.</p>
                   
	                <div class="close-btn">
		                <button type="button" class="btn btn-primary" data-toggle="collapse" 
		                data-target="#demo" style="background-color: transparent; border: none; color: #9A30AE; 
		                float: right;" onclick="changeName()" id="close">닫기</button>
	                </div>
                </div>     
                <br>
               
              <div id="demo" class="collapse show">
                <div>
                        <strong style="font-size: 16px;">01. 상품에 문제가 있는 경우</strong>
                        <div style="font-size: 14px; color: dimgray;">
                            <p> - 받으신 상품이 표시&#183;광고 또는 계약 내용과 다른 경우에는 상품을 받은 날부터 3개월 이내, <br>
                            	그 사실을 알게 된 날부터 30일 이내에 교환 및 환불을 요청하실 수 있습니다.</p>
                            <span> &#8251; 배송 상품에 문제가 있는 것으로 확인되면 배송비는 콜라비가 부담합니다.</span>
                        </div>    
                    </div>
                  <br>
                        <div>
                            <strong style="font-size: 16px;">02. 단순변심, 주문 착오</strong>
                            <div style="font-size: 14px; color: dimgray;">
                                <strong> - 신선/냉장 / 냉동 식품</strong>
                                <p>재판매가 불가한 상품의 특성상, 단순 변심, 주문 착오 시 교환 및 반품이 어려운 점 양해 부탁드립니다.<br>
                                	상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느끼실 수 있습니다.</p>
                                <strong> - 유통기한 30일 이상 식품(신선 / 냉장 / 냉동 제외) &amp; 기타상품</strong>
                                <p>상품을 받은 날부터 7일 이내에 고객행복센터로 문의해주세요.</p>
                                <span> &#8251; 단순 변심으로 인한 배송 상품 교환 또는 환불의 경우 고객님께서 배송시 6,000원을 부담하셔야 합니다. <br> (주문건 배송비를 결제하셨을 경우 3,000원)
                                </span> 
                                </div><br>    
                        </div>
                  <br>
                        <div>
                            <strong style="font-size: 16px;">03. 교환/반품 불가</strong>
                            <p style="font-size: 14px; color: dimgray;"> - 다음에 해당하는 교환&#183;환불 신청은 처리가 어려울 수 있으니 양해 부탁드립니다.</p>
                                <div style="font-size: 14px; color: dimgray;">
                                <ul>
                                    <li>고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우<br>(단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)</li>
                                    <li>고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우</li>
                                    <li>시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우</li>
                                    <li>복제가 가능한 상품의 포장이 훼손된 경우</li>
                                    <li>고객님의 주문에 따라 개별적으로 생산되는 상품의 제작이 이미 진행된 경우</li>
                                </ul>
                                </div>    
                        </div>
              </div>
            </div>
            <hr>

            <div class="container">
                <div class="border" style="width: 1080px; height: 75px;">
              <strong style="color: #692498; float: left; margin-right: 30px;">주문취소안내</strong>
              <p style="float: left;">
                <strong>- [주문완료] 상태일 경우에만 주문 취소 가능합니다. <br>
                        - [마이컬리 > 주문내역 상세페이지] 에서 직접 취소하실 수 있습니다.
                </strong>
              </p>
                
                <div class="close-btn">
              <button type="button" class="btn btn-primary" id="close" data-toggle="collapse" 
              data-target="#demo2" style="background-color: transparent; border: none; color: #9A30AE; 
              float: right;" onclick="changeName()"> 닫기  
              </button>
                </div> 
                </div>
              <div id="demo2" class="collapse show" style="margin-left: 20px;">
                <div>
                      <strong style="line-height: 25px; font-size: 16px;">주문취소관련</strong>
                            <p style="padding: 2px 20px 0px 0px; line-height: 22px; font-size: 14px; color: dimgray;">
                                - [배송준비중] 부터는 취소가 불가하니, 반품으로 진행해주세요. (상품에 따라 반품이 불가할 수 있습니다.) <br>
                                - 주문마감 시간에 임박할수록 취소 가능 시간이 짧아질 수 있습니다. <br>
                                - 비회원은 app 또는 모바일 웹사이트에서 [마이컬리 > 비회원 주문조회 페이지] 에서 취소가 가능합니다. <br>
                                - 일부 예약상품은 배송 3~4일 전에만 취소 가능합니다. <br> 
                                - 주문상품의 부분취소는 불가능합니다. 전체 주문 취소 후 다시 구매해 주세요. 
                            </p>
                        </div>
                  <br>
                        <div>
                            <strong style="font-size: 16px;">결제 승인 취소 / 환불 관련</strong>
                            <p style="font-size: 14px; color: dimgray;">
                                - 카드 환불은 카드사 정책에 따르며, 자세한 사항은 카드사에 문의해주세요. <br>
                                - 결제 취소시, 사용하신 적립금과 쿠폰도 모두 복원됩니다.
                            </p>
                        </div>
              </div>
            </div>
            <hr>

            <div class="container">
                <div class="border" style="width: 1080px; height: 55px;">
                  <strong style="color: #692498; float: left; margin-right: 30px;">배송관련 안내</strong>
                  <p style="float: left;">배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.</p>
                </div>
            </div>    
        </div>
    
    <!-- 상품 리뷰 -->
        <br><br><br><br><br>
    <div class="review">
        <a id="pro-re"></a>
        <c:if test="${orderReviewList ne null && not empty orderReviewList}">
	        <div>
	            <button type="button" class="btn btn-primary2" onclick="reviewDoubleCheck();" 
	            style="float: right; margin-right: 70px; background-color: #692498; border: 1px solid #692498; 
	            color: white; font-weight: 700; width: 130px; height: 40px; border-radius: 0;">
	            <span>리뷰작성</span></button>
	            
	        </div>
        </c:if>
        <c:if test="${empty order.orderNum }"></c:if>
        <section class="sec2">
            <header style="margin-bottom: 10px;">
                <strong style="font-size: 20px;">상품후기</strong>
            </header>
                <strong style="margin-top: 20px; color: dimgray;">사진후기 100원, 글후기 50원 적립금 혜택이 있어요.</strong>
            <ul class="text-secondary" style="margin-top: 5px;">
                <li>콜라비는 2배 적립 (사진 200원, 글 100원)</li>
                <li>후기 작성은 배송완료일로부터 30일 이내 가능합니다.</li>
                <li>작성하신 후기는 바로 적립금이 지급됩니다.</li>
            </ul>
            <div class="container" style="width: 100%; margin-left: -20px;">

                <tr>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">
                        <span class="notice">공지</span> &nbsp;&nbsp;&nbsp;
                        	상품 후기 적립금 정책 안내 
                        </p>
                      <div class="panel-faq-answer" style="background-color: #e9e9e9;">
                        <p>[ 상품 후기 적립금 정책 변경 안내 ] <br><br>

							고객님 안녕하세요. 콜라비 입니다. <br>
							적립금 지급 정책을 안내드리니 콜라비 이용에 참고 부탁드립니다. <br><br>
							
							■ 적립금 지급 정책 ■ <br><br>
							
							1. 일반 후기 <br>
							-글 후기 50원/건 <br>
							-사진 후기 100원/건 <br>
							*콜라비 고객님께는 더블 후기 적립금이 지급됩니다. <br>
							*지급에 영업일 기준 1~2일 소요됩니다. <br>
							→ 금~일 작성 시, 월요일 지급 <br><br>
							
							2. 후기 적립금 지급 유의 사항 <br>
							콜라비는 믿을 수 있는 후기문화를 함께 만들어가고자 합니다. 따라서 후기 내용이 아래에 해당하는 경우에는 검토 후 삭제 및 적립금 회수 조치될 수 있습니다. <br><br>
							
							1. 욕설, 폭력성, 음란성, 상업성 등 업체나 타인에게 불쾌한 내용을 작성한 경우 <br>
							2. 구매한 상품과 무관한 내용이나 동일 문자/단순 초성의 반복 등 부적합한 내용을 작성한 경우 <br>
							3. 상품의 기능이나 효과 등에 오해의 소지가 있는 내용을 작성한 경우 <br>
							4. 저작권, 초상권 등 타인의 권리를 침해하는 이미지, 동영상을 사용한 경우 <br>
							5. 구매한 상품이 아닌 캡쳐 사진, 포장 박스 사진 등 상품과 관련 없는 이미지, 동영상을 사용한 경우 <br><br>
							
							또한, 비정상적인 방법을 통해 후기를 작성하고 적립금을 취득한 경우 작성자에 법적 책임의 소지가 있음을 알려드립니다. <br></p>
                      </div>
                    </div>
                  </td>
                </tr>
            </div><br>
             
             <div class="reviewLoad">  
              <c:if test="${not empty rlist }">  
              <c:forEach var="goodsReview" items="${rlist }">
            <div class="div_re">
                <div>
                    <div>
                        <span class="grade">${goodsReview.grade }</span>
                        <span>${goodsReview.name }</span>
                    </div>
                </div>
                <article>
                    <div class="review2">
                        <div>
                            <h3 style="font-size: 1em; color: darkgray">${goods.productName }</h3>
                        </div>
                        <p style="margin-top: 15px;">
			              ${goodsReview.rContent }
                        </p>
                        <div>
                        <c:if test="${goodsReview.rSysFilename != null}">
                           	<img src="../resources/imgs/review/${goodsReview.rSysFilename }" style="width: 250px; height: 250px;">
                           	
                        </c:if>
                        <c:if test="${goodsReview.rSysFilename == null}"></c:if>
                        </div>
                        <footer style="margin-top: 15px;">
                            <div>
                                <span>${goodsReview.rDate }</span>
                        <c:if test="${goodsReview.memberNum == loginMember.memberNum }">
                                <div style="float: right;">
                                <div style="margin-right: 30px; font-size: 14px;">
                                    <a href="deleteReview.do?reviewNum=${goodsReview.reviewNum }&productNum=${goods.productNum }" 
                                    style="text-decoration: none; color: black; font-size: 1em; margin-left: 5px;">삭제</a>
                                </div>
                            </div>
						</c:if>
                            </div>
                        </footer>
                    </div>
                </article>
            </div>
            </c:forEach>
            
            <div class="find-btn" style="margin-left:100px; margin-right: 150px;">
                <button class="find-btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                </button>
                <button class="find-btn1">
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>
            </c:if>
            
            <!-- 상품 후기 없을 때 -->
            <c:if test="${empty rlist }">
            	<div class="div_re" style="text-align: center; vertical-align: middle; font-size: 25px;">
            		<p><i class="bi bi-exclamation-circle"></i></p>
            		<p style="text-align: center; vertical-align: middle; font-size: 15px;">등록된 후기가 없습니다</p>
            	</div>
            </c:if>
           </div> 
           
            
            
        </section>  
    </div>
      <br><br><br>
      
      <!-- 상품 문의 -->    
    <div class="qna" style="margin-bottom: 20px;">
        <a id="pro-q"></a>
        <div>
            <div>
            	<c:if test="${not empty loginMember.id }">
                <button type="button" class="btn btn-primary2" data-toggle="modal" data-target="#myModal2" 
                id="promptStart" style="float: right; margin-right: 70px; background-color: #692498; 
                border: 1px solid #692498; color: white; font-weight: 700; width: 130px; height: 40px; border-radius: 0;">
                <span>문의하기</span>
                </button>
            	</c:if> 
            </div>
            <div>
                <strong style="font-size: 20px;">상품 문의</strong>
                <ul class="text-secondary" style="margin-top: 10px;">
                    <li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                    <li>배송관련, 주문(취소/교환/환불) 관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</li>
                </ul>
            </div>
            
            <div class="mypage-top4" style="margin-right: 70px; margin-left: -20px;">
 
              <section>
                <div class="d-flex inquiryPro-col">
                  <div class="Q_titleWrap">제목</div>
                  <div class="Q_date">작성일</div>
                  <div class="Q_state">답변상태</div>
                </div>
                
                <ul style="padding: 0px; ">
                

                 <!-- 상품 문의 있을 때 -->
                 <div class="qnaLoad">
                 <c:if test="${not empty qlist }">
                  <!-- 데이터 있는 만큼 반복 -->    
                  <c:forEach var="goodsQnA" items="${qlist }">
                  <section class="inquiryRow">  
                    <button type="button" class="btn" data-toggle="collapse" data-target="#demo${goodsQnA.proQnaNum }" style="width: 1100px;">
                      <li class="d-flex inquiryPro-row" onclick="showAnswer()">
                        
                        <div class="Q_titleWrapCon" style="width: 600px;">
                          <div class="pro_name">${goods.productName } </div><br>
                          <div class="Q_title" style="font-weight: bold;">${goodsQnA.qTitle }</div>
                        </div>
                        <div class="Q_date minusPoint" style="padding-top: 20px; width: 200px; margin-left: 20px; margin-right: 10px;">${goodsQnA.qDate }</div>
                        <!-- 답변여부에 따라 변경-->
                        <div class="Q_state plusPoint" style="padding-top: 20px; width: 220px; margin-left: 0px; text-align: center;">
                        	<c:if test="${goodsQnA.aAnswer != null }"><p style="font-weight: bolder; color: purple;">답변완료</p></c:if>
                        	
                        	<c:if test="${goodsQnA.aAnswer == null }">답변대기</c:if>
                        </div>
                      </li>
                    </button>

                    <li class="answerPro">
                      <div class="collapse answerPro-row" id="demo${goodsQnA.proQnaNum }">
					<c:if test="${goodsQnA.aAnswer == null }">
                        <div class="inquiryPro-Area d-flex">
                          <div>
                            <span class="icon"><img src="../resources/imgs/goods/icons8-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8-q-48.png" style="width: 25px;"></span>
                          </div>
                          <div class="content">
                          	<c:out value="${fn:replace(goodsQnA.qContent, newline, '<br>')}" escapeXml="false"/>
                          </div>
                          <c:if test="${goodsQnA.memberNum == loginMember.memberNum }">
                            <div style="margin-left: 50px; text-align: right;">
                        <span style="text-align: right; margin-right: 30px; font-size: 14px;">
                            <a class="q-delete" style="text-align: right; border: none; background-color: transparent; text-decoration: none; color: black; font-size: 1em; margin-left: 5px;" 
                            href="deleteQnA.do?proQnaNum=${goodsQnA.proQnaNum }&productNum=${goods.productNum }">삭제</a>
                        </span>
                        	</div>
                        </c:if>
                        
                        <c:if test="${goodsQnA.memberNum != loginMember.memberNum }"></c:if>
                        
                        </div>

                        <div class="answerPro-Area d-flex hide">
                            <div>
                              <span class="icon"><img src="../resources/imgs/goods/icons8-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8-a-48.png" style="width: 25px; float: left; margin-right: 5px;"></span>
                            </div>
                            <div class="content">
                            	<p>등록된 답변이 없습니다.</p>
                            </div>
                        </div>

                    </c:if>
                    <c:if test="${goodsQnA.aAnswer != null }">
                    	<div class="inquiryPro-Area d-flex">
                          <div>
                            <span class="icon"><img src="../resources/imgs/goods/icons8-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8-q-48.png" style="width: 25px;"></span>
                          </div>
                          <div class="content">
                          	<c:out value="${fn:replace(goodsQnA.qContent, newline, '<br>')}" escapeXml="false"/>
                          </div>
                          <c:if test="${goodsQnA.memberNum != loginMember.memberNum }"></c:if>
                            <c:if test="${goodsQnA.memberNum == loginMember.memberNum }">
                            <div style="margin-left: 50px; text-align: right;">
                        <span style="text-align: right; margin-right: 30px; font-size: 14px;">
                            <a class="q-delete" style="border: none; background-color: transparent; text-decoration: none; color: black; font-size: 1em; margin-left: 5px;" 
                            href="deleteQnA.do?proQnaNum=${goodsQnA.proQnaNum }&productNum=${goods.productNum }">삭제</a>
                        </span>
                        	</div>
                        	</c:if>
                        </div>
                    	<div class="answerPro-Area d-flex hide">
                            <div>
                              <span class="icon"><img src="../resources/imgs/goods/icons8-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8-a-48.png" style="width: 25px; float: left; margin-right: 5px;"></span>
                            </div>
                            <div class="content">
                            <p><c:out value="${fn:replace(goodsQnA.aAnswer, newline, '<br>')}" escapeXml="false"/></p>
                            </div>
                        </div>
                  		</c:if>
                      </div>
                    </li>
                  </section>
               </c:forEach> 
                  
            <div class="find-btn" style="margin-right: -50px;">
                <button class="find-btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                </button>
                <button class="find-btn2">
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>
              </c:if>
            
            <!-- 상품 문의 없을 때 -->
            <c:if test="${empty qlist }">
            	     <p style="margin-top:50px; text-align: center; vertical-align: middle; font-size: 15px;">작성된 문의가 없습니다</p>
            </c:if> 
            </div>
          </ul>  
        </div>        
    </div>
    </div>
    
    
    <div class="col-sm-2" style="background-color:white;"></div>

</div>  
</div>

	<footer>
		<%@ include file= "../common/footer.jspf"%>
	</footer>

</body>

</html>