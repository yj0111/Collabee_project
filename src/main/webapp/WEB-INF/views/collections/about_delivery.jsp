<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Collabee</title>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://kit.fontawesome.com/ae242928e2.js" crossorigin="anonymous"></script>
    
    <%@ include file = "../common/bootstrap.jspf" %>

<style>
        img{
            width: 100%;
        }
</style>
    
</head>

<body style="width:2000px; margin: auto; margin-top: 50px;">

    
    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>
    


    <img src="${pageContext.request.contextPath }/resources/imgs/info/lucifer/lucifer_info_1.png">
    <img src="${pageContext.request.contextPath }/resources/imgs/info/lucifer/lucifer_info_2.png">
    <img src="${pageContext.request.contextPath }/resources/imgs/info/lucifer/lucifer_info_3.png">
    <img src="${pageContext.request.contextPath }/resources/imgs/info/lucifer/lucifer_info_4.png">
    <img src="${pageContext.request.contextPath }/resources/imgs/info/lucifer/lucifer_info_5.png">
    


    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
    

</body>
</html>