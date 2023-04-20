<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/inquiryProduct.css">

</head>

<style>
	/*데이터없을경우*/
	 #fillbtn {
       background-color: #692498; 
       color: white; 
       width: 200px; 
       height: 56px;
     }
</style>
<script>
function goInquiry(){
	location.href="../inquiry/inquiry.do";
}
$(function(){	
	let mvo = { memberNum: ${loginMember.memberNum } }
	console.log("상품문의mvo: " + mvo)
	$.ajax("getMyProQnaAjax.do",{ 
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			console.log(data);
			
			let htmlTag = "";
			let inquiryCnt = data.length;
			console.log ("작성한 문의 갯수 : " + inquiryCnt)

			if (data.length == 0) {
				console.log("작성한 리뷰  없음")
				htmlTag += '<div class="orderList">';
				htmlTag += '<div class="text-center noData "><h4><b>작성한 문의가 없습니다.</b></h4>';
				htmlTag += '<br><br>';
				htmlTag += '<button type="button" class="btn text-center" id="fillbtn" style="width: 340px; height: 54px;" onclick="goInquiry()"><b>문의하러 가기</b></button>'
				htmlTag += '</div>';
				htmlTag += '</div>';
			$('#noPost').html(htmlTag);
			} else {
			
				$.each(data, function(index, proQnaList){ 
						htmlTag += '<section class="inquiryRow">';
						htmlTag += '<button type="button" class="btn" data-toggle="collapse" data-target="#qna'+proQnaList.proQnaNum+'" style="width: 860px;">';
						htmlTag += '<li class="d-flex inquiryPro-row">';
						htmlTag += '<div class="Q_proImg"><img src=" ${pageContext.request.contextPath }/resources/imgs/goods/'+ pick.thumSysFilename  + '"style="width: 60px; height: 78px;" ></div>';
						htmlTag += '<div class="Q_titleWrapCon">';
						htmlTag += '<div class="pro_name">' + proQnaList.productName +'</div>';
						htmlTag += '<div class="Q_title">' + proQnaList.qTitle +'</div>';
						htmlTag += '</div>';
						htmlTag += '<div class="Q_date minusPoint" style="padding-top: 20px;">'+proQnaList.qDate.substring(0,10)+'</div>';
					if(proQnaList.qStatus == "Y") {
						htmlTag += '<div class="Q_state plusPoint" style="padding-top: 20px;">답변완료</div>';
					}
					if (proQnaList.qStatus == "N") {
						htmlTag += '<div class="Q_state minusPoint"  style="padding-top: 20px;">답변대기</div>';
					}
						htmlTag += '</li>';
						htmlTag += '</button>';
						
						htmlTag += '<li class="answerPro">';
						htmlTag += '<div class="collapse answerPro-row" id="qna'+proQnaList.proQnaNum+'">';
						htmlTag += '<div class="inquiryPro-Area d-flex">';
						htmlTag += '<div class="">';
						htmlTag += '<span class=""><i class="bi bi-question-circle"></i></span>';
						htmlTag += '</div>';
						htmlTag += '<div class="content">' + proQnaList.qContent +'</div>';
						htmlTag += '</div>';
					if (proQnaList.qStatus == "Y") {
						htmlTag += '<div class="answerPro-Area d-flex hide">';
						htmlTag += '<div class="">';
						htmlTag += '<span class=""><i class="bi bi-person-circle"></i></span>';
						htmlTag += '</div>';
						htmlTag += '<div class="content">'
						htmlTag += proQnaList.aAnswer;
						htmlTag += '</div>';
						htmlTag += '</div>';
					}
						htmlTag += '</div>';
						htmlTag += '</li>';
						htmlTag += '</section>';
						
				});

				$('#inquiryArea').html(htmlTag);
			
			}//success/else
		},
		error: function(){
			console.log("ajax실패이거 상품문의");
			
		}
	});
	
});

</script>

 <body style="width: 1900px;">
 
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
                <div>
                  <div id="category-name" style="display: inline-block; margin-bottom: 9px;">
                    <h4 style="margin-right: 20px;">상품문의</h4>
                  </div>
                  <div>
                    <ul class="menuInfoList">
                      <li class="menuInfo">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                      <li class="menuInfo">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <span class="highlight" href="/mypage/inquiry/list">1:1 문의</span>에 남겨주세요.</li>
                    </ul>
                  </div>
              </div>
            </div>
				
				<div class="mypage-top4">
					
				<section id="noPost">
                <div class="d-flex inquiryPro-col">
                  <div class="Q_titleWrap">제목</div>
                  <div class="Q_date">작성일</div>
                  <div class="Q_state">답변상태</div>
                </div>
                
                <ul style="padding: 0px;" id="inquiryArea">
                 
                  <!-- 데이터 있는 만큼 반복 -->     
                 <!-- <section class="inquiryRow">                                                                   여기 바뀌어야함
                    <button type="button" class="btn" data-toggle="collapse" data-target="#demo" style="width: 860px;">
                      <li class="d-flex inquiryPro-row" onclick="showAnswer()">
                        <div class="Q_proImg"><img src=""></div>
                        <div class="Q_titleWrapCon">
                          <div class="pro_name">[맨날먹는] 맛있는 반나나나 </div>
                          <div class="Q_title">바나나 안익은거도 보내주시나요?</div>
                        </div>
                        <div class="Q_date minusPoint" style="padding-top: 20px;">22.11.23</div>
                        답변여부에 따라 변경
                        <div class="Q_state plusPoint" style="padding-top: 20px;">답변완료</div>
                        <div class="Q_state minusPoint">답변대기</div>
                      </li>
                    </button>

                    <li class="answerPro">
                      <div class="collapse answerPro-row" id="demo">
                        <div class="inquiryPro-Area d-flex">
                          <div class="iconArea">
                            <span class="icon"><i class="bi bi-question-circle"></i></span>
                          </div>
                          <div class="content">바나나 안 익어야지 맛있는데 ㅋ</div>
                        </div>

                        <div class="answerPro-Area d-flex hide">
                            <div class="iconArea">
                              <span class="icon"><img  class="iconArea"></span>
                            </div>
                            <div class="content">
                              안녕하세요 고객님, 먼저 저희 콜라비를 이용해 주셔서 감사합니다.
                              <br> 품절된 또는 판매가 종료된 상품의 경우 협력사 협의 하에 따라 입고 여부 및 일정 등 결정 되고 있어, 별도 확인이 어려워 안내드리기 어려운 점 너른 양해 부탁드립니다.
                              <br> 암튼 죄송합니당 
                            <div class="css-1kna94k etpoi031">2022.11.23</div>
                            </div>
                        </div>

                      </div>
                    </li>
                  </section> -->
                  <!-- 반복 끝-->
           
                </ul>
                
                <!--페이징처리-->
  
              </section>

				</div> <!-- mypage-top4 -->	
				   
			</div> <!-- col-sm-6 -->
		   
		    <div class="col-sm-2"></div>
		    
		</div>
          
		<div class="blank"></div>
		
	</div>

    <footer>
		<%@ include file= "../common/footer.jspf" %>
    </footer>
    
 </body>
</html>