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
      color: gray;
    }

    .main {
      padding-bottom: 24px;
      padding-top: 10px;
    }

    .table {
      width: 100%;
      text-align: center;
      border-color: white;
    }

    .title {
      width: 100%;
      vertical-align: middle;
      padding-bottom: 9px;
      border-color: lightgray;
      border-width: 1px;
    }

    .btn_list {
      padding-top: 45px;
    }

    .back_btn {
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
    }

    .inquiry_btn {
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
    }
  </style>
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
		<%@ include file = "../admin/userSideNav.jspf" %>
      </div>
      <div class="col-sm-6">
        <div class="main" style="border-bottom:2px solid black">
          <h4>1:1 문의</h4>
        </div>
        <div>
         <form name="frm" method="post" enctype="multipart/form-data">
          <table class="table">
              <thead>
                <tr>
                  <th style="width: 10%; vertical-align: middle; border-color: white;">유형</th>
                  <th style="vertical-align: left; width: 44%; border-bottom-color: white;">
                    <select class="form-control" name="inquiryType" onchange="categoryChange(this)">
                      <option>문의 유형을 선택해주세요.</option>
                      <option value="주문결제문의">주문/결제문의</option>
                      <option value="쿠폰적립금문의">쿠폰/적립금문의</option>
                      <option value="상품문의">상품문의</option>
                      <option value="배송문의">배송문의</option>
                      <option value="기타문의">기타문의</option>
                    </select>
                  </th>
                  <!--대분류 마다 소분류 다르게 표시-->
                  <th style="vertical-align: left;border-bottom-color: white;">
                    <select class="form-control" id="subtype" name="inquirySubType">
                      <option>세부유형을 선택해주세요.</option>
                    </select>
                  </th>
                </tr>
                <tr style="height: 60px;">
                  <th style="width: 10%; vertical-align: middle; border-color: white;">제목</th>
                  <th colspan="2" style="vertical-align: left; border-bottom-color: white;">
                    <input type="text" class="title" name="inquiryTitle" placeholder=" 제목을 입력하세요.">
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="font-weight: bolder;">내용</td>
                  <td colspan="2">
                    <textarea class="form-control" rows="18" id="comment" name="inquiryContent"
                      placeholder="내용을 입력하세요."></textarea>
                    <span style="color:#aaa; float: right;" id="counter">(0 /2000자)</span>
                  </td>
                </tr>
                <tr>
                    <td style="font-weight: bolder;">첨부파일</td>
                    <td colspan="2" style="font-size: 13px;">
                   <div><input type="file" id="file"></div>
                    </td>
                </tr>
              </tbody>
	         </table>
            </form>
          <div style="text-align: right;">
            <button class="back_btn" type="button" onclick="location.href='inquiry.do'">취소</button>
            <button class="inquiry_btn" type="button" onclick="check_inquiry()">등록</button>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-2"></div>
  </div>
<!-- footer-->
     <footer>
       <%@ include file = "../common/footer.jspf" %>	
     </footer>    
</body>
<script>
  //textarea 글자수 제한
  $('.form-control').keyup(function (e) {
    var content = $(this).val();
    $('#counter').html("(" + content.length + "자 / 2000자)");    //글자수 실시간 카운팅

    if (content.length > 2000) {
      alert("최대 2000자까지 입력 가능합니다.");
      $(this).val(content.substring(0, 2000));
      $('#counter').html("(2000 / 2000자)");
    }
  });

  //제목,내용 미입력시 알림
  function check_inquiry() {
    var frm = document.frm;
    console.log(frm);
    if (frm.inquiryTitle.value == "" || frm.inquiryContent.value == "") {
      if (frm.inquiryTitle.value == "") {
        alert("제목를 입력해주세요.");
      } else if (frm.inquiryContent.value == "") {
        alert("내용을 입력해주세요.");
      }
      return false;
    } else {
      	frm.action="insertInquiry.do?memberNum=${loginMember.memberNum}"
      	frm.submit();
    }
  }
  
  function categoryChange(e) {
		var subtype_주문결제문의 = ["주문취소 해주세요 ", "주문/결제는 어떻게 하나요? ", "오류로 주문/결제가 안돼요"];
		var subtype_쿠폰적립금문의 = ["적립금 관련 문의드려요", "증정품 관련 문의드려요", "할인 관련 문의드려요"];
		var subtype_상품문의 = ["상품에 대해 알려주세요", "불량상품 환불 해주세요", "파손상품 환불 해주세요"];
		var subtype_배송문의 = ["상품이 다른 곳으로 갔어요", "배송 상품이 안 왔어요", "배송정보 변경 해주세요" ,"배송비에 대해 궁금합니다"];
		var subtype_기타문의 = ["로그인/회원 문의하고싶어요", "이용 중 오류가 발생했어요", "콜라비에게 제안하고 싶어요"];
		var target = document.getElementById("subtype");

		if(e.value == "주문결제문의") var d = subtype_주문결제문의;
		else if(e.value == "쿠폰적립금문의") var d = subtype_쿠폰적립금문의;
		else if(e.value == "상품문의") var d = subtype_상품문의;
		else if(e.value == "배송문의") var d = subtype_배송문의;
		else if(e.value == "기타문의") var d = subtype_기타문의;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>

</html>