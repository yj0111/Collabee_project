<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title>콜라비</title>
  <%@ include file="../common/bootstrap.jspf" %>  
  <style>
    .list-group-item a {
      text-decoration: none;
      color: black;
    }

    .list-group-item:hover {
      background-color: #FEF7FF;
    }

    .list-group-item:hover>a {
      font-weight: bold;
      text-decoration: none;
      color: #B03FE3;
    }

    .list-group-item:hover>span {
      font-weight: bold;
      text-decoration: none;
      color: #B03FE3;
    }

    .list-group-item a {
      width: 100%;
      display: block;
    }

    li span {
      font-size: large;
      font-weight: bold;
      color: black;
    }

    h2 {
      font-weight: bold;
    }

    h4 {
      font-weight: bolder;
    }

    h4 span {
      vertical-align: middle;
      font-size: small;
      color: #rgb(152,152,152);
    }

    .main {
      padding-bottom: 24px;
      padding-top: 10px;
    }

    .faq {
      display: flex;
      width: 100%;
      border-bottom: 1px solid rgb(51, 51, 51);
      text-align: center;
      height: 61px;
    }

    .faq_top {
      padding: 10px;
      font-size: 11pt;
      vertical-align: middle;
      font-weight: bolder;
    }

    .card {
      border: white;
    }

    .card-header {
      background-color: white;
      height: 55px;
      padding-top: 13px;
    }

    .card-header a {
      color: black;
      text-decoration: none;
      vertical-align: middle;
    }

    .card-header span {
      text-align: center;
      font-size: 10.5pt;
    }

    .card-header:hover {
      color: black;
      text-decoration: none;
      background-color: white;
    }

    .card-body {
      border-top-color: white;
    }

    .card_answer {
      padding: 30px 30px 30px 70px;
      font-size: 14px;
    }

    .btn_list {
      padding-top: 45px;
    }

    .btn1 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn1:hover {
      border: solid 1px darkgray;
    }

    .btn2 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn2:hover {
      border: solid 1px darkgray;
    }

    .btns {
      text-align: center;
    }

    .faq_btn {
      padding: 0px 10px;
      text-align: center;
      overflow: hidden;
      width: 120px;
      height: 44px;
      border-radius: 3px;
      color: rgb(255, 255, 255);
      background-color: #9A30AE;
      border: 0px none;
      font-size: small;
      float: right;
    }
  </style>
<script>
    function faq_delete(faqNum) {
      if (confirm("정말 삭제하시겠습니까??") == true) { 
		location.href="deletefaq.do?faqNum="+faqNum
      } else { 
        return false;
      }
    }
    
    $().ready(function(){
    	getFaqList();
    });

	function getFaqList() {
		var dataSend = {
				faqType : $("select[name=location]").val()
			};
	$.ajax("getFaqList.do", {
		type: "POST",
		data: JSON.stringify(dataSend),
		dataType: "json",
		contentType : "application/json",
		success: function(data){
/* 			alert("카테고리 머냐면 : "+ $("select[name=location]").val());
			alert("성공~~"); */
			console.log(data);
			
			let dispHtml = "";
			for (let FaqVO of data) {
				  dispHtml +="<div class='card-header'>";
				  dispHtml +="<a class='card-link' data-toggle='collapse' href='#collapseOne"+FaqVO.faqNum+"'>";
				  dispHtml +="<span style='width: 75px; display: inline-block;'>"+FaqVO.faqNum +"</span>";
				  dispHtml +="<span style='width: 150px; display: inline-block;' class='"+FaqVO.faqType +"'>"+FaqVO.faqType +"</span>";
				  dispHtml +="<span style='width: 630px; display: inline-block;'>"+FaqVO.faqTitle +"</span></a>"; 
				  dispHtml +="</div>";
				  dispHtml += "<div id='collapseOne"+FaqVO.faqNum+"' class='collapse' data-parent='#accordion'>";
				  dispHtml += "<div class='card-body'>";
				  dispHtml += "<div class='card_answer'>";
				  dispHtml += FaqVO.faqContent
				  dispHtml += "</div>";
				  dispHtml += "</div></div>";
			} 
			
			$("#type_faq").html(dispHtml);
		},
		error: function(){
			alert("실패!~~");
		}
	}); 
}


</script>
	

</head>

<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
  <div class="container-fluid">
    <!-- header -->   
    <header>
      <%@ include file = "../common/header.jspf" %>
    </header>
    
    <!--유정-->
    <div class="row" style="padding-top:50px; padding-bottom: 50px">
      <div class="col-sm-2"></div>
      <div class="col-sm-2">
       <!-- 회원일때  --> 
		<c:if test="${loginMember.id ne 'admin'}"> 
		<%@ include file = "../admin/userSideNav.jspf" %>
        </c:if>
      </div>
      <div class="col-sm-6">
        <div class="main" style="border-bottom:2px solid black">
          <h4>자주하는 질문<span> 고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
             <div id="option" class="dropdown" style="width: 180px; border-radius: 0; float: right; padding-bottom: 0.5cm;" >
              <select name="location" class="form-control">
                <option value="전체" selected="selected">전체</option>
                <option value="회원">회원</option>
                <option value="상품" >상품</option>
                <option value="주문/결제">주문/결제</option>
                <option value="배송" >배송</option>
                <option value="쿠폰/적립금">쿠폰/적립금</option>
              </select>
            </div> 
          </h4>
        </div>
          <div class="faq">
            <div class="faq_top" style="padding-top: 19px; width: 100%;">
              <div style="width: 75px; display: inline-block;">번호</div>
              <div style="width: 150px; display: inline-block;">카테고리</div>
              <div style="width: 650px; display: inline-block;">제목</div>
            </div>
          </div>
          <div class="faq_a">
		      <div id="accordion">
              <div class="card" id="type_faq">
               </div>
          </div>
         </div>

          <div class="btn_list">
            <div class="btns">
              <button class="btn1" disabled>
                <i class="bi bi-chevron-left"></i>
              </button>
              <button class="btn2">
                <i class="bi bi-chevron-right"></i>
              </button>
            </div>
          </div>
        </div>
        <div class="col-sm-2"></div>
      </div>
    </div>
<!-- footer-->
     <footer>
       <%@ include file = "../common/footer.jspf" %>	
     </footer>           
</body>
<script>
		$("select[name=location]").change(function(){
			  console.log($(this).val()); //value값 가져오기
			  getFaqList();
			  //console.log($("select[name=location] option:selected").text()); //text값 가져오기
			});
</script>	
</html>