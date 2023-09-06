<%@page import="java.util.ArrayList"%>
<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Notice n = (Notice)request.getAttribute("n");
	// 글번호, 글제목, 내용, 작성자 아이디, 작성일
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
        /* border: 1px solid black; */
    }
    .wrap{
        width: 800px; 
        /* border: 1px solid red; */
        margin: auto;
        font-family: 'NanumBarunGothic';
    }
    #header, #bar {
        border: none;
        border-bottom: 2px solid lightgray;
        padding: 10px;
        padding-bottom: 7px;
        margin-top: 20px;
    }
    
    #header>*{margin: 15px;}
    #h_etc{margin-bottom: 2px;}
    #subject{font-size: 20px; color: rgb(149, 193, 31);}
    #title{font-size: 40px;}
    #writer{font-size: 20px;}
    #h_etc{font-style: 10px; color: gray;}

    #content{
        padding: 15px;
        padding-top: 30px;
        font-size: 20px;
        line-height: 35px;
        /* border: 1px solid black; */
        margin-bottom: 100px;
    }

    #h_etc>span, #bar>span, #cmt_etc>span{margin-right: 10px;}
    #comment{
        padding: 20px;
      
    }
    
    #comment-area1{
        border: none;
        background-color: rgb(244, 244, 244);
        padding: 10px;
        margin-top: 10px;
    }
    #comment-area1>*{margin: 5px;}
    #cmt_id{font-size: 15px; font-weight: bold;}
    #cmt_txt{margin-top: 10px; margin-bottom: 10px; font-size: 14px;}
    #cmt_etc{font-size: 12px; color: gray;}
    #comment-area2{
        border: 1px solid gray;
        border-radius: 5px;
        padding: 10px;
        margin-top: 10px;
        margin-bottom: 30px;
    }
    #cmt_btn{
        padding-right: 10px;
    }
    #cmt_btn>button{
        border: none;
        width: 60px;
        height: 30px;
        font-family: 'NanumBarunGothic';
    }

</style>
</head>
<body>
	
	<%@ include file = "../common/menubar.jsp" %>

    <div class="outer">
        <div class="wrap">
            <div id="header">
                <div id="subject">[ 공지 ]</div>
                <div id="title"><%= n.getNoticeTitle() %></div>
                <div id="writer"><%= n.getNoticeWriter() %></div>
                <div id="h_etc">
                    <span><%= n.getCreateDate() %></span>
                    <span><%= n.getCount() %></span>
                </div>
                
            </div>
            <div id="content">
			<%= n.getNoticeContent() %>
            </div>
            
    <div align="center">
        <a href="<%= contextPath %>/list.no" class="btn btn-sm btn-secondary" style="width: 90px; height: 35px; font-size: medium;">목록가기</a>
    	        <!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우 -->
        <% if(loginMember != null &&  n.getNoticeWriter().equals(loginMember.getUserId()) ){%>
        <a href="<%= contextPath %>/updateForm.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-warning" style="width: 90px; height: 35px; font-size: medium;">수정하기</a>
        <a href="<%= contextPath %>/delete.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-danger" style="width: 90px; height: 35px; font-size: medium;">삭제하기</a>

        <% } %>
    
    </div>
  </div>
 </div>
  <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>