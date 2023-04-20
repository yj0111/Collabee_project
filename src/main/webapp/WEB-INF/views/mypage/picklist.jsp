<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/picklist.css">
   	
</head>
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

<script>
$(function(){
	var mvo = { memberNum : ${loginMember.getMemberNum()} }
	console.log(mvo); 
	
	$.ajax("getPickListAjax.do",{ 
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
				console.log("찜한상품 목록 >> ");			
				console.log(data);		
				
				let htmlTag = "";
				var pickCnt = data.length.val;
				console.log ("찜상품 갯수 : " + pickCnt)
				
				if (data.length == 0) {
					console.log("찜목록없음")
					pickCnt = 0;
					htmlTag += '<div class="orderList">';
					htmlTag += '<div class="text-center noData "><h4><b>찜한 상품이 없습니다.</b></h4>';
					htmlTag += '<br>';
					htmlTag += '<button type="button" class="btn text-center" id="fillbtn" onclick="goMain()"><b>찜하러 가기</b></button>'
					htmlTag += '</div>';
					htmlTag += '</div>';
				} else {			
					$.each(data, function(index, pick){ 
						htmlTag += 
						htmlTag += '<div class="d-flex align-content-between pick-item-container" style="padding: 20px 0px;">';
						htmlTag += '<div class="item-col1">';
						htmlTag += '<div class="pick-item-img"><img src=" ${pageContext.request.contextPath }/resources/imgs/goods/'+ pick.thumSysFilename + '" style="width: 60px; height: 78px;"></div>';
						htmlTag += '</div>';
						htmlTag += '<div class="item-col2" style="width:600px; height: 79px; margin-left: 20px; margin-right: 100px; border: 2px soild #B03FE3;">';
						htmlTag += '<div class="pick-item-info-proname">'+ pick.productName +'</b></div>';
						htmlTag += '<div class="pick-item-info-price">' + pick.price + ' 원</div>';
						htmlTag += '</div>';
						htmlTag += '<div class="item-col3" style="width: 104px;">';
						htmlTag += '<div class="pick-item-del"><button type="button" class="btn btn-outline-del" style="margin-bottom: 10px;" onclick="delPickList('+pick.productNum+')">삭제</button></div>';
						htmlTag += '<div class="pick-item-del"><button type="button" class="btn btn-outline-add" onclick="addCart('+pick.productNum+')"><i class="bi bi-cart4"></i>담기</button></div>';
						htmlTag += '</div>';
						htmlTag += '</div>';
						htmlTag += '<div class="item-col4" style="border-bottom: 0.5px solid grey;"></div>';
						
					});//$.each()끝
	
				}
					$("#pickList").html(htmlTag);
					$("#pickCnt").html(pickCnt);
					
			},//success
			erroer: function(){
				alert("쿠폰 목록 불러오기 실패");
			}
		}); //ajax끝 

	
});

</script>
<script>
	function goMain(){
		location.href="../collections/main.do"
	}
	function addCart(goodsNum) {
		//alert("카트에 담기!"); //카트에담으면 찜목록에서 사라짐!
			// 상품 개수
			var goodsCount = 1;
			
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
					//alert("성공");
					if (result == 1) {
						getBtnSignal(goodsNum, 1);
					} else if (result == 2) {
						getBtnSignal(goodsNum, 2);
					} else if (result == 3) {
						getBtnSignal(goodsNum, 3);
					} else if (result == 0) {
						alert("오류");
					}
				},
				error: function(){
					alert("실패");
				}
			}); 
			
			delPickList(goodsNum);
	}
	
	function delPickList(productNum) {
		//alert("찜목록에서 삭제");
		
		var memberNum = ${loginMember.getMemberNum()}
		var pickInfo = { "memberNum": memberNum, "productNum" : productNum }
		
		$.ajax("delPickListAjax.do",{ 
			type: "post",
			data: JSON.stringify(pickInfo),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
				var mvo = { memberNum : memberNum }
				alert("찜목록삭제성공"); 
				
				$.ajax("getPickListAjax.do",{ 
					type: "post",
					data: JSON.stringify(mvo),
					contentType: "application/json",
					dataType: "json",
					success: function(data){
						console.log("찜한상품목록 가져오기 >>");
						console.log(data);			
						let htmlTag = "";
						let pickCnt = data.length;
				
						if(data.length = 0){
							htmlTag += '<h1> 찜한 상품이 없습니다.</h1>';
						} else {
						
							$.each(data, function(index, pick){ 
								htmlTag += '<div class="d-flex align-content-between pick-item-container" style="padding: 20px 0px;">';
								htmlTag += '<div class="item-col1">';
								htmlTag += '<div class="pick-item-img"><img src="'+ pick.thumOriFilename + '" style="width: 60px; height: 78px;"></div>';
								htmlTag += '</div>';
								htmlTag += '<div class="item-col2" style="width:600px; height: 79px; margin-left: 20px; margin-right: 100px; border: 2px soild #B03FE3;">';
								htmlTag += '<div class="pick-item-info-proname">'+ pick.productName +'</b></div>';
								htmlTag += '<div class="pick-item-info-price">' + pick.price + ' 원</div>';
								htmlTag += '</div>';
								htmlTag += '<div class="item-col3" style="width: 104px;">';
								htmlTag += '<div class="pick-item-del"><button type="button" class="btn btn-outline-del" style="margin-bottom: 10px;" onclick="delPickList('+pick.productNum+')">삭제</button></div>';
								htmlTag += '<div class="pick-item-del"><button type="button" class="btn btn-outline-add" onclick="addCart('+pick.productNum+')"><i class="bi bi-cart4"></i>담기</button></div>';
								htmlTag += '</div>';
								htmlTag += '</div>';
								htmlTag += '<div class="item-col4" style="border-bottom: 0.5px solid grey;"></div>';
								
							});
						}
						$("#pickList").html(htmlTag);
						$("#pickCnt").html(pickCnt);
					},
					erroer: function(){
						alert("찜한상품 불러오기 실패");
					}
				}); //ajax끝 

				
			},
			error: function(){
				alert("실패");
			}
		}); 
		
	}

</script>



 <body style="width: 1900px;">
   <header>   
     <%@ include file= "../common/header.jspf"%> 
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
                    <h4 style="margin-right: 20px;">찜한상품( <span id="pickCnt"></span> 개 )</h4>
                  </div>
                  <div style="display: inline; line-height: 38px; vertical-align: bottom; "><small>찜한상품은 최대 100개까지 저장됩니다.</small></div>
              </div>
            </div>
			
		
				
 			<div class="mypage-top4" style="padding: 15px;">
             
              <!--반복-->
              <div class="content-container" id ="pickList">
<!-- 
                찜목록
 -->

              </div>
              <!--반복 끝-->
            
			</div> <!-- mypage-top4 -->
				
			</div> <!-- col-sm-6 -->
		   
		    <div class="col-sm-2"></div>
		    
		</div>
          
		<div class="blank"></div>
		
	</div>

    <footer>
      	<%@ include file= "../common/footer.jspf"%> 

    </footer>
    
 </body>
</html>