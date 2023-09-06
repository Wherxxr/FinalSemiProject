<%@page import="qBoard.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Qna q= (Qna)request.getAttribute("q");
	// 글번호, 제목, 내용, 작성자, 작성일
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .outer{
            margin: auto;
        }
        #title{
            margin-top: 30px;
            width: 505px;
            height: 30px;
        }
        input::placeholder{
            text-align: center;
        }
        #content{
            margin-top: 10px;
        }
    </style>
</head>
  
<body>
	<body>

    <div class="outer" align="center">
    <%@ include file="../common/menubar.jsp" %>
    
    <form action = "<%=contextPath%>/qInsert.se" method="post">
	
    <input type="text" name="title" placeholder="문의사항 제목을 입력하세요" id="title"><br>
    <textarea name="content" id="content" cols="70" rows="17" style="resize: none;" required></textarea> <br>

    
    <button type="submit">등록하기</button>
    <button type="reset">초기화</button>
    <button type="button" onclick ="history.back();">뒤로가기</button>
    </form>
    
    <%@ include file ="../common/footerbar.jsp" %>
    </div>
</body>
</html>