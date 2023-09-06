<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String findId = (String)request.getAttribute("findId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style>
    body{font-family: 'NanumBarunGothic';}

.inform{
    box-sizing: border-box;
    text-align: center;
    width: 1200px; 
    height: 500px;
    margin: auto; 
    margin-top: 100px;
    margin-bottom: 50px;
}
.inform p{
    text-decoration: none;
    color: black;
    font-size: 18px;
    font-weight: 600;
    margin-top: 40px;
    margin-bottom: 40px;
}
#btnId{
        width: 300px; 
        height: 46px; 
        font-size: 18px; 
        line-height: 46px;
        background-color: black; 
        color: white; 
        cursor: pointer; 
        margin-top: 20px; 
        font-family: 'NanumBarunGothic';
        border-radius: 3px;
}
</style>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="inform" style="text-align: center; " >
        <form action="<%= contextPath %>/loginView.me" method="post">
            <div>  
                <p>일치하는 아이디 목록입니다.</p>
                <p><%= findId %></p>
                <button type="submit" id="btnId">로그인 하러가기</button>
                <!-- <a href="<%= contextPath %>/loginView.me">로그인 하러가기</a> -->
                <!-- <button type="button" id="btnId"><a href="javascript:history.back();">뒤로 가기</a></button> -->
            </div>
        </form>
    </div>
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>