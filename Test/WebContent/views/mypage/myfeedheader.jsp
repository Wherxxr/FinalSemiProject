    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m"); 
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPageHeader</title>
   
    

    <style>
        #fh_feedheader{
            width: 1200px;
            margin: 0 auto;
        }

        #fh_btn{
            margin: 10px 10px 0px 0px;
            position: absolute;
            right: 400px;
        }

        #fh_pic, #fh_info1, #fh_info2, #fh_link{
            margin: 5px auto;
        }

        .ff1{font-family: 'NanumBarunGothicExtraLight';}
        .ff2{font-family: 'NanumBarunGothicLight';}
        .ff3{font-family: 'NanumBarunGothic';}
        .ff4{font-family: 'NanumBarunGothicBold';}
        #content_2 {
            height: 30px;
        }

        #navi {
            list-style-type: none;
            padding: 0;
            margin: auto;
            height: 30px;
            width: 1000px;
            border-bottom: solid 2px gray;
        }

        #navi>li {
            float: left;
            width: 500px;
            text-align: center;

        }

        #navi>li:hover {
            cursor: pointer;
            font-weight: bold;
            text-decoration: 2px underline;
        }

        #navi>li>a {
            text-decoration: none;
            color: black;
        }


        
    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	<br><br>
	
        <div id="fh_feedheader">
            <div id="fh_btn">
                    <button class="btn btn-light" style="float: right; margin: 0px 5px;" id="fh_btn2"><img src="views/resources/img/share.png" alt="공유하기 사진 자리" width="20px"></button>
            </div>
            <div id="fh_pic" style="height: 200px; width: 600px;">
                <img src="<%= m.getProfileImg() %>" style="width: 100px; height: 100px; float: left; margin: 70px 20px 0px 20px; border-radius: 50%;">
            </div>
            <div style="width: 600px;" class="ff3" id="fh_info1">
                <span style="font-weight: 700; font-size: x-large; margin: 10px 5px; width: 200px; "><%= m.getNickname()%></span>
                <% if(m.getGradeNo() == 10){ %>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">등력 1~5년</span>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">등린이</span>
                <%} else if(m.getGradeNo() == 20) {%>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">등력 6~10년</span>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">등산매니아</span>
                <%} else if(m.getGradeNo() == 30) {%>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">등력 10~20년</span>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">엄홍길</span>
                <%} else if(m.getGradeNo() == 40) {%>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">등력 20년~</span>
                <span style="font-weight:600; color: gray; margin: 5px 5px;">산신령</span>
                <%}%>
            </div>
                
                <div style="font-weight: 600; font-size: large; width: 600px;" id="fh_info2"><%= m.getDescription()%></div>
                
                <div style="width: 600px;" id="fh_link">
                <% if (m.getInstaId()!=null){ %>
                    <a href="https://www.instagram.com/<%= m.getInstaId()%>" target="_blank"><img src="https://img.freepik.com/premium-photo/instagram-application-logo-3d-rendering-on-white-background_41204-6853.jpg" alt="인스타그램 공유" width="50px" style="margin: auto"></a>
                    <%} %>
                </div>
                <form id="postForm" method="post">
			        <input type="hidden" id="userNoInput" name="userNo" value="<%= m.getUserNo() %>">
			    </form>
                <div id="content_2"> 
                    <ul id="navi">
                        <li class="mpprofile"><a href="#" onclick="submitForm('<%= contextPath %>/feedProfile.me?userNo=<%= m.getUserNo() %>')">프로필</a></li>
                        <li class="mplist"><a href="<%= contextPath %>/flView.me?userNo=<%= m.getUserNo() %>">게시물</a></li>

                    </ul>
                </div>
                
        </div>
         <script>
         function submitForm(action) {
             const form = document.getElementById("postForm");
             form.action = action;
             form.submit();
         }
        
    	</script>
</body>
</html>