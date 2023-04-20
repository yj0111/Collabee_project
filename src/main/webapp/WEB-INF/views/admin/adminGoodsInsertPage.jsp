<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>콜라비</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <%@ include file = "../common/bootstrap.jspf" %>
    
    <style>

      .list-group-item a{
        text-decoration: none;
        color:black;
      }
      .list-group-item:hover {
        background-color: #FEF7FF;
      }     
      .list-group-item:hover > a {
        font-weight: bold;
        text-decoration: none;
        color:#B03FE3;
      }
      .list-group-item:hover > span {
        font-weight: bold;
        text-decoration: none;
        color:#B03FE3;
      }
      .list-group-item a {
        width: 100%;
        display: block;
      }
      li span{font-size: large;
        font-weight: bold;
        color: black;
      }
      h2{
     	 font-weight: bold;
      }
      h4{
      	font-weight: bolder;
      } 
      h4 span{
        vertical-align: middle;
        font-size: small;
         color: gray;
      }
      .main{
        padding-bottom: 24px;
        padding-top: 10px ;
      }
      .btn {
            background-color: #9A30AE;
            color: none;
      }
      
       .goods_btn {
	      padding: 0px 10px;
	      text-align: center;
	      overflow: hidden;
	      width: 120px;
	      height: 44px;
	      border-radius: 3px;
	      color: rgb(255, 255, 255);
	      background-color: #9a30ae;
	      border: 0px none;
	      font-size: small;
	      float: right;
	    }
	    
      button {
          border: none;
          box-shadow:none !important;
      }
      .inquiry_btn{
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
      button:hover {
        background-color: none;
      }
      
      /* 카테고리 부분*/
      #main-category-box, #sub-category-box {
        padding: 0px;
      }
      
      #main-category-box .category-container, #sub-category-box .category-container {
        border: solid 1px lightgray;
        padding-top: 18px;
      }

      #main-category-box button, #sub-category-box button {
        border: 0;
        margin-top: 5px;
        color: white;
      }
      #main-category-box ul, #sub-category-box ul {
        display: flex;
        flex-wrap: wrap;
      }

      #main-category-box ul .form-check, #sub-category-box ul .form-check {
        width: 250px;
        height: 30px;
      }

      /**/
      .category-box ul{
        list-style: none;
        padding: 0px;
      }

      .category-box input {
        display: none;
      }
      
      .category-box button {
        border: 0;
        background-color: var(--main-color);
        color: white;
      }
      
      .category-box .dropdown-menu {
        width: 100%;
        height: 200px;
      }

      .category-box .category-inner-box{
        border-right: solid 1px var(--border-faint-color);
        height: 190px;
      }
      
      .category-box .dropdown-menu .form-check {
        padding: 0px;
      }

      .category-box .dropdown-menu li {
        width: 200px;
        height: 30px;
        padding-left: 20px;
      }

      .overview {
        overflow: auto;
      }
</style>  

<script>
	function setThumbnail(event) {
      var fileUpload = event.target.parentNode; //이벤트 대상자의 부모
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        fileUpload.appendChild(img);
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", 110);
        img.setAttribute("height", 160);
        img.setAttribute("class", "pre_img");
        document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);

	    //미리 만들어 놓은 div에 text(파일 이름) 추가
	    var name = document.getElementById('fileName');
	    name.textContent = file.name;
	}

	function setDetail(event) {
      var fileUpload = event.target.parentNode; //이벤트 대상자의 부모
      var reader = new FileReader();
      reader.onload = function(event) {
        var img = document.createElement("img");
        fileUpload.appendChild(img);
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", 200);
        img.setAttribute("height", 150);
        img.setAttribute("class", "pre_img");
        document.querySelector("div#image_container2").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);

	    //미리 만들어 놓은 div에 text(파일 이름) 추가
	    var name = document.getElementById('fileName');
	    name.textContent = file.name;
	}

	//대분류 카테고리 변경에 따른 소분류 카테고리 변경
	function categoryChange(form) {
  		
	  var sub1 = new Array();
	  var subNum1 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 1}">
	  			sub1.push("${divisionVO.division }");
	  			subNum1.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub2 = new Array();
	  var subNum2 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 2}">
	  			sub2.push("${divisionVO.division }");
	  			subNum2.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub3 = new Array();
	  var subNum3 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 3}">
	  			sub3.push("${divisionVO.division }");
	  			subNum3.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub4 = new Array();
	  var subNum4 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 4}">
	  			sub4.push("${divisionVO.division }");
	  			subNum4.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub5 = new Array();
	  var subNum5 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 5}">
	  			sub5.push("${divisionVO.division }");
	  			subNum5.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub6 = new Array();
	  var subNum6 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 6}">
	  			sub6.push("${divisionVO.division }");
	  			subNum6.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub7 = new Array();
	  var subNum7 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 7}">
	  			sub7.push("${divisionVO.division }");
	  			subNum7.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub8 = new Array();
	  var subNum8 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 8}">
	  			sub8.push("${divisionVO.division }");
	  			subNum8.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub9 = new Array();
	  var subNum9 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 9}">
	  			sub9.push("${divisionVO.division }");
	  			subNum9.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub10 = new Array();
	  var subNum10 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 10}">
	  			sub10.push("${divisionVO.division }");
	  			subNum10.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	  var sub11 = new Array();
	  var subNum11 = new Array();
	  	<c:forEach var="divisionVO" items="${divisionList }">
	  		<c:if test="${divisionVO.categoryNum == 11}">
	  			sub11.push("${divisionVO.division }");
	  			subNum11.push("${divisionVO.divisionNum }");
	  		</c:if>
	  	</c:forEach>
	 
	  var target = document.getElementById("division");
	  
	  var sub;
	  var subNum;
	  
	  if(form.value == "1") {sub = sub1; subNum = subNum1}
	  else if(form.value == "2") {sub = sub2; subNum = subNum2}
	  else if(form.value == "3") {sub = sub3; subNum = subNum3}
	  else if(form.value == "4") {sub = sub4; subNum = subNum4}
	  else if(form.value == "5") {sub = sub5; subNum = subNum5}
	  else if(form.value == "6") {sub = sub6; subNum = subNum6}
	  else if(form.value == "7") {sub = sub7; subNum = subNum7}
	  else if(form.value == "8") {sub = sub8; subNum = subNum8}
	  else if(form.value == "9") {sub = sub9; subNum = subNum9}
	  else if(form.value == "10") {sub = sub10; subNum = subNum10}
	  else if(form.value == "11") {sub = sub11; subNum = subNum11}
		
	  target.options.length = 0;
	  
	  for (let i = 0; i < sub.length; i++) {
		  var opt = document.createElement("option");
		  opt.value = subNum[i];
		  opt.innerHTML = sub[i];
		  target.appendChild(opt);
	  }  
  }
  
	//상품 등록 시에 입력창 빈값으로 등록 시도 시 alert창 띄우기
	function sendData(form) {
		let firstForm = document.forms[0];
		
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "을(를) 입력하세요");
				console.log("firstForm.elements[i] : " + firstForm.elements[i]);
				firstForm.elements[i].value = "";
				firstForm.elements[i].focus();
				return;
			}
		}
		alert("상품 등록이 완료되었습니다.");
		
		console.log(form);
		form.action = "adminGoodsInsert.do";
		form.submit(); 
	}
  
 
	
</script>
  </head>

  <body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
  
  	<!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>	
    <form id="form" name="form" method="post" enctype="multipart/form-data">
    <div class="container-fluid">
      <div class="row" style="padding-top:50px; padding-bottom: 50px">
        <div class="col-sm-2"></div>
        <div class="col-sm-2"> 
            <%@ include file = "../admin/adminSideNav.jspf" %>
        </div>
        
        <div class="col-sm-6">
          <div style="width: 800px;">
            <div class="main" style="border-bottom:2px solid black";>
                <h4>상품등록</h4>
            </div>
            <br>

                  상품명 <input type="text" class="form-control form-control" name="productName" id="productName" title="상품명" placeholder="상품명을 입력하세요." autofocus/>
                  <br>
                  상품상세설명 <input type="text" class="form-control form-control" name="pDescription" id="pDescription" title="상품설명" placeholder="상품 상세정보를 입력하세요."/>
                  <br>
                  상품금액 <input type="number" class="form-control form-control" name="price" id="price" title="상품금액" placeholder="상품금액을 입력하세요."/>
                  <br>
                  할인율 <input type="number" class="form-control form-control" name="disRate" id="disRate" title="할인율" placeholder="할인율을 입력하세요."/>
                  <br>
                  판매금액 <input type="number" class="form-control form-control" name="saleprice" id="saleprice" title="판매금액" placeholder="판매금액을 입력하세요"/>
                  <br>
                  할인기간 <input type="date" class="form-control form-control" name="disDate" title="할인기간" id="disDate"/>
                  <br>
                  입고수량 <input type="number" class="form-control form-control" name="stock" id="stock" title="입고수량" placeholder="입고하실 수량을 입력하세요."/>

                  <br>    
				 
				<table class="table">
					<tr>
						<!-- <th style="width: 20%; vertical-align: middle; border-color: white;">카테고리</th> -->
						카테고리
						<th style="vertical-align: left; width: 50%; border-color: white;">		   
						<select name="categoryNum" class="form-control col-sm-8" id="category" title="대분류 카테고리" onchange="categoryChange(this)">
							<option value="" selected>-- 대분류 --</option>
							<c:forEach var="categoryVO" items="${categories }">
								<option value="${categoryVO.categoryNum }">${categoryVO.category }</option>
							</c:forEach>
							<option value="1">채소</option>
							<option value="2">과일·견과·쌀</option>
							<option value="3">수산·해산·건어물</option>
							<option value="4">정육·계란</option>
							<option value="5">국·반찬·메인요리</option>
							<option value="6">샐러드·간편식</option>
							<option value="7">면·양념·오일</option>
							<option value="8">생수·음료·우유·커피</option>
							<option value="9">간식·과자·떡</option>
							<option value="10">베이커리·치즈·델리</option>
							<option value="11">생활용품·리빙·캠핑</option>
						</select>
						</th>
						<th style="height: 60px; border-color: white;">

						<select name="divisionNum" id="division" title="소분류 카테고리" class="form-control col-sm-8">
							<option value="">-- 소분류 --</option>
						</select> 
						</th>
					</tr> 
					<br>
				</table>	
				<table class="table">
					<tr>
						포장타입
						<th style="vertical-align: left; width: 30%; border-color: white;">
							<select class="form-control col-sm-3" id="condition" name="storageNum" title="포장타입">
								<option value="" selected>선택</option>
								<option value="1">냉장</option>
								<option value="2">냉동</option>
								<option value="3">상온</option>
							</select>
						</th>
					</tr>					
				</table>
				<table class="table">
					<tr>
						배송유형
						<th style="vertical-align: left; width: 30%; border-color: white;">

							<select class="form-control col-sm-3" id="deliveryCode" name="deliveryCode" title="배송유형">
								<option value="" selected>선택</option>
								<option value="1">샛별배송</option>
							</select>
						</th>
					</tr>					
				</table> 
                
                  판매자 <input type="text" class="form-control form-control" name="seller" value="COLLABEE" disabled/> 
                  <br>

                  상품이미지
                    <div class="custom-file">
                      <input type="file" class="custom-file-input" id="customFile" title="썸네일 이미지" name="uploadFileMainPic" onchange="setThumbnail(event);">
                      <label class="custom-file-label" for="customFile">썸네일 이미지</label>
                    </div>
                    <div id="image_container"></div>
                    <input type="text" name="thumSysFilename" class="form-control form-control" title="썸네일 이미지 저장명" placeholder="썸네일 이미지 저장명">
                    
                    <br><br>
                    
                    <div class="custom-file">
                      <input type="file" class="custom-file-input" id="customFile2" title="상세 이미지" name="UploadFileDetailPic" onchange="setDetail(event);">
                      <label class="custom-file-label" for="customFile2">상세 이미지</label>
                    </div>
                    <div id="image_container2"></div>
                    <input type="text" name="detaileSysFilename"  class="form-control form-control" title="상세 이미지 저장명" placeholder="상세 이미지 저장명">

	            <div class="col-sm-2"></div>
	          </div>
	        </div>
	       </div>
	     </div>
        <div style="display: flex; justify-content: center;">
          <input type="button" class="goods_btn" value="등록" onclick="sendData(this.form)">&nbsp;&nbsp;
          <input type="reset" class="goods_btn" style="border: none; color: white;" value="초기화">
        </div>
      </form>
    </body>
     <br><br>
     
     
     
    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
  </html>