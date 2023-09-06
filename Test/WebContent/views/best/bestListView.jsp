<%@page import="java.util.ArrayList"%>
<%@page import="board.model.vo.Board"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	Board bo = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>인기게시글</title>
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
            border: 1px solid black;
            text-align: center;
        }
        .wrap{
            width: 1000px;
            border: 1px solid red;
            margin: auto;
            font-family: 'NanumBarunGothic';
        }

        input[type=text]{
            margin-left: 10px;
            width: 190px; 
            margin-top: 10px; 
            border: none; 
            font-size: 13px;
        }

        .b_list{
            width: 100%;
        }

        ul>li{
            list-style: none;
        }

    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
            <!-- db 가져와서 아래 div 부분 계속 생성되게 -->
            <div class="b_list">
            <!-- case1. 인기글이 없을 경우-->
                <% if(list.isEmpty()) {%>
                    <ul>
                        <li colspan="5">존재하는 게시글이 없습니다.</li>
                    </ul>
                    <%} else { %>
            <!-- case2. 인기글이 있을 경우 -->
                <% for(Board best : list) { %>
                    <ul>
                        <li align="left"><%= best.getBoardTitle() %></li>
                    </ul>
                    <% } %>
                    <% } %>
            </div>
        </div>
    </div>

    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>