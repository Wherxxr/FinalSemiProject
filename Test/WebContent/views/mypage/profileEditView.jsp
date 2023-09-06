<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 수정</title>
<style>
/* div { border: 1px solid red; box-sizing: border-box; } */
.wrap {
	width: 1000px;
	height: 1500px;
	margin: auto;
}

div {
	margin-top: 10px;
}

/* 공통특성 가로 길이 100% */
#complete {
	height: 100px;
}

#profile {
	height: 230px;
}

#input {
	height: 800px;
}

#complete>div, #content>div {
	height: 100%;
	float: left;
}

#complete_1 {
	width: 800px;
}

#complete_2 {
	width: 80px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#complete_3 {
	width: 80px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#complete_2>button, #complete_3>button {
	width: 65px;
	height: 40px;
}

#profile>div, #profile>div {
	height: 100%;
	float: left;
}

#profile_1 {
	width: 200px;
}

#profile_2 {
	width: 240px;
	position: relative;
}

#profile_2>img {
	width: 180px;
	height: 180px;
	border-radius: 100px;
	margin-top: 20px;
	margin-left: 20px;
}

#profile_2>#uplo {
	width: 40px;
}

#uplo {
	width: 30px;
	position: absolute;
	top: 160px;
	left: 175px;
	cursor: pointer;
}

#input>div, #input>div {
	height: 100%;
	float: left;
}

#input_1 {
	width: 250px;
}

#input_2 {
	width: 500px;
}

#nickname>input {
	width: 480px;
	height: 40px;
}

#intro>input {
	width: 480px;
	height: 200px;
}

#text {
	color: rgb(62, 62, 62);
	font-size: 20px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%
	String instaId = (loginMember.getInstaId() == null) ? "" : loginMember.getInstaId();
	%>
	<div class="wrap">
		<div id="complete">
			<div id="complete_1"></div>
			<div id="complete_2">
				<button id="share-button">공유</button>
			</div>
		</div>
		<form action="<%=contextPath%>/update.me" enctype="multipart/form-data" method="post">
			<input type="hidden" name="userId" value="<%=loginMember.getUserId()%>">
		    <input type="hidden" name="userNo" value="<%=loginMember.getUserNo()%>">
			
			<div id="complete_3">
				<button type="submit">편집</button>
			</div>
			<div id="profile">
				<div id="profile_1"></div>
				<div id="profile_2">
					<img src="<%=loginMember.getProfileImg()%>" id="pro"> 
					<label for="image-upload" id="upload-label">
						<img src="views/resources/img/plus.png" id="uplo">
					</label> <input type="file" id="image-upload" accept="image/*"
						style="display: none;" name="upfile">
				</div>

			</div>
			<div id="input">
				<div id="input_1"></div>
				<div id="input_2">
					<div id="text">닉네임</div>
					<div id="nickname">
						<input type="text" name="nickname"
							value="<%=loginMember.getNickname()%>">
					</div>
					<br>
					<br>

					<div id="text">소개글</div>
					<div id="intro">
						<input type="text" name="desc"
							value="<%=loginMember.getDescription()%>">
					</div>
					<br>
					<br>

					<div id="text">채널</div>
					<div id="insta">
						인스타 instagram.com / <input type="text" placeholder="아이디를 입력해주세요"
							name="insta" value="<%=instaId%>">
					</div>
					<br>

					<div id="text">등력</div>
					
					<select name="gradeNo" id="gradeNoSelect">
						<option value="10">1 ~ 5년차</option>
						<option value="20">6 ~ 10년차</option>
						<option value="30">10 ~ 20년차</option>
						<option value="40">20년 이상</option>
					</select> <br>
					<br>
				</div>
			</div>
		</form>
	</div>

	<script>
	const defaultSelectedValue = <%= loginMember.getGradeNo() %>;

	// select 요소 가져오기
	const gradeNoSelect = document.getElementById("gradeNoSelect");

	// select 요소의 option들을 순회하면서 선택 상태 설정
	for (let i = 0; i < gradeNoSelect.options.length; i++) {
	    if (gradeNoSelect.options[i].value == defaultSelectedValue) {
	        gradeNoSelect.options[i].selected = true;
	        break;  // 선택되었으므로 루프를 종료합니다.
	    }
	}
		document.addEventListener("DOMContentLoaded", function() {
			const imageUploadInput = document.getElementById("image-upload");
			const profileImage = document.getElementById("pro");

			imageUploadInput.addEventListener("change", function() {
				const selectedImage = imageUploadInput.files[0];
				if (selectedImage) {
					const reader = new FileReader();

					reader.onload = function(e) {
						profileImage.src = e.target.result;
					};

					reader.readAsDataURL(selectedImage);
				}
			});
		});

		// 공유 버튼 클릭 시 링크 복사
		const shareButton = document.getElementById("share-button");
		shareButton.addEventListener("click", function() {
			const linkToCopy = window.location.href; // Get the current URL
			const tempInput = document.createElement("input");
			document.body.appendChild(tempInput);
			tempInput.value = linkToCopy;
			tempInput.select();
			document.execCommand("copy");
			document.body.removeChild(tempInput);
			alert("링크가 복사되었습니다");
		});
	</script>
</body>
</html>
