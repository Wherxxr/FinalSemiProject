<%@page import="today.model.vo.Today"%>
<%@page import="java.util.ArrayList" %>
<%@page import="common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
            text-align: center;
            display: inline-block;
            border: 1px solid #ccc;
            border-right: 0;
            padding-left :0;
            
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
        #paging-area li a:hover {
         cursor: pointer;
        }
        #title {
            color: rgb(149, 193, 31);
            font-weight: bolder;
            margin: 70px;
            letter-spacing: 5px;
        }
     </style>
 </head>

 <body>
     <%@ include file="../common/menubar.jsp" %>
         <div class="outer">
             <div class="wrap">
                <h1 align="center" id="title">오등완 💪</h1>
                 <div id="header">
                     <div id="filter">
                    <select name="order" id="sort">
                        <option value="date">최신글순</option>
                        <option value="like">추천순</option>
                        <option value="reply">댓글순</option>
                        <option value="count">조회순</option>
                    </select>
                </div>

                <div id="search">
                    <% if(loginMember != null) {%>
                        <a href="<%= contextPath %>/enrollForm.to" type="button"
                        class="btn btn-secondary" style="float: right;">글쓰기</a>
                <%} %>
                    <div id="box-search">
                        <input type="text" placeholder=" 검색어를 입력하세요" id="searchkeyword">
                        <button type="submit" class="img-button">
                            <img src="resources/image/search.png" alt="">
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


            <div class="bigCon">
                
             </div>



            <div align="center">
                <div id="paging-area" align="center">
                
                </div>
            </div>
        </div>
    </div>
        <script>
       let listCount; // 총 게시글 수
		let boardLimit = 5; // 한 페이지내에 보여질 게시글 최대 개수
		let pageLimit = 5; // 페이징 최대개수
		let globalCurrentPage = 1; // 현재 페이지
		let dataList; // 데이터 리스트


		$(function() {
			// list 불러오기
			$.ajax({
				url : "today.to",
				success : function(list) {
                    (list);
					("총 length" + list.length);
					listCount = list.length;
					toList = list;

					// 글 목록 불러오기 호출
					displayData(1, boardLimit);
					// 페이징 표시 호출
					paging(listCount, boardLimit, pageLimit, 1);
				},
				error : function() {
					
				}

			});


		})
        $("#sort").on("change",function(){

        $.ajax({
            url:"sort.to",
            data:{option:$(this).val()},
            success:function(list){
                listCount = list.length;
                toList = list;

                // 글 목록 불러오기 호출
                displayData(1, boardLimit);
                // 페이징 표시 호출
                paging(listCount, boardLimit, pageLimit, 1);
                
            },
            error:function(){
                ;
            }
        })
        })
        $(function () {
            $(".img-button").click(function () {
                $.ajax({
                    url: "search.to",
                    data: {
                        option: $("#search>select").val(),
                        keyword: $("#searchkeyword").val()
                    },
                    success: function (list) {
                        listCount = list.length;
                        toList = list;
                        displayData(1, boardLimit);
                
                        paging(listCount, boardLimit, pageLimit, 1);
                       
                    }, error: function () {
                        ("ajax통신실패");
                    }
                })
            })
        });
        function displayData(currentPage, boardLimit) {

        let tohtml = "";

        currentPage = Number(currentPage);
        boardLimit = Number(boardLimit);

        let start = (currentPage - 1) * boardLimit;
        let end = (currentPage - 1) * boardLimit + boardLimit;

        // 오늘날짜
        let today = new Date();
        let year = today.getFullYear();
        let month = ('0' + (today.getMonth() + 1)).slice(-2);
        let day = ('0' + today.getDate()).slice(-2);			
        let dateString = year + '/' + month  + '/' + day;
       
            for (let i = start; i < end  && i < toList.length; i++) {
                tohtml += "<div class='content'>" +
                            "<div class='c1'>" +
                            "<img width='230' height='190'src=" + toList[i].titleImg + "></div>" +
                            "<div class='c2'>" +
                            "<table class='list-area' border=0>" +

                            "<td class='todayNo'>"+toList[i].todayNo+"</td>" + 

                            "<tr height='25%' style='font-size: 20px;'>" +
                            "<th colspan='2' class='title'>" +
                                    toList[i].todayTitle +
                            "</th></tr>" +
                            "<tr style='font-size: 15px;'>" +
                            "<td colspan='2' class='todaycontent'>" +
                                    toList[i].todayContent +
                            "</td></tr>" +
                            "<tr height='15%' style='font-size: 13px; color: gray;'>"+
                            "<td>조회수 <span>" +
                                toList[i].count + "</span>" +
                            "좋아요 <span>"+toList[i].countLike+"</span> </td>" +
                            "</tr></table></div></div>";

            }

			$(".bigCon").html(tohtml);
            $(".todaycontent *").removeAttr("style");
            $(".todaycontent *").removeAttr("color");
		}
		
		function paging(listCount, boardLimit, pageLimit, currentPage){
			
			
			maxPage = Math.ceil(listCount/boardLimit); // 총 페이징 수
			
			
			if(maxPage < pageLimit){
				pageLimit = maxPage;
			}
			
			let pageGroup = Math.ceil(currentPage/pageLimit);
			
			
			let last = pageGroup * pageLimit;
			
			if(last > maxPage){
				last = maxPage;
			}
			
			let first = last - (pageLimit -1); // 화면에 보여질 첫번째 페이지 번호
			let next = last + 1;
			let prev = first -1;

			let pageHtml = "";
			
			if(prev > 0){
				
				pageHtml += "<li><a id='prev'>이전</a></li>";			
			}
			
			for(let i=first; i<=last; i++){
				if(currentPage == i){
					pageHtml += "<li><a id='"+ i +"'>" + i + "</a></li>";
				}else{
					pageHtml += "<li><a id='"+ i +"'>" + i + "</a></li>";
				}
			}
			
			if(last < maxPage){
				
				pageHtml += "<li><a id='next'>다음</a></li>";	
			}
			
			$("#paging-area").html(pageHtml);
			
			// 페이징 번호 클릭 이벤트
			$("#paging-area").children("li").children("a").click(function(){
				
				let $id = $(this).attr("id");
				selectedPage = $(this).text();
				
				
				if($id == "next"){
					selectedPage = next;
				}
				if($id == "prev"){
					selectedPage = prev;
				}
				
				globalCurrentPage = selectedPage;
				
				paging(listCount, boardLimit, pageLimit, selectedPage);
				
				displayData(selectedPage, boardLimit);
			});
			
		}
             
             
        
      
        $(document).on("click", ".bigCon .content", function () {
           location.href = '<%= contextPath %>/detail.to?bno=' + $(this).find(".todayNo").text();

        
        });
        
    </script>
<%@ include file = "../common/footerbar.jsp"%>
 </body>

 </html>