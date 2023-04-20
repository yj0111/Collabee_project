<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

      li span{
      	font-size: large;
        font-weight: bold;
        color: black;
      }

      h2{
      font-weight: bold;
        }

      h4{font-weight: bolder;
        }
        
      span{
        vertical-align: middle;
        font-size: small; 
        color: gray;
      }
      .main{
        padding-bottom: 24px;
        padding-top: 10px ;
      }
      /* thead {
        background-color: #FEF7FF;
        vertical-align: middle;
      } */

      /* table > tbody:hover {
        background-color: #FEF7FF;
      } */
      
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
      .coupon_btn{
	      padding: 0px 10px;
	      text-align: center;
	      overflow: hidden;
	      width: 120px;
	      height: 44px;
	      border-radius: 3px;
	      color: rgb(255, 255, 255);
	      background-color: #9A30AE;
	      border: 0px none;
	      font-size: 13px;
    }

      .click {
        color: #B03FE3; 
        background-color: #FEF7FF;
      }

  </style> 
  
  <script>
  
    $(function(){
      $("#th_checkAll").click(function() {
        console.log($(this).is(":checked"));
        if ($(this).is(":checked")) {
          $(".chk:not(checked)").each(function() {
            $(this).prop("checked", true);
          });
        } else {
          $(".chk:checked").each(function() {
            $(this).prop("checked",false);
          });
        }
      });
    });
    
    
    $().ready(function(){
    	getJsonCouponsList();
    }); 
    
    /* function getJsonCouponsList() {
    	
    	console.log("getJsonCouponsList 들어옴")
		
		$.ajax("../coupons/getJsonCouponsList.do", {
			type: "get",
			dataType: "json",
			success: function(data){
				console.log(data);
				
				let dispHtml = "";
				for (let content of data) {
					dispHtml += "<tr>";
   					dispHtml += "<td class='text-center'>"+content.couponNum+"</td>";
   					dispHtml += "<td><a href='../coupons/couponsSelect.do?couponNum="+content.couponNum+"' style='text-decoration: none; color: black;'>"+content.couponName+"</a></td>";			
   					dispHtml += "<td>"+content.disPrice+"</td>";			
   					dispHtml += "<td>"+content.count+"</td>";			
   					dispHtml += "<td>"+content.leastCost+"</td>";			
   					dispHtml += "<td>"+content.couponDate+"</td>"; 
   					dispHtml += "</tr>";
				} 
				
				$("#coupon-list-area").html(dispHtml);
				
			},
			error: function(){
				alert("실패!~~");
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		}); 
	} */


  </script>
  </head>
  	  <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>
  <body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
    <div class="container-fluid">
    <div class="row" style="padding-top:50px; padding-bottom: 50px">
        <div class="col-sm-2"></div>
        <div class="col-sm-2">
            	<%@ include file = "./adminSideNav.jspf" %>
        </div>
        <div class="col-sm-6">
            <div class="main" style="border-bottom:1px solid black;">
                <h4>쿠폰 발행 목록</h4>
            </div>
              <form id="form" name="form" method="post">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th class="text-center" style="vertical-align: middle; width: 100px; height: 60px; vertical-align: middle;">쿠폰번호</th>
                      <th style="vertical-align: middle; width: 300px;">쿠폰명</th>
                      <th style="vertical-align: middle;">할인금액</th>
                      <th style="vertical-align: middle;">총 수량</th>
                      <th style="vertical-align: middle;">최소 구매금액</th>
                      <th style="vertical-align: middle;">유효기간</th>
                    </tr>
                  </thead>
                  <tbody id="coupon-list-area">
                  	<c:if test="${not empty couponsList }">
                  		<c:forEach var="content" items="${couponsList }" >
		                  	<tr>
			   					<td class="text-center">${content.couponNum}</td>
			   					<td><a href="../coupons/couponsSelect.do?couponNum=${content.couponNum}" style="text-decoration: none; color: black;">${content.couponName}</a></td>			
			   					<td><fmt:formatNumber value="${content.disPrice}" pattern="#,###" /></td>			
			   					<td>${content.count}</td>		
			   					<td><fmt:formatNumber value="${content.leastCost}" pattern="#,###" /></td>			
			   					<td><fmt:formatDate value="${content.couponDate}" pattern="yyyy-MM-dd" /></td>
		   					</tr>
   						</c:forEach>
				  	</c:if>
                  </tbody>
                </table>
              </form>
              <div class="btn_list">    
<!--                 <div class="btns">
                  <button class="btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                  </button>
                  <button class="btn2">
                    <i class="bi bi-chevron-right"></i>
                  </button> -->          
			<div class="container" style="text-align: right;">
			<!-- Button to Open the Modal -->
				<button onclick="javascript:location.href='couponsInsertPage.do'" class="coupon_btn" type="button" >쿠폰발행</button>				
				  </div>
				</div>
				<div class="col-sm-2"></div>
		  </div>
		</div>

      </div>
    </div>
  </body>
  <br><br>
    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
</html>
  