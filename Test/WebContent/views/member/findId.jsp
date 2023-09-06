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
        /* div{border: 1px solid red; box-sizing: border-box;} */
        body{font-family: 'NanumBarunGothic';}
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
            margin-top: 10px;
        }
        #userId{
            color: white; 
            background-color: black;
            border: 1px solid gray;

        }
        /* #email{
            color: gray; 
            background-color: white; 
            border: 1px solid gray;
        } */
        #userId/*, #email*/{
            width: 300px; 
            height: 50x; 
            line-height: 50px; 
            display: inline-block; 
            border-radius: 3px;

        }
        #name, #email{
            height: 30px; 
            margin-top: 20px; 
            width: 300px; 
            font-family: 'NanumBarunGothic';
        }

        #email, #btn{
            margin-top: 20px;
            margin-bottom: 20px;

        }

        #find input{
            height: 50px;
        }
        #btnId{
            width: 300px; 
            height: 46px; 
            font-size: 18px; 
            line-height: 46px;
            background-color: black; 
            color: white; 
            cursor: pointer; 
            margin-top: 20px; 
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
        <h1 id="findId">계정 찾기</h1>
        <form action="<%= contextPath %>/findId.me" method="post" id="find">
            <!-- <a href="#" id="userId">이메일로 찾기</a> -->
            <!-- <a href="#" id="email">이메일로 찾기</a> -->
            <div>
                <!-- <input type="text" id="name" placeholder=""> -->
            </div>
            <h4>가입한 이메일을 입력해주세요.</h4>
            <h4>아이디를 확인합니다.</h4>
            <div>
                <input type="email" id="email" name="email" placeholder="이메일">
            </div>
            
            <div>
                <button id="btnId" type="submit">아이디 찾기</button>
            </div>

        </form>

    </div>

    
    
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>