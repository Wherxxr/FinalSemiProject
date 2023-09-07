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
	height: 100%;
	margin: auto;
}

#content {
	width: 1000px;
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
	#bar>button{
		border: none;
		background-color: rgba(0, 0, 0, 0);
		font-size: 14px;
	}
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
	.todayNo {
		display: none;
	}
	.listCount{
            text-align: left;
            color: gray;
            margin: 15px 0px 10px 130px;
            font-size: large;
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
	.content:hover{
		cursor: pointer;
	}
</style>
</head>

<body>
	<%@ include file="mypageheader.jsp"%>
	<div class="wrap">
		<div id="content">
			<br>
			<div>
				<p class="listCount"></p>
			</div>
			<br>
			<div class="bigCon">

			</div>
			<div align="center">
                <div id="paging-area" align="center">
                
                </div>
            </div>
					
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
				url : "bookmark.me",
				data : {userNo:<%= loginMember.getUserNo()%>},
				success : function(list) {
                    (list);
					("총 length" + list.length);
					listCount = list.length;
					toList = list;

					// 글 목록 불러오기 호출
					displayData(1, boardLimit);
					paging(listCount, boardLimit, pageLimit, 1);
				},
				error : function() {
					
				}

			});


		})
       
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

            for (let i = start; i < end && i < toList.length; i++) {

				
                tohtml += "<div class='content'>" +
							"<div class='c1'>";

				if (toList[i].titleImg != "/") {
					tohtml += "<img width='230' height='190' alt='사진이 없는 게시글입니다.' src=" + toList[i].titleImg + "></div>";
				} else {
					// 사진이 없을 경우 대체 내용 추가
					tohtml += "<div class='no-image-div'>사진이 없는 게시글입니다.</div></div>";
				}

				tohtml += "<div class='c2'>" +
					"<table class='list-area' border=0>" +
					"<td class='todayNo'>" + toList[i].todayNo + "</td>" +
					"<tr height='25%' style='font-size: 20px;'>" +
					"<th colspan='2' class='title'>" +
					toList[i].todayTitle +
					"</th></tr>" +
					"<tr style='font-size: 15px;'>" +
					"<td colspan='2' class='todaycontent'>" +
					toList[i].todayContent +
					"</td></tr>" +
					"<tr height='15%' style='font-size: 13px; color: gray;'>" +
					"<td>조회수 <span>" +
					toList[i].count + "</span>" +
					"좋아요 <span>" + toList[i].countLike + "</span> </td>" +
					"</tr></table></div></div>";
            }
			$(".listCount").html("내가 북마크한 글 " + listCount + "개");
			$(".bigCon").html(tohtml);
            $(".todaycontent *").removeAttr("style");
            $(".todaycontent *").removeAttr("color");
		}
	
	$(document).on("click", ".bigCon .content", function () {
    let todayNo = $(this).find(".todayNo").text();
    let fileLevel = toList.find(item => item.todayNo === todayNo).fileLevel;
    let url;
    
    if (fileLevel === 1) {
    url = '<%= contextPath %>/detail.to?bno=' + todayNo;
	} else if (fileLevel === 2 || fileLevel === 0) {
		let boardNo = todayNo.substring(1);
		url = '<%= contextPath %>/detail.bo?bno=' + boardNo;
	}
    if (url) {
        location.href = url;
    }
	})
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
	</script>
	<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>