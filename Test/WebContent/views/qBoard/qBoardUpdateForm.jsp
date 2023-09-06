<%@page import="qBoard.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String contextPath = request.getContextPath();
    Qna q = (Qna)request.getAttribute("q");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정폼</title>
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

 <%@ include file="../common/menubar.jsp" %>
 <br><br><br><br>
	<div class="outer">
        <br>
        <h2 align="center">문의글 수정하기</h2>
        <br>

        <form id="update-form" action="<%=contextPath %>/qUpdate.se" method="post">
        <input type="hidden" name="qno" value ="<%=q.getqNo()%>"/>
			<!-- 카테고리번호, 제목, 내용, 첨부파일 한개, 게시글 번호-->
            	<table align="center">
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required value="<%= q.getqTitle()%>"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" rows="10" style="resize: none;" required><%= q.getqContent() %></textarea></td>
                </tr>
               

            </table>

            <div align="center">
                <button type="submit">수정하기</button>
                <button type="reset">취소하기</button>
            </div>

        </form>
	<br><br><br><br>
<%@ include file ="../common/footerbar.jsp" %>


</body>
</html>