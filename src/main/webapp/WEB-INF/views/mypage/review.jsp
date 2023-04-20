<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/review.css">

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
  let beforeWriteArea = document.querySelector('.beforeWriteArea');
  let writtenArea = document.querySelector('.writtenArea');
  console.log("before writeArea" + beforeWriteArea);
  beforeWriteArea.classList.remove('hide');
  writtenArea.classList.add('hide');
  
  $('#beforeWrite').attr('style', "border-bottom:none; color: #692498");
  $('#written').attr('style', "background-color: #FEF7FF;");
  var reviewInfo = { 
 				 memberNum : ${loginMember.getMemberNum()},
 				 reviewStatus :'N'
  }
  console.log("reviewInfo :" + reviewInfo.memberNum)
  showBeforeWrite(reviewInfo);
  	
	//작성 가능한 리뷰
   $('#beforeWrite').click(function(){ 
  	 console.log("작성 가능한리뷰 클릭");	  
     beforeWriteArea.classList.remove('hide'); //보이기
     writtenArea.classList.add('hide'); //숨김
     $('#beforeWrite').attr('style', "border-bottom:none; color: #692498");
     $('#written').attr('style', "background-color: #FEF7FF;");
     var reviewInfo = { 
    				 memberNum : ${loginMember.getMemberNum()},
    				 reviewStatus :'N'
     }
	 console.log("reviewInfo :" + reviewInfo.memberNum)
	 showBeforeWrite(reviewInfo);
   });
   
	function showBeforeWrite(reviewInfo) {	
		$.ajax("getMemberReviewAjax.do",{ 
			type: "post",
			data: JSON.stringify(reviewInfo),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
				console.log("리뷰목록불러오기");			
				console.log(data);				
					
				let htmlTag = "";
				let reviewCnt = data.length;
				console.log ("작성 가능한 리뷰 갯수 : " + reviewCnt)
				
				if (data.length == 0) {
					console.log("작성 가능한 리뷰  없음")
					htmlTag += '<div class="orderList">';
					htmlTag += '<div class="text-center noData "><h4><b>작성 가능한 리뷰가 없습니다.</b></h4>';
					htmlTag += '<br>';
					htmlTag += '<button type="button" class="btn text-center" id="fillbtn" onclick="goMain()"><b>쇼핑하러 가기</b></button>'
					htmlTag += '</div>';
					htmlTag += '</div>';
				} else {
					$.each(data, function(index, reviewList){ 
						htmlTag += '<div class="reivewGrp">';
						htmlTag += '<div class="review-container" id="review" style="">';
						htmlTag += '<div id="reviewContent">';
						htmlTag += '<li class="d-flex inquiryPro-row" style="padding: 20px;">';
						htmlTag += 		'<div class="pro_img"><img src="${pageContext.request.contextPath }/resources/imgs/goods/'+ reviewList.thumOriFilename +'" style="width: 60px; height: 60px; border-radius: 5px;"></div>';
						htmlTag += 		'<div class="pro_title" style="width: 560px; text-align: left;padding-left:20px" >';
						htmlTag += 		'<div class="pro_name font-weight-bold">'+ reviewList.productName + '</div>';
						htmlTag += 		'<div class="">' + reviewList.deliveryPick.substring(0,10)+ ' ' + reviewList.deliveryStatus + '</div>';
						htmlTag += '</div>';
						htmlTag += '<div class="review-deadline minusPoint" style="width: 135px; margin-top: 20px; margin-right:20px;"></div>';
						htmlTag += '<div class="write_review" style="margin-top: 13px;">';
						htmlTag += '<button type="button" class="trigger btn font-weight-bold" id = "writeReviewBtn" data-toggle="modal" data-target="#reviewModal'+index+'" style="border: 1px solid lightgray; width: 100px; height: 36px; font-size: small; color: #666666;">후기작성</button>';
						htmlTag += '</div>';
						htmlTag += '</li>';
						htmlTag += '</div>';
						htmlTag += '</div>';
		                <!-- id="review" -->			
		                
		      			 //모달창 시작
						htmlTag += '<div class="modal fade" id="reviewModal'+index+'">';
						htmlTag += '<div class="modal-dialog modal-dialog-centered">';
						htmlTag += '<div class="modal-content">';
						htmlTag += '<div class="modal-header">';
						htmlTag += '<h4 class="modal-title">상품 후기</h4>';
						htmlTag += '<button type="button" class="close" data-dismiss="modal">&times;</button>';
						htmlTag += '</div>';
						htmlTag += '<div class="modal-body">';
																					
						htmlTag += '<form name="reviewFrm" id="reviewFrm" method="post" style="margin: 0px;" enctype="multipart/form-data">';
						htmlTag += '<input type="hidden" name="orderNum" id="orderNum" value="'+reviewList.orderNum+'">';
						htmlTag += '<input type="hidden" name="productNum" id="productNum" value="'+reviewList.productNum+'">';
						htmlTag += '<input type="hidden" name="memberNum" id="memberNum" value="'+reviewList.memberNum+'">';
						htmlTag += '<div class="productInfo d-flex align-content-between" style="margin-bottom: 20px;">';
		
						htmlTag += '<div class="writeProImg" style="border:none;margin: 0px 20px"><img src="${pageContext.request.contextPath }/resources/imgs/goods/'+ reviewList.thumOriFilename +'" style="width: 60px; height: 60px; border-radius: 5px;"></div>';
						htmlTag += '<div class="writeProName">'+ reviewList.productName + '</div>';
						htmlTag += '</div>';
						htmlTag += '<div class="writeArea d-flex">';
						htmlTag += '<div>'
						htmlTag += 		'<label for="R_content"style="width: 80px; text-align: left;  margin: 0px; margin-right: 20px;">내용</label> ';
						htmlTag += '</div>';
						htmlTag += '<div>'
						htmlTag += '<textarea type="text" name="Rcontent" placeholder="상품 특성에 맞는 후기를 작성해주세요. 예)레시피, 겉포장 속 실제 구성품 사진, 플레이팅, 화장품 사용자의 피부타입 등 " required="required"></textarea>';
						htmlTag += '</div>';
						htmlTag += ' </div>';
						htmlTag += '<div class="filebox d-flex align-content-between" style="margin-top:20px">';
						htmlTag += '<div style="width: 90px; text-align: left; margin-top: 15px; ">사진첨부</div>';
						
						htmlTag += '<div class="fileIconBox" style="margin-right: 20px;">';
						htmlTag += '<label for="file"><img src="https://cdn-icons-png.flaticon.com/512/1829/1829371.png" style="width: 60px; height: 60px;" alt="카메라" ></label>';
						htmlTag += '</div>';
						htmlTag += '<div><input type="file" id="file"  name="rOriFilename" onchange="setThumbnail(event)"></div>';
						htmlTag += '<div border:1px solid purple">';						
						htmlTag += '<label for="thumb"><img class="thumb" src="${pageContext.request.contextPath }/resources/imgs/member/blankBox.PNG" style="width: 60px; height: 60px;"></label>';			
						htmlTag += '</div>';
						
						htmlTag += '</div>';
						
						/* htmlTag += '<div class="modal-footer">'
								+  '<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'
						     	+  '</div>'; */
						htmlTag += '<div class="buttonBox" style="text-align: center;">';
						htmlTag += '<input type="button" id="write_review" value="작성하기" onclick="writeProReview()"> ';
						htmlTag += '</div>';
						
						
						htmlTag += '</form>';
						htmlTag += '</div>';
						htmlTag += '</div>';
						htmlTag += '</div>';
						htmlTag += '</div>';
						
					});
				}//else끝
				$("#reviewArea").html(htmlTag);
				$("#reviewCnt").html(reviewCnt);
			},
			erroer: function(){
				alert("리뷰 목록 불러오기 실패");
			}
		}); //ajax끝 
	};
   
   //작성한 리뷰탭
   $('#written').click(function(){ //
  	 console.log("작성한리뷰 클릭");	  
     writtenArea.classList.remove('hide'); //보이기
     beforeWriteArea.classList.add('hide');// 숨김
     $('#written').attr('style', "border-bottom:none; color: #692498");
     $('#beforeWrite').attr('style', "background-color: #FEF7FF;");
    
     var reviewInfo = { 
    				 memberNum : ${loginMember.getMemberNum()},
    				 reviewStatus :'Y'
     }
	 console.log("reviewInfo :" + reviewInfo.memberNum)	
	 showWritten(reviewInfo);
   });//  $('#written').click(function()
		   
	
	function showWritten(reviewInfo) {
		$.ajax("getMemberReviewAjax.do",{ 
			type: "post",
			data: JSON.stringify(reviewInfo),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
				console.log("작성한리뷰목록불러오기");	
				
				console.log(data);	
				let writeReviewCnt = data.length;
				console.log ("작성한 리뷰 갯수 : " + writeReviewCnt)
				
				let htmlTag = "";
				if (data.length == 0) {
					console.log("작성한 리뷰  없음")
					htmlTag += '<div class="orderList">';
					htmlTag += '<div class="text-center noData "><h4><b>작성한 리뷰가 없습니다.</b></h4>';
					htmlTag += '<br><br>';
					htmlTag += '<button type="button" class="btn text-center" id="fillbtn" style="width: 340px; height: 54px;" onclick="goMain()"><b>쇼핑하러가기</b></button>'
					htmlTag += '</div>';
					htmlTag += '</div>';
				
				} else {
					
					$.each(data, function(index, reviewList){ 
						htmlTag += '<div class="review-container" style="">';
						htmlTag += '<li class="d-flex inquiryPro-row" style="padding: 20px;">';
						htmlTag += '<div class="pro_img"><img src="${pageContext.request.contextPath }/resources/imgs/goods/'+ reviewList.thumOriFilename +'" style="width: 60px; height: 60px; border-radius: 5px;"></div>';
						
						htmlTag += '<div class="pro_title" style="width: 560px; text-align: left;padding-left:20px">';
						htmlTag += '<div class="pro_name font-weight-bold">' + reviewList.productName + '</div>';
						htmlTag += 		'<div>' + reviewList.deliveryPick.substring(0,10)+ '  ' + reviewList.deliveryStatus + '</div>';
						htmlTag += '</div>';
						htmlTag += '<div class="review-deadline minusPoint" style="width: 135px; margin-top: 20px; margin-right:20px;"></div>';
				
						htmlTag += '<div class="write_review" style="margin-top: 13px;">'
					            	+ '<button type="button" class="trigger btn font-weight-bold reviewMdfyBtn" id = "writeReviewBtn" data-toggle="modal" data-target="#wtReviewModal'+index+'" style="border: 1px solid lightgray; width: 100px; height: 36px; font-size: small; color: #666666;">후기수정</button>'
				            	+ '</div>';
						htmlTag += '</li>';
						htmlTag += '</div>';
					
					
					 <!-- 작성한 모달창 시작 The Modal -->
						htmlTag += '<div class="modal fade" id="wtReviewModal'+index+'">';
						htmlTag += '<div class="modal-dialog modal-dialog-centered">';
						htmlTag += '<div class="modal-content">';
						htmlTag += '<div class="modal-header">';
						htmlTag += '<h4 class="modal-title">작성한 후기</h4>';
						htmlTag += '<button type="button" class="close" data-dismiss="modal">&times;</button>';
						htmlTag += '</div>';
						
						htmlTag += '<div class="modal-body">';
						
						htmlTag += '<form name="mdfyReviewFrm" id="mdfyReviewFrm" method="post" style="margin: 0px;">';
						htmlTag += '<input type="hidden" name="reviewNum" id="reviewNum" value="'+reviewList.reviewNum+'">';
						htmlTag += '<input type="hidden" name="orderNum" id="orderNum" value="'+reviewList.orderNum+'">';
						htmlTag += '<input type="hidden" name="productNum" id="productNum" value="'+reviewList.productNum+'">';
						htmlTag += '<input type="hidden" name="memberNum" id="memberNum" value="'+reviewList.memberNum+'">';
						
						htmlTag += '<div class="productInfo d-flex align-content-between" style="margin-bottom: 20px;">';
							htmlTag += '<div class="writeProImg" style="border:none;margin: 0px 20px"><img src="${pageContext.request.contextPath }/resources/imgs/goods/'+ reviewList.thumOriFilename +'" style="width: 60px; height: 60px; border-radius: 5px;"></div>';
							htmlTag += '<div class="writeProName">'+ reviewList.productName + '</div>';
						htmlTag += '</div>';
						
						htmlTag += '<div class="writeArea d-flex">';
							htmlTag += '<div>'
						htmlTag += 		'<label for="R_content"style="width: 80px; text-align: left;  margin: 0px; margin-right: 20px;" >내용</label> ';
							htmlTag += '</div>';
						
						htmlTag += '<div>'
							htmlTag += '<textarea type="text" id="writtenReview" name="R_content" style="background-color:white;" readonly>'+ reviewList.rContent +'</textarea>';
						htmlTag += '</div>';
						htmlTag += '</div>';
						
						htmlTag += '<div class="filebox d-flex align-content-between" style="margin-top:20px">';
						htmlTag += '<div style="width: 100px; text-align: left; margin-top: 15px;">사진첨부</div>';
						
						htmlTag += '<div class="fileIconBox">';
						//htmlTag += '<img src="c:/Users/ITWILL/git/collabee/src/main/webapp/resources/imgs/review/'+ reviewList.rSysFilename +'" style="width: 60px; height: 60px; " alt="상품" >'
						//htmlTag += '<label for="file"><img src="https://cdn-icons-png.flaticon.com/512/1829/1829371.png" style="width: 60px; height: 60px; " alt="카메라" ></label>';
						htmlTag += '<label for="thumb"><img class="thumb" src="${pageContext.request.contextPath }/resources/imgs/member/blankBox.PNG" style="width: 60px; height: 60px;"></label>';
						htmlTag += '</div>';
						
						//htmlTag += '</div>';
						
						//htmlTag += '</div>';
						
		
						
						//htmlTag += '<div><input type="file" id="file" onchange="setThumbnail(event)"></div>';
						
						htmlTag += '<div class="buttonBox" style="text-align: center; margin-left:60px">';
						htmlTag +=  '<input type="button" id="write_review" value="수정하기" onclick="modifyReview()"> ';
						htmlTag +=  '<input type="button" id="write_review" value="저장하기" onclick="saveReview()"> ';
						htmlTag += '</div>';
						
						htmlTag += '</form>';
						htmlTag += '</div>'; //modalbody
						
						/* htmlTag += '<div class="modal-footer">'
								//+  '<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'
						     	+  '</div>'; */
						htmlTag += '</div>';
						htmlTag += '</div>';
						htmlTag += '</div>';
						htmlTag += '</div>';
					});
					
				}
				$("#writeReviewArea").html(htmlTag);
				$("#writeReviewCnt").html(writeReviewCnt);
			},
			erroer: function(){
				alert("작성한리뷰목록불러오기 실패");
			}
		}); //ajax끝 
   }
   
}); //onload;
   
  
   
	$(document).on("click", ".reviewMdfyBtn", function () {
		//alert("리뷰수정 클릭")	
		
	});
    
	
	//썸네일 이미지 변경
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
		    var img = $(".thumb");
		    img.setAttribute("src", event.target.result); //이미지 주소를 변경해줌
		    };
		reader.readAsDataURL(event.target.files[0]);
	}
	 
	function writeProReview() {
		//alert("리뷰 작성 실행");	
		var reviewFrm = document.getElementById("reviewFrm");
		reviewFrm.action = "writeProReview.do";
		reviewFrm.submit();		
	 }
	
	function modifyReview(){
		//수정활성화
		$('#writtenReview').removeAttr('readonly'); 
		$('#writtenReview').css('border', '3px solid #692498')
	}
	
	function saveReview(){
		//alert("리뷰 수정 실행");	
		mdfyReviewFrm = document.getElementById("mdfyReviewFrm");
		mdfyReviewFrm.action ="modifyProReview.do";
		mdfyReviewFrm.submit();
	}
</script> 

<style>
  /* -------------------------------------  */
  	.hide {
  		display: none;
  	}
       /* 리뷰창 제목 */
    .proReviewTitle{
      text-align: left;
      margin: 20px 0px 30px 0px;
    }
     label { 
         display: block; 
         margin-top: 20px; 
         letter-spacing: 2px; 
     } 
     form { 
      margin: 0 auto; 
      width: 100%; 
     } 
     input, textarea { 
         width: 439px; 
         height: 27px; 
         background-color: #efefef; 
         border-radius: 6px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
     } 
    input:focus, textarea:focus{ 
        border: 1px solid #97d6eb; 
    } 
    /*리뷰 내용 적는 부분*/
     textarea {
      width: 530px;
      height: 157px;
      resize: none;
      padding: 15px 16px;
    }
     #write_review{ 
         width: 127px; 
         height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #write_review:hover{ 
         color: #fff; 
         background-color: #692498; 
         opacity: 0.9; 
     } 
     #cancel { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #cancel:hover{ 
         color: #fff; 
         background-color: #692498; 
         opacity: 0.9; 
     }
    .review-modal { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 700px; 
         height: 550px; 
         border-radius: 0.5rem; 
     } 
     .close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
     } 
     .close-button:hover { 
         background-color: darkgray; 
     } 
     .show-modal { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .writeProImg {
        width: 60px;
        height: 60px;
        border: 1px solid #216282;
     }
    .writeProName{
        margin-top: 13px;
        font-weight: bold;
    }
    
    .filebox, .buttonBox {
      width: 100%;
    }
    /*  파일첨부 모양 바꾸기 */
    /*위치조정*/
    .fileIconBox {
      margin-left: 20px;
      margin-bottom: 10px;
    }
    /* 1. 인풋스타일 변경 */
    .filebox .upload-name {
        display: inline-block;
        height: 40px;
        padding: 0 10px;
        vertical-align: middle;
        border: 1px solid #dddddd;
        width: 78%;
        color: #999999;
    }
    /* 2. 라벨스타일변경 */
    .filebox label {
        background-image: '<i class="bi bi-camera"></i>';
    }
    /* 3. 기존 모양 없애기 */
    .filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }
  
</style>

</head>
 <body>
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
                    <h4 style="margin-right: 20px;">상품후기</h4>
                  </div>
                  <div>
                    <ul class="menuInfoList">
                      <li class="menuInfo">상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                      <li class="menuInfo">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이콜라비 내 <span class="highlight" href="/mypage/inquiry/list">1:1 문의</span>에 남겨주세요.</li>
                    </ul>
                  </div>
              </div>
            </div>
				
			<!-- 내용 -->	
			<div class="mypage-top4">
			
 			<!-- 버튼 메뉴 영역 -->
              <div role="tablist" aria-orientation="horizontal" class="d-flex align-content-between" data-reach-tab-list="">
                <button class="reviewBtn chk " id="beforeWrite" type="button">작성 가능 후기</button>
                <button class="reviewBtn chk " id="written" type="button">작성한 후기</button>
              </div>
              
              
              
            <!-- 작성가능 후기 영역 (tab1)-->
            <div class="beforeWriteArea hide">
              
                <div class="d-flex align-content-lg-between" style="padding:10px 0px; border-bottom: 1px solid black;">
                  <div style="width: 780px; font-weight: bold;">총 <span id="reviewCnt"></span>개</div>                
                  <div style="float: right; color: #666666; font-size: small; margin-top: 5px; font-weight: bold;"><a>작성시 유의사항<i class="bi-question-circle"></i></a></div> <!--클릭시 모달창-->
                </div>
			
			 <div id="reviewArea">
				<!-- 작성가능 후기 -->
			 </div> 
			
			</div> <!-- beforeWriteArea -->
			
             
             <!-- !!!작성한 후기 영역(tab2) -->
              <div class="writtenArea hide">
               <div class="d-flex align-content-lg-between" style="padding:10px 0px; border-bottom: 1px solid black;">
                 <div style="width: 780px; font-weight: bold;">총 <span id="writeReviewCnt"></span>개</div>                
                 <div style="float: right; color: #666666; font-size: small; margin-top: 5px; font-weight: bold;"><a>작성시 유의사항<i class="bi-question-circle"></i></a></div> <!--클릭시 모달창-->
               </div>
               
               <div id="writeReviewArea">
              <!-- 작성한 후기 -->
               </div><!-- writeReviewArea 반복종료 -->
            
             </div> <!-- writtenArea 닫힘 -->
         
           

			</div>	   <!-- mypage-top4 -->
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