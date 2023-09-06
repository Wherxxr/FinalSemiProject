<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <style>
        div{box-sizing: border-box;}
        .wrap{
            text-align: center;
            width: 1200px; 
            height: 500px; 
            margin: auto; 
            margin-top: 100px;
            font-family: 'NanumBarunGothic';
        }
        
        #find>a{
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
        }
        
        #userId{
            color: gray; 
            background-color: white; 
            display: inline-block;
        }
        #userPwd{
            color: white; 
            background-color: black; 
            display: inline-block;
        }
        
        #userId, #userPwd{
            width: 300px; 
            height: 50px; 
            line-height: 50px; 
            border: 1px solid gray; 
        }
        
        #find input{
            width: 300px; 
            height: 50px; 
            margin-top: 20px; 
            font-size: 14px; 
            font-family: 'NanumBarunGothic';
        }
        
        #btnPwd{
            width: 300px; 
            height: 46px; 
            font-size: 18px; 
            line-height: 46px; 
            background-color: black;
            color: white; 
            margin-top: 20px; 
            display: inline-block; 
            font-family: 'NanumBarunGothic';
            border-radius: 3px;
        }

        form h4{
            font-size: 15px; 
            margin-top: 30px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="wrap">
        <h1>계정 찾기</h1>
        <form action="<%= contextPath %>/findPwd.me" method="post" id="find">
            <!-- <a href="#" id="userId">아이디</a> -->
            <!-- <a href="#" id="userPwd">비밀번호</a> -->
            <h4>가입한 이메일을 입력해주세요.</h4>
            <!-- <h4>휴대폰 본인인증을 통해</h4> -->
            <h4>비밀번호를 확인합니다.</h4>

            <div>
                <input type="email" name="email" id="email" placeholder="이메일">
            </div>
            
            <button id="btnPwd" type="submit">비밀번호 찾기</button>

        </form>

    </div>
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>