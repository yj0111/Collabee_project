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

    .table {
      width: 100%;
      text-align: center;
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

    .notice_btn {
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
		<%@ include file = "../admin/adminSideNav.jspf" %>
      </div>
      <div class="col-sm-6">
        <div class="main" style="border-bottom:2px solid black">
          <h4>자주하는 질문 등록</h4>
        </div>
        <div>
          <form name="frm" method="post" enctype="multipart/form-data">
          <table class="table">
              <thead>
                <tr style="height: 60px;">
                  <th style="width: 10%; vertical-align: middle; border-color: white;">제목</th>
                  <th style="vertical-align: left; border-bottom-color: white;">
                    <input type="text" class="title" name="faqTitle" placeholder=" 제목을 입력하세요.">
                  </th>
                </tr>
                <tr>
                  <th style="width: 10%; vertical-align: middle; border-color: white;">카테고리</th>
                  <th style="vertical-align: left; border-bottom-color: white;">
                    <select class="form-control" name="faqType">
                      <option value="회원">회원</option>
                      <option value="상품">상품</option>
                      <option value="주문/결제">주문/결제</option>
                      <option value="배송">배송</option>
                      <option value="쿠폰/적립금">쿠폰/적립금</option>
                    </select>
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="font-weight: bolder;">내용</td>
                  <td>
                    <textarea class="form-control" rows="18" id="comment" name="faqContent"
                      placeholder="내용을 입력하세요."></textarea>
                    <span style="color:#aaa; float: right;" id="counter">(0 /2000자)</span>
                  </td>
                </tr>
              </tbody>
         	 </table>
          <div style="text-align: right;">
            <button class="back_btn" type="button" onclick="location.href='faq_admin.do'">취소</button>
            <button class="notice_btn" type="button" onclick="check_faq()">등록</button>
          </div>
        </form>
        </div>
      </div>
    </div>
    <div class="col-sm-2"></div>
  </div>
</body>
<!-- footer-->
 <footer>
   <%@ include file = "../common/footer.jspf" %>	
 </footer>
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
  function check_faq() {
    var frm = document.frm;
    console.log(frm);
    if (frm.faqTitle.value == "" || frm.faqContent.value == "") {
      if (frm.faqTitle.value == "") {
        alert("제목를 입력해주세요.");
      } else if (frm.faqContent.value == "") {
        alert("내용을 입력해주세요.");
      }
      return false;
    } else {
      	 frm.action="insertFaq.do"
      	 frm.submit();
    }
  }
</script>

</html>