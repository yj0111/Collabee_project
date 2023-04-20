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

    .inquiry {
      display: flex;
      width: 100%;
      border-bottom: 1px solid rgb(51, 51, 51);
      text-align: center;
      height: 61px;
    }

    .inquiry_top {
      padding: 10px;
      font-size: 11pt;
      vertical-align: middle;
      font-weight: bolder;
    }

    .card {
      border: white;
    }

    .card-header {
      background-color: white;
      height: 55px;
      padding-top: 13px;
    }

    .card-header a {
      color: black;
      text-decoration: none;
      vertical-align: middle;
    }

    .card-header span {
      text-align: center;
      font-size: 10.5pt;
    }

    .card-header:hover {
      color: black;
      text-decoration: none;
      background-color: white;
    }

    .card-body {
      border-top-color: white;
      background-color: #FEF7FF;
    }

    .title {
      width: 645px;
      display: inline-block;
    }

    .date {
      width: 150px;
      display: inline-block;
      color: darkgrey;
      font-weight: 600;
    }

    .state {
      width: 75px;
      display: inline-block;
      color: gray;
    }

    .i_type {
      font-size: 9pt;
      color: #rgb(152,152,152);
    }

    .i_title_icon {
      display: inline;
      font-size: 20pt;
      padding-top: 4px;
      padding-bottom: 10px;
    }

    .i_title {
      vertical-align: center;
      display: inline;
      font-size: 10pt;
      font-weight: bolder;
      padding-top: 4px;
      padding-bottom: 10px;
    }

    .i_answer_icon {
      display: inline;
      font-size: 20pt;
    }

    .i_answer {
      vertical-align: center;
      display: inline;
      font-size: 10pt;
      color: #rgb(152,152,152);
      font-weight: bolder;
    }

    .btn_list {
      padding-top: 45px;
    }

    .btn1 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn1:hover {
      border: solid 1px darkgray;
    }

    .btn2 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn2:hover {
      border: solid 1px darkgray;
    }

    .btns {
      text-align: center;
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
      float: right;
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
      <!-- 회원일때  --> 
		<c:if test="${loginMember.id ne 'admin'}"> 
		<%@ include file = "../admin/userSideNav.jspf" %>
        </c:if>
        <!-- 관리자일때 -->
        <c:if test="${loginMember.id eq 'admin'}"> 
		<%@ include file = "../admin/adminSideNav.jspf" %>
       </c:if>
       </div>
      <div class="col-sm-6">
        <div class="main" style="border-bottom:2px solid black">
          <h4>1:1 문의</h4>
        </div>
        <div>
          <div class="inquiry">
            <div class="inquiry_top" style="padding-top: 19px; width: 100%;">
              <div style="width: 645px; display: inline-block;">제목</div>
              <div style="width: 150px; display: inline-block;">작성일</div>
              <div style="width: 75px; display: inline-block;">답변상태</div>
            </div>
          </div>
          <div>
            <div id="accordion">     
                   
            <!-- 비회원 -->
        	<c:if test="${loginMember.id eq null && loginMember.id ne 'admin' }">
              <div class="card">
                <div class="card-header">
                  <a>
                    <span class="title">로그인 후 이용 가능합니다.</span>
                  </a>
                </div>
                </div>
			</c:if>
			
            <!-- 회원 -->
            <c:if test="${loginMember.id ne null && loginMember.id ne 'admin'}">
             	<c:if test="${not empty inquiryList }"> 
	           	<c:forEach varStatus="status" var="inquiry" items="${inquiryList }">
            	<c:if test ="${inquiry.memberNum == loginMember.memberNum}">
              <div class="card">
                <div class="card-header">
                  <a class="card-link" data-toggle="collapse" href="#collapseOne${status.index }">
                    <span class="title">${inquiry.inquiryTitle }</span>
                    <span class="date">${inquiry.inquiryDate }</span>
                    <span class="state">
                    <c:if test="${not empty inquiry.inquiryAnswer }"><p style="color:#692498; font-weight: bolder;">답변완료</p></c:if>
                     <c:if test="${empty inquiry.inquiryAnswer }">${inquiry.inquiryState }</c:if></span>
                  </a>
                </div>
                <div id="collapseOne${status.index }" class="collapse" data-parent="#accordion">
                  <div class="card-body">
                    <div class="i_type">${inquiry.inquiryType } > ${inquiry.inquirySubType }</div>
                    <div>
                      <div class="i_title_icon">
                        <i class="bi bi-person-circle"></i>
                      </div>
                      <div class="i_title">
                      <c:out value="${fn:replace(inquiry.inquiryContent, newline, '<br>')}" escapeXml="false"/>
                      </div>
                    </div>
                    <div>
                      <div class="i_answer_icon">
                        <i class="bi bi-chat-dots-fill"></i>
                      </div>
                      <div class="i_answer"><c:if test="${empty inquiry.inquiryAnswer }">답변이 등록되지 않았습니다.</c:if>
                      <c:if test="${not empty inquiry.inquiryAnswer }">
                      <c:out value="${fn:replace(inquiry.inquiryAnswer, newline, '<br>')}" escapeXml="false"/>
                      </c:if></div>
                    </div>
                  </div>
                </div>
                </div>
                </c:if>
             </c:forEach>
	        </c:if>  
             <c:if test="${empty inquiryList }"> 
               <div class="card-header">
                  <a>
                    <span class="title">${loginMember.name}님이 작성한 1:1 문의가 없습니다.</span>
                  </a>
                </div>
             </c:if>
            </c:if>
           
           <!-- 관리자  -->
           <c:if test="${loginMember.id eq 'admin'}">
             <c:if test="${not empty inquiryList }"> 
	           	<c:forEach varStatus="status" var="inquiry" items="${inquiryList }">
              <div class="card">
                <div class="card-header">
                  <a class="card-link" data-toggle="collapse" href="#collapseOne${status.index }">
                    <span class="title">${inquiry.inquiryTitle }</span>
                    <span class="date">${inquiry.inquiryDate }</span>
                    <span class="state">
                    <c:if test="${not empty inquiry.inquiryAnswer }"><p style="color:#692498; font-weight: bolder;">답변완료</p></c:if>
                     <c:if test="${empty inquiry.inquiryAnswer }">${inquiry.inquiryState }</c:if></span>
                  </a>
                </div>
                <div id="collapseOne${status.index }" class="collapse" data-parent="#accordion">
                  <div class="card-body">
                    <div class="i_type">${inquiry.inquiryType } > ${inquiry.inquirySubType }</div>
                    <div>
                      <div class="i_title_icon">
                        <i class="bi bi-person-circle"></i>
                      </div>
                      <div class="i_title">
                      <c:out value="${fn:replace(inquiry.inquiryContent, newline, '<br>')}" escapeXml="false"/>
                      </div>
                    </div>
                    <div>
                      <div class="i_answer_icon">
                        <i class="bi bi-chat-dots-fill"></i>
                      </div>
                      <div class="i_answer"><c:if test="${empty inquiry.inquiryAnswer }">답변이 등록되지 않았습니다.</c:if>
                      <c:if test="${not empty inquiry.inquiryAnswer }">
                      <c:out value="${fn:replace(inquiry.inquiryAnswer, newline, '<br>')}" escapeXml="false"/>
                      </c:if></div>
                      <!--관리자일때만-->
                      <c:if test="${loginMember.id eq 'admin'}"> 
                      <div style="text-align: right;">
                        <a href="admin_inquiry_answer.do?inquiryNum=${inquiry.inquiryNum }"
                          style="font-size:9pt; color: darkgray; text-decoration: none;">
                          	<c:if test="${empty inquiry.inquiryAnswer }">답변등록</c:if></a>
                        <a href="admin_inquiry_modify.do?inquiryNum=${inquiry.inquiryNum }"
                          style="font-size:9pt; color: darkgray; text-decoration: none;">
                          <c:if test="${not empty inquiry.inquiryAnswer }">답변수정</c:if></a>
                      </div>
                      </c:if>
                    </div>
                  </div>
                </div>
                </div>
             </c:forEach>
	        </c:if>  
             <c:if test="${empty inquiryList }"> 
               <div class="card-header">
                  <a>
                    <span class="title">관리자가 답변할 1:1 문의가 없습니다.</span>
                  </a>
                </div>
             </c:if>
            </c:if>
            </div>
            <div class="btn_list" style="padding-bottom: 60px;">
              <div class="btns">
                <button class="btn1" disabled>
                  <i class="bi bi-chevron-left"></i>
                </button>
                <button class="btn2">
                  <i class="bi bi-chevron-right"></i>
                </button>
                <c:if test="${loginMember.id ne null}"> 
                <c:if test="${loginMember.id ne 'admin'}"> 
                <button class="inquiry_btn" type="button" onclick="location.href='inquiry_write.do'">문의하기</button>
                </c:if>
                </c:if>
              </div>
            </div>
          </div>
          <div class="col-sm-2"></div>
        </div>
      </div>
</div>      
<!-- footer-->
     <footer>
       <%@ include file = "../common/footer.jspf" %>	
     </footer>
</div>       
</body>

</html>