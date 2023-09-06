<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <title>Document</title>
    <style>
        div{
            box-sizing: border-box; 
            /*border: 1px solid red;*/ 
            font-family: 'NanumBarunGothic';}
        
        #introduce{
            width: 1200px;
            margin-top: 50px;
            margin-bottom: 50px;
            margin: 0 auto;
        }
        
        .wrap{
            width: 1000px;
            /* border: 1px solid red; */
            margin: auto;
        }

		#ff1{font-family: 'NanumBarunGothicExtraLight';}
        #ff2{font-family: 'NanumBarunGothicLight';}
        #ff3{font-family: 'NanumBarunGothic';}
        #ff4{font-family: 'NanumBarunGothicBold';}

    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <br><br>
    <div id="introduce">
        <div class="wrap">


        <h1 id="ff4">서비스 소개</h1><br>
        
        <h2 id="ff3">의도</h2>
        <p>
        <b id="ff3">MOUNTAINEER</b>는 초심자부터 숙련자까지 등산에 대한 정보를 편하게 공유하고 소통할 수 있는 등산 커뮤니티입니다.<br> 
        코로나 팬데믹 이후 레져나 아웃도어 활동이 다시 활발해지는 추세로 등산을 준비하는 마운티니어와 초심자부터 숙련자까지의 넓은 접근성을 목적으로 구현하였습니다. <br>
        게시판 내 호칭은 마운티니어입니다.
        <br><br>
        </p>
        <h2 id="ff3">소개</h2>
        <p>
        자유게시판 : 자유롭게 대화할 수 있는 게시판입니다. <br>
        질문게시판 : 다양하고 전문적인 지식을 가진 사람들로부터 질문하고 답변을 얻을 수 있습니다. <br>
        오등완 : 오등완(오늘 등산 완료 후기) 작성할 수 있습니다. 등산 팁도 추가할 수 있습니다. <br>
        같이 등산해요 : 등산 관련 모임 일정을 제공합니다. 동료 마운티니어와 함께 등반할 수 있습니다. <br>
        에디터스픽 : 산에 대한 정보, 등산 기술, 안전사항 등을 제공합니다. 초보자부터 전문가까지 다양한 기술 수준에 적합한 방법을 제공합니다. <br>
        장비 리뷰 및 권장 사항 : 마운티니어가 등산 장비, 장비 및 의류에 대한 리뷰 및 권장 사항을 작성할 수 있는 섹션을 만듭니다.<br> 
        					 이는 초보자가 여행 상품을 구매할 때 정보에 입각한 결정을 내리는 데 도움이 될 수 있습니다. <br>
        프로필 및 배지 : 마운티니어가 자신의 등반 완료 산, 성과 및 진행 상황을 보여줄 수 있는 프로필을 만들 수 있습니다. <br>
        목표에 도달하거나 다양한 콘텐츠를 제공한 마운티니어에게 보상하는 칭호 시스템을 구현합니다. <br>
        소셜 미디어 통합 : 마운티니어가 등반 업적, 게시물 및 업데이트를 SNS 프로필에 직접 공유하여 커뮤니티를 홍보하고 새로운 회원을 유치할 수 있습니다. <br><br>
        
        
        </p>
    </div>
</div>
    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>