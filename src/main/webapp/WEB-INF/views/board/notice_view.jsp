<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet> pageContext.setAttribute("newline", "\n"); </jsp:scriptlet>        
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title>콜라비</title>
  <%@ include file= "../common/bootstrap.jspf"%>
  <style>
    h4 {
      font-weight: bolder;
      font-size: 28px;
    }

    p {
      vertical-align: middle;
      font-size: 14px;
    }

    .table {
      width: 100%;
      text-align: center;
      border: black;
    }

    tbody {
      border-bottom: 1px solid rgb(244, 244, 244);
    }

    tbody td {
      height: 50px;
      font-size: 14px;
      font-weight: bolder;
    }

    tfoot td {
      font-size: 14px;
      text-align: left;
      letter-spacing: -0.8px;
      word-spacing: 2px;
      font-weight: 500;
    }

    .date {
      color: gray;
    }

    .main {
      padding-bottom: 24px;
      padding-top: 10px;
      text-align: center;
    }

    .modify_btn {
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

    .delete_btn {
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

    .list_btn {
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
      float: right;
    }

    /* body{
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-use-select: none;
      user-select: none;
      } */
  </style>
  <script>
    function notice_delete() {
      if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
    	location.href="deleteNotice.do?noticeNum=${notice.noticeNum }"//공지사항 삭제 요청
      } else {   //취소
        return false;
      }
    }
  </script>
</head>

<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
  <div class="container-fluid">
    <!-- header -->
    <header>
      <%@ include file = "../common/header.jspf" %>
    </header>
    
	<!-- 유정 -->
    <div class="row" style="padding-top:50px; padding-bottom: 50px">
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
        <div class="main" style="border-bottom:2px solid black">
          <h4>공지사항 </h4>
          <p style="color: darkgrey; font-weight: bolder;"> 콜라비의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요</p>
        </div>
        <div>
          <table class="table">
            <tbody>
              <tr>
                <td class="tbody_td" style="width: 10%; background-color: #FEF7FF; vertical-align: middle; text-align: left; padding-left: 20px;">
                	제목</td>
                <td style="text-align: left; vertical-align: middle; letter-spacing: -1px; padding-left: 20px;">
                	${notice.noticeTitle }</td>
              </tr>
              <tr>
                <td class="tbody_td" style="width: 10%; background-color: #FEF7FF; vertical-align: middle; text-align: left; padding-left: 20px;">
                  	작성자</td>
                <td style="text-align: left; vertical-align: middle; letter-spacing: -1px; padding-left: 20px;">
                	콜라비</td>
              </tr>
              <tr>
                <td class="tbody_td" style="width: 10%; background-color: #FEF7FF; vertical-align: middle; text-align: left; padding-left: 20px;">
                  	작성일</td>
                <td class="date"style="text-align: left; vertical-align: middle; letter-spacing: -1px; padding-left: 20px;">
                ${notice.noticeDate }</td>
              </tr>
            </tbody>
            <tfoot>
              <tr style="border-top: 2px solid #FEF7FF;">
                <td colspan="2" style="padding-top: 25px; padding-bottom: 50px;">
                 	<c:out value="${fn:replace(notice.noticeContent, newline, '<br>')}" escapeXml="false"/>
                </td>
              </tr>
            </tfoot>
          </table>
        </div>
        <c:if test="${loginMember.id eq 'admin'}">
        <button class="modify_btn" type="button" onclick="location.href='notice_modify.do?noticeNum=${notice.noticeNum }'">수정하기</button>
        <button class="delete_btn" type="button" onclick="notice_delete()">삭제하기</button>
        </c:if>
        <button class="list_btn" type="button" onclick="location.href='notice.do'">목록</button>
      </div>
    </div>
    <div class="col-sm-2"></div>
  </div>
 <!-- footer-->
     <footer>
       <%@ include file = "../common/footer.jspf" %>	
     </footer>  
</body>
</html>