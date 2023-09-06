<%@page import="today.model.vo.Today"%>
<%@page import="java.util.ArrayList" %>
<%@page import="common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% PageInfo pi=(PageInfo)request.getAttribute("pi"); 
ArrayList<Today> list = (ArrayList<Today>)request.getAttribute("list");

        int currentPage = pi.getCurrentPage();
        int startPage = pi.getStartPage();
        int endPage = pi.getEndPage();
        int maxPage = pi.getMaxPage();
        %>
 <!DOCTYPE html>
 <html lang="en">

 <head>
     <title>오등완</title>
     <link rel="stylesheet"
         href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
     <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
         rel="stylesheet">
     <style>
         .outer {
             width: 1200px;

             margin: auto;
             margin-top: 50px;
             box-sizing: border-box;
             /* border: 1px solid black; */
         }

         .wrap {
             width: 1000px;

             /* border: 1px solid red; */
             margin: auto;
             font-family: 'NanumBarunGothic';
         }

         /* 헤더부분 */
         #filter {
             height: 40px;
             width: 500px;
         }

         #search {
             height: 40px;
             width: 500px;
             
             /* margin-bottom: 15px; */
             /* border: 1px solid black; */
         }

         #search>form {
             height: 100%;
         }

         #header {
             display: inline-block;
         }

         #header>div {
             float: left;
         }

         select {
             border: 1px solid gray;
             border-radius: 3px;
             width: 130px;
             height: 100%;
             font-size: 14px;
             margin-right: 5px;
             cursor: pointer;
         }

         #box-search {
             border: 1px solid gray;
             border-radius: 3px;
             height: 100%;
             width: 250px;
             
         }

         #search>* {
             float: right;
         }

         input[type=text] {
             margin-left: 10px;
             width: 190px;
             margin-top: 10px;
             border: none;
             font-size: 13px;
         }

         .btn-secondary {
             width: 100px;
             height: 100%;
             margin-left: 5px;
         }

         button>img {
             width: 25px;
             height: 25px;
         }

         .img-button {
             border: none;
             background-color: rgba(0, 0, 0, 0);
         }

         /*content부분*/
         .content {
             margin-top: 20px;
             width: 100%;
             height: 200px;
             /* border: 1px solid blue; */
         }

         .content>div {
             float: left;
         }

         .c1 {
             width: 25%;
             height: 100%;
             position: relative;
             /* border: 1px solid black; */
         }

         .c2 {
             width: 75%;
             height: 100%;
             /* border: 1px solid red; */
             padding: 20px;
             padding-bottom: 14px;
             background-color: rgb(244, 244, 244);
             border-radius: 5px;
         }

         .c1>img {
             /* width: 95%;  */
             /* height: 90%;  */
             position: absolute;
             top: 0;
             bottom: 0;
             left: 0;
             margin: auto;
         }

         .c2>table {
             width: 100%;
             height: 100%;
         }

         #c3 {
             width: 100%;
             height: 100%;
             /* border: 1px solid red; */
             padding: 20px;
             padding-bottom: 14px;
             background-color: rgb(244, 244, 244);
             border-radius: 5px;
         }

         #c3>table {
             width: 100%;
             height: 100%;
         }

         .btn-bmk {
             border: none;
             border-radius: 5px;
             background-color: rgb(149, 193, 31);
             color: white;
             width: 80px;
             height: 40px;
             font-size: 15px;
         }

         #filter>select,
         #search>select {
             font-size: 14px;
         }

         .list-area>tbody>tr:hover {
             background-color: gray;
             cursor: pointer;
         }

         .todayNo {
             display: none;
         }

         .todaycontent {

         
         width: 200px;
         overflow: hidden;
         text-overflow: ellipsis;
         display: -webkit-box;
         -webkit-line-clamp: 2;
         -webkit-box-orient: vertical;
         }

         #paging-area {
    display: inline-block;
    border: 1px solid #ccc;
    border-right: 0;
	padding-left :0;
    width: 1200px;
    margin: auto;
}
#paging-area li {
    text-align: center;
    float: left;
	list-style:none;

}

#paging-area li a {
    display: block;
    font-size: 14px;
	color: black;
    padding: 9px 12px;
    border-right: solid 1px #ccc;
    box-sizing: border-box;
	text-decoration-line:none;
}
     </style>
 </head>

 <body>
     <%@ include file="../common/menubar.jsp" %>
         <div class="outer">
             <div class="wrap">
                 <div id="header">
                     <div id="filter">
                         <select name="order" id="">
                             <option value="">최신글순</option>
                             <option value="">추천순</option>
                             <option value="">댓글순</option>
                             <option value="">조회순</option>
                         </select>
                     </div>

                     <div id="search">
                         <div id="box-search">
                             <input type="text" placeholder=" 검색어를 입력하세요" id="searchkeyword">
                             <button type="submit" class="img-button">
                                 <img src="../resources/img/search.png" alt="">
                                </button>
                                <!-- <button type="submit">검색</button> -->
                            </div>
                            <select name="" id="">
                                <option value="TTTC">제목+내용</option>
                                <option value="TT">글제목</option>
                                <option value="TW">글쓴이</option>
                                <option value="R">댓글내용</option>
                            </select>
                     </div>
                    </div>
                    <% if(loginMember != null) {%>
                       <a href="<%= contextPath %>/enrollForm.to" type="button"
                       class="btn btn-secondary" style="float: right;">글쓰기</a>
               <%} %>


            <div class="bigCon">
            </div>
            
            <div id="paging-area" align="center">
            </div>
            
         </div>
        <script>
        $(document).ready(function() {
            loadBoardData(1); 
            loadPagingData(1); 
        });

        // 게시글 불러오는 함수
        function loadBoardData(page) {
        $.ajax({
            url: "<%= request.getContextPath() %>/todayAjax.to", // Servlet URL로 수정
            type: "GET",
            data: { cpage: page }, // 파라미터 이름을 "cpage"로 수정
            success: function(data) {
                $(".bigCon").html(data); 
            },
            error: function() {
                console.log("게시글 데이터를 불러오는데 실패했습니다.");
            }
        });
    }
        // 페이징 바 불러오는 함수
        function loadPagingData(page) {
        $.ajax({
            url: "<%= request.getContextPath() %>/todayAjax.to", // Servlet URL로 수정
            type: "GET",
            data: { cpage: page }, // 파라미터 이름을 "cpage"로 수정
            success: function(data) {
                $("#paging-area").html(data); 
            },
            error: function() {
                console.log("페이징 데이터를 불러오는데 실패했습니다.");
            }
        });
    }
    </script>

 </body>

 </html>

 