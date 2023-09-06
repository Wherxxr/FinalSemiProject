<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
@font-face {
	font-family: 'NanumBarunGothic';
	src: url('/fonts/NanumBarunGothic.eot');
	src: url('/fonts/NanumBarunGothic.eot') format('embedded-opentype'),
		url('/fonts/NanumBarunGothic.woff') format('woff');
}

* {
	font-family: 'NanumBarunGothic';
}

div, form, input {
	box-sizing: border-box;
}

.wrap {
	width: 1200px;
	height: 1800px;
	margin: auto;
}

#content {
	width: 1000px;
	height: 1440px;
	margin: auto;
}



#title {
	width: 100%;
	height: 50%;
}

#title>* {
	width: 50%;
	height: 100%;
	float: left;
}

.titleprofile>img {
	margin-left: 10px;
	margin-top: 10px;
	border-radius: 50%;
	width: 150px;
	height: 150px;
}

.share>div {
	float: right;
}

.edit>button {
	width: 70px;
	height: 30px;
}

#user {
	height: 20%;
}

#content_2 {
	height: 30px;
}

.mpbookmark {
	font-size: 20px;
	font-weight: bold;
}

.mpbookmark::after {
	content: "";
	display: block;
	width: 150px;
	border-bottom: 2.5px solid rgb(149, 193, 31);
	margin: auto;
}

#content_3 {
	height: 300px;
	width: 800px;
	margin: auto;
}

#content_3 h3 {
	color: gray;
}

li>div {
	height: 350px;
}

#profileImage {
	width: 80px;
	height: 150px;
	float: left;
}

.profile-image {
	margin: 7px;
	border-radius: 50%;
	width: 50px;
	height: 50px;
}

.other {
	width: 720px;
	height: 150px;
	float: left;
}

.b-name {
	font-weight: 900;
	font-size: 20px;
}

.b-time {
	font-size: 13px;
	color: gray;
}

.b-course {
	font-size: 17px;
	font-weight: 700;
	color: rgb(83, 83, 83);
}

.b-content {
	font-size: 17px;
}

.b-image>img {
	width: 125px;
	height: 125px;
	padding: 5px;
}

.etc img {
	width: 40px;
	height: 40px;
}

.like, .bookmark {
	float: left;
	width: 50%;
}

.bookmark:hover, .item:hover {
	cursor: pointer;
}

.bookmark {
	text-align: right;
}

#topbtn {
	position: fixed;
	right: 24px;
	bottom: 24px;
	z-index: 50;
}


</style>
</head>

<body>
	<%@ include file="mypageheader.jsp"%>
	<div class="wrap">
		<div id="content">
			<%if (list.isEmpty()) {%>
			북마크한 게시물이 없습니다.
			<%} else {%>
			<br>
			<div>
				<p class="listCount">내 북마크글 (최근 5개글만 보입니다.)</p>
			</div>
			<br>
			
				<div class="bigCon">
                
				</div>
				
					<li>
						<div>
							<div id="profileImage">
								<img class="profile-image"
									src="<%=contextPath%>/<%=b.getProfileImg()%>" alt="">
							</div>
							<div class="other">
								<div class="b-name">
									<p style="margin: 0;">
										<%=b.getBoardWriter()%>
									</p>
								</div>
								<div class="b-time">
									<p>
										<%=b.getCreateDate()%>
									</p>
								</div>
								<div class="b-course">
									<p>인왕산 등산 코스 : 초보자가 선택했던 경복궁 코스</p>
								</div>
								<div class="b-content">
									<p>
										<%=b.getBoardContent()%>
									</p>

								</div>
								<br clear="right">
								<div class="etc">
									<div class="like">
										<img name="likey" class="item"
											src="https://cdn-icons-png.flaticon.com/512/14/14815.png"
											alt="" onClick="setLike()"> 좋아요
									</div>
									<div class="bookmark">
										<img
											src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHcKgGArmldqjLgZ3n2HIogmWevXJT4_SXbySqfjm2BGK3PXAWPoaKu0PdbbXUaQNzpUU&usqp=CAU"
											alt="공유"> <img name="icon_btn" class="item"
											src="https://cdn-icons-png.flaticon.com/512/1174/1174410.png"
											alt="북마크" onClick="setImg()"> <img
											src="https://cdn-icons-png.flaticon.com/512/7066/7066144.png"
											alt="설정">
									</div>
								</div>
							</div>
						</div>
					</li>
				</div>
					<%
					}
					%>
					<%
					}
					%>
			</ul>
		</div>
	</div>

	<div id="topbtn">
		<a href="#"><img
			src="https://blog.kakaocdn.net/dn/8Q2Lz/btrcOS9MCg8/GNshUKOnQXIjXq2nKhcYf1/img.png"
			style="width: 40px; height: 40px;"></a>
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
                    console.log(list);
					console.log("총 length" + list.length);
					listCount = list.length;
					toList = list;

					// 글 목록 불러오기 호출
					displayData(1, boardLimit);
					// 페이징 표시 호출
					paging(listCount, boardLimit, pageLimit, 1);
				},
				error : function() {
					console.log("실패@");
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
                console.log("실패");
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
                        console.log("ajax통신실패");
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

            for (let i = start; i < end; i++) {
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
	</script>
	<%@ include file = "../common/footerbar.jsp" %>
</body>

</html>