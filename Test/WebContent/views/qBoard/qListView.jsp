<%@page import="qBoard.model.vo.Qna"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inquiries</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

<style>
/* div {border: 1px solid red; box-sizing: border-box;} */
.wrap {
	margin: auto;
	width: 1000px;
	font-family: 'NanumBarunGothic';
}

.qna {
	font-weight: 600;
	color: rgb(71, 71, 71);
}

.qna, .myqna {
	text-align: center;
}

.qnalist button {
	width: 290px;
}

.add-button {
	width: 150px;
	height: 30px;
	color: rgba(240, 255, 255, 0.916);
	background-color: rgb(149, 193, 31);
	border: none;
}

.qna button:hover {
	background-color: rgba(159, 218, 145, 0.506);
}

.myqnalist {
	width: 100%;
	border-collapse: collapse;
}

.myqnalist th, .myqnalist td {
	border: 1px solid black;
	padding: 8px;
	text-align: center;
}

.qnalist button {
	margin-top: 10px;
	border-color: rgba(224, 224, 224, 0.184);
}

.myqnalist th {
	background-color: rgb(215, 215, 215);
	border: 1px solid gray;
	padding: 4px 8px;
	text-align: center;
	font-size: 12px;
	line-height: 15px;
}

.myqnalist td {
	border: 1px solid grey;
	padding: 4px 8px;
	text-align: center;
	font-size: 15px;
	line-height: 20px;
}

.myqnalist tr:hover {
	background-color: #e0e0e02f;
}

#content1, #content2, #content3, #content4 {
	display: none;
	font-size: 14px;
	font-weight: 100;
}
</style>
</head>
<body>
	<%@ include file = "../mypage/mypageheader.jsp" %>
	<div class="wrap">
		<br> <br>
		<div class="qna">
			<p>자주 묻는 질문들</p>
			<div class="qnalist" style="margin-top: 8px;">
				<button onclick="toggleContent('button1', 'content1')">등산게시판
					이용하는 방법</button>
				<div id="content1">
					등산게시판 이용할 때 이렇게 사용하세요! <br> 등산 난이도, 추천코스 등 사용자들에게 공유해주세요 이렇게
					사용하면 됩니다
				</div>
				<br>
				<button onclick="toggleContent('button1', 'content2')">회원
					탈퇴 방법</button>
				<div id="content2">
					회원 탈퇴하기 위해서는 마이페이지 > 프로필 > 회원정보 <br> 수정 탭에서 확인 후 탈퇴할 수 있습니다. <br>
					탈퇴 후 약관은 1년동안 보관 처리됩니다.
				</div>
				<br>
				<button onclick="toggleContent('button1', 'content3')">영구정지
					회원 문의</button>
				<div id="content3">
					영구정지 회원은 신고 회수가 누적 5회 이상 <br> 되었을 경우 영구정지된다.
				</div>
				<br>
				<button onclick="toggleContent('button1', 'content4')">오등완
					게시판 사용 방법</button>
				<div id="content4">오등완 게시판은 사용자들에게 등산 정보를 서로에게 공유할 수 있는 게시판이다.
				</div>
				<br>
				<button class="add-button">문의하기</button>
			</div>
		</div>
		<br>

		<div class="myqna">
		<br>
			<table class="myqnalist">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>문의내용</th>
						<th>문의일</th>
						<th>답변상태</th>
					</tr>	
				</thead>
				<tbody>
					<% if (list != null) { %>
					<% for (Qna q : list) { %>
					<!-- case2. 게시글이 있을 경우 -->
						<tr>
							<td><%=q.getqNo() %></td>
							<td><%=q.getqTitle()%></td>
							<td><%=q.getqContent()%></td>
							<td><%=q.getqDate()%></td>
							<td><%=q.getStatus()%></td>
						</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>
			<br>
		</div>
		<br>
	</div>
	
	<script>
	function toggleContent(buttonId, contentId) {
		var content = document.getElementById(contentId);
		if (content.style.display === 'none') {
			content.style.display = 'block';
		} else {
			content.style.display = 'none';
		}
	}
	
	$(".add-button").click(function(){
		location.href = '<%= contextPath %>/qEnroll.me'
	})
	
	$(function(){
        	$(".myqnalist>tbody>tr").click(function(){
        		location.href = '<%= contextPath %>/detail.qbo?qno=' + $(this).children().eq(0).text()
        	})
        })
</script>
<%@ include file = "../common/footerbar.jsp"%>
</body>
</html>
