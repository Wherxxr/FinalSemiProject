<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myFeedHeader</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <style>
        /* div{border: 1px solid red; box-sizing: border-box; width: 1200px;} */
        #mf_feedheader{
            width: 1200px;
            margin: 0 auto;
        }

        #mf_btn{
            margin: 10px 10px 0px 0px;
            position: absolute;
            right: 400px;
        }

        #mf_pic, #mf_info1, #mf_info2, #mf_link{
            margin: 5px auto;
        }

        .ff1{font-family: 'NanumBarunGothicExtraLight';}
        .ff2{font-family: 'NanumBarunGothicLight';}
        .ff3{font-family: 'NanumBarunGothic';}
        .ff4{font-family: 'NanumBarunGothicBold';}

    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	<br><br>
	
        <div id="mf_feedheader">
            <div id="mf_btn">
                    <a href="<%=contextPath%>/profileEditForm.no" class="btn btn-light" style="float: right;" id="mf_btn1">편집</a>
                    <button class="btn btn-light" style="float: right; margin: 0px 5px;" id="mf_btn2"><img src="../99_semiproject/resources/image/share.png" alt="공유하기 사진 자리" width="20px"></button>
            </div>
            
            <div id="mf_pic" style="height: 200px; width: 600px;">
                <img src="../99_semiproject/resources/image/picture.png" style="width: 100px; height: 100px; float: left; margin: 70px 20px 0px 20px; border-radius: 50%;">
            </div>
            <div style="width: 600px;" class="ff3" id="mf_info1">
                <span style="font-weight: 700; font-size: x-large; margin: 10px 5px; width: 200px; ">차은우</span>
            </div>
                
            <div style="font-weight: 600; font-size: large; width: 600px;" id="mf_info2">간략한 자기  소개 자리</div>
        
        </div>
</body>
</html>