<%@page import="java.util.ArrayList"%>
<%@page import="notice.model.vo.Notice"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
     
        %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>공지사항</title>
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
            text-align: center;
        }
        .wrap{
            width: 1000px;
            /* border: 1px solid red; */
            margin: auto;
            font-family: 'NanumBarunGothic';
        }

        /* 헤더부분 */
        #filter{
            height: 40px; width: 500px;
        }
        #search{
            height: 40px; 
            /* border: 1px solid red; */
        }
        #search>form{height: 100%;}
        #header{display: inline-block;}
        #header>div{float: left;}
        select{
            border: 1px solid gray;
            border-radius: 3px;
            width: 130px;
            height: 100%;
            font-size: 14px;
            margin-right: 5px;
            cursor: pointer;
            padding-left: 5px;
        }
        #box-search{
            border: 1px solid gray;
            border-radius: 3px;
            height: 100%;
            width: 250px;
        }
        form>*{float: left;}
        input[type=text]{
            margin-left: 10px;
            width: 190px; 
            margin-top: 10px; 
            border: none; 
            font-size: 13px;
        }
        .btn-secondary{
            width: 75px;
            height: 100%;
        }
        button>img{
            width: 25px;
            height: 25px;
        }
        .img-button{
            border: none;
            background-color: rgba(0, 0, 0, 0);
        }

        .list{
            width: 100%;
            height:100%
            /* border: 1px solid blue; */
            cursor: pointer;
        }

        .list>table{
            margin-top: 20px;
            margin-bottom: 30px;
            width: 100%;
            border-top: 1px solid gray;
            border-bottom: 1px solid gray;
        }
        .list tr{
            height: 50px;
            border-bottom: 1px solid lightgray;
        }
        .list-area>tbody>tr:hover{
            background-color: rgb(242, 242, 242);
            font-weight: bolder;
        }
        .paging-area>button{
            border: none;
            background-color: white;
            width: 35px;
            height: 35px;

        }
        
        h1{
            color: rgb(149, 193, 31);
            font-weight: bolder;
            margin: 100px;
            letter-spacing: 5px;
        }

        #searchimg{
            width: 20px;
            height: 20px;
        }

    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
            <h1 align="center">공지사항</h1>
            <br><br>
            <div id="header">
                <div id="filter">
                </div>
                <div id="search">
                        <form action="<%= contextPath %>/search.no" id="search-form" method="get">                        
                        <select name="searchCondition" id="search-select">
                            <option value="notice_title">글제목</option>
                            <option value="notice_writer">글쓴이</option>
                        </select>
                        
                            <div id="box-search">
                                <input type="text" id="insearch" name="searchKeyword" placeholder="검색어를 입력하세요">
                                <button type="submit" class="img-button">
                                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/board_top_search_btn.png" alt="" id="searchimg">
                                </button>
                            </div>
                        </form>
                    </div>
                    <!-- 현재 로그인한 사용자가 관리자일 경우 보여질 div -->
                    <% if(loginMember != null && loginMember.getUserId().equals("admin")) {%>
                        <div align="right" style="width: 85px;">
                            <a href="<%= contextPath %>/enrollForm.no" class="btn btn-m btn-secondary">글작성</a>
        <br><br>
        </div>
        <% } %>
            </div>
            <!-- db 가져와서 아래 div 부분 계속 생성되게 -->
            <div class="list">
                <table align="center" class="list-area">
                    <thead>
                        <tr align="center">
                            <th width="200">번호</th>
                            <th colspan="2" width="200">제목</th>
                            <th width="140">작성자</th>
                            <th width="110">작성일</th>
                            <th width="70">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- case1. 공지글이 없을 경우-->
                        <% if(list.isEmpty()) {%>
                            <tr>
                                <td colspan="5">존재하는 공지사항이 없습니다.</td>
                            </tr>
                            <%} else { %>
                                
                                <!-- case2. 공지글이 있을 경우 -->
                                <% for(Notice n : list) { %>
                                    <tr>
                                        <td width="80"><%= n.getNoticeNo() %></td>
                                        <td width="95">[ 공지 ]</td>
                                        <td align="left" style="padding-left: 10px;"><%= n.getNoticeTitle() %></td>
                                        <td><%= n.getNoticeWriter() %></td>
                                        <td><%= n.getCreateDate() %></td>
                                        <td><%= n.getCount() %></td>
                                    </tr>
                                    <% } %>
                                    <%} %>
                                    
                                </tbody>
                            </table>
                        </div>
                        
                    </section>
            <div class="paging-area" align="center">
                <button disabled> &lt; </button>
                <button style="border: 1px solid lightgray; font-weight: bolder;">1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button> &gt; </button>
            </div>
        </div>
    </div>
    
        <script>
    	$(function(){
    		$(".list-area>tbody>tr").click(function(){
  				const num = $(this).children().eq(0).text();

  			    location.href = '<%= contextPath %>/detail.no?num='+num;
    		})
    	})
    </script>

    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>