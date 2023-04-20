<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>콜라비</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	
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

      h2{font-weight: bold;
        }

      h4{font-weight: bolder;
        }
        
      h4 span{
        vertical-align: middle;
        font-size: small; color: gray;
      }
      .main{
        padding-bottom: 24px;
        padding-top: 10px ;
      }
      
      #th_checkAll {
      	background-color: #B03FE3;
      }
      
      .pagination>li>a, .pagination>li>span {
        border: 1px solid darkgray;
        color: darkgray;
      }
      .pagination > li > a:hover {
        background: #B03FE3;
        color: #fff;
      }
      button {
        border: none;
        box-shadow:none !important;
      }
      button:hover {
        background-color: none;
      }
      .form-check-input {
        margin: auto;
      }
      .text-center, .table{
        text-align: center;
      }
      .btn_list{
        padding-top: 45px;
      }
      .btn1, .btn2 {
        display: inline-block;
        border: black;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
      }
      .btn1:hover{
        border: solid 1px darkgray;
      }
      .btn2:hover{
        border: solid 1px darkgray;
      }
      .btns{
        text-align: center;
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

      .click {
        color: #B03FE3; 
        background-color: #FEF7FF;
      }
      
      .right {
      	text-align: right;
      }

	</style> 
	<script>
		function admin_go_search(){
			let sword = $("#productSearch").val();
			location.href = "../adminGoods/productSearch.do?sword=" + sword;
		}
		
		console.log("${goodsList }");
		
	</script>
 
  </head>

  <body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
    <div class="container-fluid">
    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>

    <div class="row" style="padding-top:50px; padding-bottom: 50px">
        <div class="col-sm-2"></div>
        <div class="col-sm-2">
            <%@ include file = "./adminSideNav.jspf" %>
        </div>
        <div class="col-sm-6">
            <div class="main" style="border-bottom:2px solid black; padding-bottom: 50px;">
                <h4>등록상품 목록</h4>
                <div style="float: right;">
	                <input id="productSearch" class="search-box" type="text" placeholder="상품명을 검색하세요." onkeypress="if(event.keyCode == 13){admin_go_search();}">
	                <button style="position: relative; border: 1px solid gray" onclick="admin_go_search()">검색</button>
                </div>
            </div>
              <form id="form" name="form" method="post">
                <table class="table table-hover" style="vertical-align:middle">
                	<colgroup>
                		<col style="width: 10%">
                		<col style="width: 15%">
                		<col style="width: 35%">
                		<col style="width: 10%">
                		<col style="width: 10%">
                		<col style="width: 10%">
                		<col style="width: 10%">
                	</colgroup>
                  <thead>
                    <tr>
                      <%-- <th class="center"><input type="checkbox" class="" name="checkAll" id="th_checkAll" style="width: 20px; height: 45px; vertical-align: middle;"/></th> --%>
                      <th class="text-center">상품번호</th>
                      <th style="vertical-align: middle;">상품이미지</th>
                      <th style="vertical-align: middle;">상품명</th>
                      <th style="vertical-align: middle;">판매금액</th>
                      <th style="vertical-align: middle;">포장타입</th>
                      <th style="vertical-align: middle;">배송유형</th>
                      <th style="vertical-align: middle;">재고</th>
                    </tr>
                  </thead>
                  <tbody id="listDisp">
                  <c:if test="${not empty goodsList }">
					<c:forEach var="product" items="${goodsList }" >
						<tr>
							<%-- <td class="center"><input type="checkbox" class="chk" name="checkRow" value="${content.IDX}" style="width: 20px; height: 20px;"></td> --%>
							<td class="center">${product.productNum}</td>
							<td class="center"><img src="../resources/imgs/goods/${product.thumSysFilename }" style="width: 75px; height: 100px;" alt="상품"></td>
							<td class="center"><a href="adminGoodsSelect.do?productNum=${product.productNum }" style="color: black;">${product.productName }</a></td>
							<td class="center right"><fmt:formatNumber value="${product.saleprice }" pattern="#,###" /></td>
							<td class="center">${product.condition }</td>
							<td class="center">${product.deliveryType }</td>
							<td class="center">${product.stock }</td>
						</tr>
					</c:forEach>
				  </c:if>
                  </tbody>
             	</table>
		              <div class="btn_list">    
		               <div class="btns">        
		                  <button class="btn1" disabled>
		                    <i class="bi bi-chevron-left"></i>
		                  </button>
		                  <button class="btn2" onclick="getJsonGoodsListData(this.form)">
		                    <i class="bi bi-chevron-right"></i>
		                  </button>
							<input type="button" value="상품등록" class="goods_btn" onclick="javascript:location.href='adminGoodsInsertPage.do'">    				
		               <!--  </div> -->
		    </div>
         </form>     
        <div class="col-sm-2"></div>
      </div>
          
          <!-- <div class="text-center">
            <ul class="pagination justify-content-center pagination my">
                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">다음</a></li>
            </ul>
        </div> -->
        
      </div>
    </div>
    
    <script>
     function getJsonGoodsListData(form) {
			console.log($(form).serialize());
			$.ajax("getJsonGoodsList.do", {
				type: "get",
				data: $(form).serialize(),
				dataType: "json",
				success: function(data) {
					console.log(data);
					
					let dispHtml = "";
					for (let goods of data) {
						dispHtml += "<tr>";
						dispHtml += "<td class='center'>" + goods.productNum + "</td>";
						dispHtml += "<td class='center'><img src='../resources/imgs/goods/'" + goods.thumSysFilename + "style='width: 75px; height: 100px;' alt='상품'></td>";
						dispHtml += "<td class='center'><a href='adminGoodsSelect.do?productNum='" + goods.productNum + "'style='color: black;'>" + goods.productName + "</a></td>";
						dispHtml += "<td class='center right'>" + goods.saleprice + "</td>";
						dispHtml += "<td class='center'>" + goods.condition + "</td>";
						dispHtml += "<td class='center'>" + goods.deliveryType + "</td>";
						dispHtml += "<td class='center'>" + goods.stock + "</td>";
						dispHtml += "</tr>";
					}					
					$("#listDisp").html(dispHtml);
				},
				error: function(){
					alert("실패~");
				}
			});
		}
    </script>
    	
  </body>
<br><br>
    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
</html>