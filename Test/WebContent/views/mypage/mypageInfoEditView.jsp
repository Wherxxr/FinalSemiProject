<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <style>

        .pp_wrap{
            width: 1200px;
            margin: 0 auto;
        }

        #pp_outer{
            width: 550px;
            margin: auto;
            margin-top: 80px;
            color: rgb(78, 78, 78);
        }

        #pp_writein1, #pp_writein2, #pp_writein3, #pp_writein4{
            border: none;
            width: 400px;
        }

        #pp_click1{
            width: 550px;
            height: 100px;
        }

        #pp_btn1, #pp_btn2, #pp_btn3, #pp_btn4{
            border: 0px;
            float: right;
            margin: 0 10px 0 0;
        }
        .mpprofileedit {
            font-size: 20px;
            font-weight: bold;
        }

        .mpprofileedit::after {
            content: "";
            display: block;
            width: 150px;
            border-bottom: 2.5px solid rgb(149, 193, 31);
            margin: auto;
        }
        .ff1{font-family: 'NanumBarunGothicExtraLight';}
        .ff2{font-family: 'NanumBarunGothicLight';}
        .ff3{font-family: 'NanumBarunGothic';}
        .ff4{font-family: 'NanumBarunGothicBold';}

    </style>
</head>
<body>
<%@ include file = "mypageheader.jsp" %>
    <div class="pp_wrap">
        <div id="pp_outer">
            <div id="pp_write1">
                <m class="ff4">회원ID</m><br>
                <input type="text" id="pp_writein1" value="<%= loginMember.getUserId()%>">
                <hr>
            </div>
            <br>
            <form action="<%= contextPath%>/updatePwd.me">
            <input type="hidden" name="userId" value="<%= loginMember.getUserId()%>">
            <div id="pp_write2">
                <m class="ff4">비밀번호</m><br>
                <input type="text" id="pp_writein2" name="userPwd" value="<%= loginMember.getUserPwd()%>">
                <button type="submit" id="pp_btn1" class="btn btn-sm" style="background-color: gainsboro;" onclick="return validate();" >비밀번호 변경</button>
                 <div id="label2"></div>
                <hr>
            </div>
             </form>
            <br>
              <form action="<%= contextPath%>/updateEmail.me">
              <input type="hidden" name="userId" value="<%= loginMember.getUserId()%>">
            <div id="pp_write3">
                <m class="ff4">이메일</m><br>
                <input type="text" id="pp_writein3" name="email" value="<%= loginMember.getEmail()%>">
                <button type="submit" id="pp_btn2" class="btn btn-sm" style="background-color: gainsboro;">이메일 변경</button>
                <hr>
            </div>
             </form>
            <br>
             <form action="<%= contextPath%>/updatePhone.me">
             <input type="hidden" name="userId" value="<%= loginMember.getUserId()%>">
            <div id="pp_write4" style="height: 80px;">
                <m class="ff4">전화번호</m><br>
                <input type="text" id="pp_writein4" placeholder="010 - 0000 - 0000" name="phone" value="<%= loginMember.getPhone()%>">
                <button type="submit" id="pp_btn3" class="btn btn-sm" style="background-color: gainsboro;">전화번호 변경</button>
                <hr>
            </div>
             </form>
            <br>
            <div id="pp_write5" style="height: 80px;">
                <m class="ff4" style="float: right; margin: 0 20px 0 0;">회원탈퇴</m><br>
                <a href="<%=contextPath %>/delete.me" id="pp_btn3" class="btn btn-sm btn-secondary">탈퇴하기</a>
            </div>
            
    </div>
    <script>

    $("#pp_writein2").click(function(){
        $("#label2").html("<label for=''>영문자 대/소문자 특수문자, 숫자 포함 8 ~ 15자</label>")

    })
        function validate() {
            const pwdInput1 = document.getElementById("pp_writein2");

            regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
            if (!regExp.test(pwdInput1.value)) {
                alert("유효한 비밀번호를 입력해주세요!")
                pwdInput1.value = ""; // 지움
                pwdInput1.focus();
                return false;
            }

            

            

        } 
      
    </script>
    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>