<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">


<style type="text/css">
 /* 기존거 가져옴 */

    .order-item-col2 .order-item {
      line-height: 150px;
      vertical-align: middle;
    }
    .order-item-col2 .button-cover {
      margin-top: -60px;
    }
    
 
 /* 마이페이지 컨텐츠 css*/
	
	.order-list-continer {
		width: 960px;
		height: 210px;
		padding: 16px 0px;
		border: 14px 0px 16px;
		margin-bottom: 14px;
		display: flex;
	}
    .bold {
    	font-weight: bold;
    }
    
    img {
	    width: 60px;
	    height: 78px;
	    margin : 10px 10px 50px 10px ;
    }
    .order-item-thumb {
	    float: left;
    }


    /* 주문일자 + 상세내역 */
    .order-item-date {
		width: 930px;
		border-bottom: 0.5px solid grey;
		padding: 8px 0px 13px;
    }
    .order-item-date a{
      font-size: small;
      color: grey;
      font-weight: bold;
      text-decoration: none;
    }
    dl {
      width: 620px;
    }
    dt {
      font-size: small;
      float: left;
      padding: 5px;
      width: 80px;
    }
    dd {
      font-size: 0.9em;
    }

    .order-data {
      width: 520px;
      padding: 5px;
      margin-bottom: 0px;
    }
    .order-item-info {
      text-align: left;
      margin-bottom: 0px;
    }

    .order-item-status { 
      width: 100px;
      margin-top:50px;
    }

    .borderbtn {
      background-color: white; 
      color: #692498; 
      border:0.5px solid #692498; 
      width: 100px; 
      height: 36px;
    }


     
     <style>
	/*데이터없을경우*/
	.noData {
		padding-top: 50px;
	}
	 #fillbtn {
       background-color: #692498; 
       color: white; 
       width: 200px; 
       height: 56px;
     }
</style>
     
     
</style>

</head>
<script>
$(function(){
	month1();
});	

	
function month1(){
	period = 1;
	periodSelect(period);
}
function month3(){
	period = 3;
	periodSelect(period);
}
function month6(){
	period = 6;
	periodSelect(period);
}

function inquiry(){
	location.href="../inquiry/inquiry.do";
}

function goMain() {
	location.href="../collections/main.do";
}



function periodSelect (period) {
	//alert(">>기간선택: " + period);
	
	var memberNum = ${loginMember.getMemberNum()}
	var orderInfo = { "memberNum": memberNum, "period" : period }
	console.log("ajax에 넘길 값 memberNum: " + memberNum + " period :" + period )
	
	//주문목록 불러오기
	$.ajax("getOrderListAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(orderInfo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			//alert("주문내역 불러오기 성공"); 		
			console.log("주문내역 불러오기 >>")
			//console.log("주문목록길이 : " + data.length)
			var htmlTag = '';

			if (data.length == 0) {
				console.log("주문내역없음")
				htmlTag += '<div class="orderList">';
				htmlTag += '<div class="text-center noData "><h4><b>주문내역이 없습니다.</b></h4>';
				htmlTag += '<br>';
				htmlTag += '<button type="button" class="btn text-center" id="fillbtn" onclick="goMain()"><b>쇼핑하러 가기</b></button>'

				htmlTag += '</div>';
				htmlTag += '</div>';
			} else {
					
				$.each(data, function(index, orderList){ 
				 	htmlTag += '<div class="orderList">';
				 	htmlTag += '<div class="order-item-row1">';
				 	htmlTag += 		'<div class="order-item-date">';
				 	htmlTag += '<form>'
				 	htmlTag += '<input type="hidden" name="orderNum" value="'+orderList.orderNum+'">'
				 	
			 		htmlTag += 			'<span class="order-data bold">'+ orderList.orderDate.substring(0,10)+ 
			 						'(' +orderList.orderDate.substring(10,12)+ '시 '
			 							+orderList.orderDate.substring(14,16)+ '분 ) </span><a href="orderDetail.do?orderNum='+orderList.orderNum+'" style="float: right;">주문내역 상세보기 ></a>';
				 	htmlTag += '</form>'
				 	
			 		htmlTag += 		'</div>'; 
			 		htmlTag += '</div>';
			 		
			 		htmlTag += '<div class="d-flex align-content-between order-item-row2">';
			 		htmlTag += '<div class="order-item">'
			 					+ '<img src="${pageContext.request.contextPath }/resources/imgs/goods/'+ orderList.thumSysFilename +'" alt="'+ orderList.thumSysFilename+'" class="order-item-thumb">'
			 					+ '<dl class="order-item-info">'
			 		            + '<dt class="order-item">상품명</dt>'
			 		            + '<dd class="order-data">' + orderList.productName + '</dd>'
			 		         + '</dl>';
			 		htmlTag += '<dl class="order-item-info">'
				              		+ '<dt class="order-item">주문번호</dt>'
				              		+ '<dd class="order-data">' + orderList.orderNum + '</dd>'
			            	+ '</dl>';
			 		htmlTag +=   ' <dl class="order-item-info">'
						            + '<dt class="order-item">결제방법</dt>'
						            + '<dd class="order-data">' + orderList.ptDetailname + '</dd>'
					            + '</dl>';
			 		htmlTag +=    '<dl class="order-item-info">'
						            + '<dt class="order-item">결제금액</dt>'
						            + '<dd class="order-data">' + orderList.totPrice + '</dd>'
					            + '</dl>';
			 		htmlTag += '</div>';
			 		htmlTag += '<div style="width: 150px;"></div>';
			 		htmlTag += '<div class="order-item-status">'
					            + '<div style="width: 100px; text-align: center;" >' + orderList.deliveryStatus + '</div>'
						            + '<div class="button-cover">'
						            + '<button type="button" class="btn text-center borderbtn" onclick="inquiry()"><span>1:1 문의</span></button>'
					            + '</div>'
					         + '</div>';
			 		htmlTag += '</div>';
			 		htmlTag += '</div>';
			
				});
			}//else 끝
				$("#orderListCon").html(htmlTag);   

			},//success
			error: function(){
				alert("주문내역 불러오기 getOrderListAjax 실패")
			}
	});//ajax끝
}



</script>

<body>
<%-- Session에 저장된 \${loginMember } : ${loginMember } --%>
   <header>
    	 <%@ include file= "../common/header.jspf" %>
   </header>
   
    <div id="container">
     
        <div class="row" id="mypage-top">
            <div class="col-sm-2" style="background-color:#F7F7F7;"></div> 
            
            <div class="col-sm-8" style="background-color:#F7F7F7;">
             <!-- 마이페이지 상단 --> 
             <jsp:include page="../common/mypage/mypageTop.jsp" flush="true" />
              
            </div> 
            <div class="col-sm-2" style="background-color: #F7F7F7;"></div>
        </div>

        <div class="blank"></div>
       
        <div class="row" id="mypage-bottom">
          
          <div class="col-sm-2"></div>
          
          	<!-- 마이페이지네비메뉴 -->
  			<jsp:include page="../common/mypage/mypageSide.jsp" flush="true" />
          
          <!-- 마이페이지 콘텐츠 영역 -->
          <div class="col-sm-6"> 
            <div class="mypage-top3">
                <div style="width: 100%; height: 50px;">
                  <div id="category-name" style="display: inline-block;">
                    <h4 style="margin-right: 20px;">주문내역</h4>
                  </div>
                  <div style="display: inline; line-height: 38px; vertical-align: bottom;"><small>최대 지난 6개월간의 주문 내역까지 확인할 수 있어요</small></div>
       
                  <div class="dropdown" style="float: right; margin-top: 5px; margin-left: 180px;">            
                    <button type="button" class="btn btn-outline dropdown-toggle" data-toggle="dropdown" style="color: #B03FE3; border-radius: 0; width: 150px;">1주일</button>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" onclick="month1()">1개월</a>
                      <a class="dropdown-item" onclick="month3()">3개월</a>
                      <a class="dropdown-item" onclick="month6()">6개월</a>
                    </div>
                    
                  </div> 
              </div>
            </div>

            <div class="mypage-top4">
               
              <div class="" id="orderListCon">
                <!-- DB 에서 LIST 불러와서 반복문 적용 
						주문목록 보이는 곳
                   -->
                </div>
              </div>
              
            </div>
            
          	<div class="col-sm-2"></div>
          </div>
          
          </div>
          <div class="blank"></div>
      </div>

        
    </div>    
    
    
    <footer>
     <%@ include file= "../common/footer.jspf" %>
      <%-- jsp:include page="../common/footer.jspf" flush="true" --%>
    </footer>
    </body>
</html>