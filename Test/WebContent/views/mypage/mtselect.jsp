<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>산 선택</title>
    <style>
        /* div {border: 1px solid red; box-sizing: border-box;} */
        .outer {
            background-color: rgba(128, 128, 128, 0.169);
            color: rgba(0, 0, 0, 0.727);
            width: 1000px;
            height: 500px;
            margin: auto;
            margin-top: 50px;
            padding: 20px; 
        }
        .mpprofile {
        font-size: 20px;
        font-weight: bold;
      }

      .mpprofile::after {
        content: "";
        display: block;
        width: 150px;
        border-bottom: 2.5px solid rgb(149, 193, 31);
        margin: auto;
      }
        #selectmt{
            margin-left: 100px;
            margin-right: 100px;
            font-weight: 550;
            font-size: 25px;
            margin-top: 35px;
        }
        #itemList {
            color: rgba(0, 0, 0, 0.502);
            margin-left: 100px;
            margin-right: 100px;
            font-size: 19px;
            margin-top: 35px;
        }

        #mtList {
            width: 200px;
            height: 25px;
            margin-top: 10px;
        }

        #addmt {
            height: 31px;
            margin-right: 100px;
        }

        .dynamic-button {
            border: none;
            background-color: rgb(149, 193, 31);
            color: white;
            border-radius: 50%; 
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
        }

        #completedMountainsContainer{
            margin-left: 100px;
            margin-right: 100px;
        }
        
        .addmt, .mtedit {
        font-size: 15px;
        border: 1thin;
        border-color: slategrey;
        border-radius: 7%;
        }


    </style>
</head>
<body>
<%@ include file="mypageheader.jsp" %>

<div class="outer">
    <div id="selectmt">산선택
        <form id="mountainForm" method="" action="">
            <input type="text" name="mountain" id="mtList" list="mountainList">
                <datalist id="mountainList">
                  <option value="가리산">가리산</option>
                  <option value="가야산">가야산</option>
                  <option value="계룡산">계룡산</option>
                  <option value="관악산">관악산</option>
                  <option value="대둔산">대둔산</option>
                  <option value="덕유산">덕유산</option>
                  <option value="도봉산">도봉산</option>
                  <option value="마이산">마이산</option>
                  <option value="북한산">북한산</option>
                  <option value="설악산">설악산</option>
                  <option value="소백산">소백산</option>
                  <option value="속리산">속리산</option>
                  <option value="오대산">오대산</option>
                  <option value="월악산">월악산</option>
                  <option value="월출산">월출산</option>
                  <option value="주왕산">주왕산</option>
                  <option value="지리산">지리산</option>
                  <option value="청계산">청계산</option>
                  <option value="치악산">치악산</option>
                  <option value="태백산">태백산</option>
                  <option value="한라산">한라산</option>
                  <option value="황매산">황매산</option>
                </datalist>
            <button type="button" id="addmt" class="addmt">입력</button>
        </form>
    </div>
    <div id="itemList">등산완료 산</div>
      <div id="completedMountainsContainer">
      <% if(loginMember.getCompleteMt() != null) {%>
      <%
        String[] completedMountains = loginMember.getCompleteMt().split(","); // 쉼표로 구분된 산 이름들을 배열로 분리
        for (String mountain : completedMountains) {
    %>
    <button class="dynamic-button" name="mtname" value="<%= mountain.trim() %>"><%= mountain.trim() %></button>
    <%
        }
      }
    %>
      </div> 
      
      <button type="button" class="mtedit">수정완료</button>


</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
	  const addButton = document.getElementById("addmt");
	  const completedMountainsContainer = document.getElementById("completedMountainsContainer");
	  const textInput = document.getElementById("mtList");
	  const form = document.getElementById("mountainForm");

	  // "입력" 버튼에 이벤트 리스너 추가
	  addButton.addEventListener("click", function() {
	    const enteredText = textInput.value.trim();
	    if (enteredText !== "") {
	      // 이미 리스트에 있는 버튼 이름과 동일한 버튼이 있는지 확인
	      const existingButton = Array.from(completedMountainsContainer.querySelectorAll(".dynamic-button")).find(button => button.textContent === enteredText);
	      
	      if (!existingButton) {
	        // 입력한 텍스트로 새 버튼 요소 생성
	        const newButton = document.createElement("button");
	        newButton.textContent = enteredText + " ";
	        newButton.classList.add("dynamic-button");
	        newButton.name = "mtname";
	        newButton.value = enteredText;
	        completedMountainsContainer.appendChild(newButton);
	        textInput.value = "";

	        // 동적으로 생성한 버튼에 클릭 이벤트 추가
	        newButton.addEventListener("click", function() {
	          completedMountainsContainer.removeChild(newButton);
	        });
	      } else {
	        alert("이 산은 이미 목록에 있습니다!");
	      }
	    }
	  });

	  // 폼 제출 방지
	  form.addEventListener("submit", function(event) {
	    event.preventDefault();
	  });

	  const existingButtons = Array.from(completedMountainsContainer.querySelectorAll(".dynamic-button"));
	  existingButtons.forEach(function(button) {
	    button.addEventListener("click", function() {
	      completedMountainsContainer.removeChild(button);
	    });
	  });
	});

	$(function () {
	    $(".mtedit").click(function () {
	        let mtNames = $(".dynamic-button").map(function() {
	            return $(this).text().trim();
	        }).get();

	        let userNo = <%= loginMember.getUserNo() %>;
	        let userId = '<%= loginMember.getUserId() %>';
	        
	        // 배열을 쉼표로 연결한 문자열로 변환
	        let mtNamesString = mtNames.join(',');

	        // URL 파라미터를 포함하여 페이지 이동
	        location.href = '<%= contextPath %>/mtselect.me?mtname=' + mtNamesString + '&userNo=' + userNo +'&userId=' + userId ;
	        
	    });
	});



</script>



</body>
</html>
