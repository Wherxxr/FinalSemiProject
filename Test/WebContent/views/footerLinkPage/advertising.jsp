<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <style>
        /* div{border: 1px solid red; box-sizing: border-box;} */
        #advertising{
            width: 1200px;
            margin: 0 auto;
            margin-top: 50px;
        }
		
		.wrap{
			width: 1000px;
			margin: 0 auto;
            margin-top: 50px;
		}

        #ff1{font-family: 'NanumBarunGothicExtraLight';}
        #ff2{font-family: 'NanumBarunGothicLight';}
        #ff3{font-family: 'NanumBarunGothic';}
        #ff4{font-family: 'NanumBarunGothicBold';}
        

    </style>
</head>
	<%@ include file = "../common/menubar.jsp" %>
	<br>
    
    <body id="ff2">
    <div id="advertising">
    	<div class="wrap">
    	
    	<table>
    	<tr>
            <td>
                <h1 id="ff4">광고 관련 문의</h1><br>	 
                <p>MOUNTAINEER 커뮤니티는 메인페이지의 오른쪽 중앙에서 진행하고 있습니다.</p>	
                <p>본 사이트의 광고문의를 원하실 경우 아래의 이메일로 문의 부탁드립니다.</p>
                <p>메일주소 : khsmp6@gmail.com</p>
                <p>담당자 이름 : 류현수</p><br>
                <p>감사합니다.</p>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <img src="resources/image/logo.png" alt="광고 안내 그림">
            </td>

	 	
    	</tr>
    	</table>
	 	
	 	
    	</div>
	 
    </div>
    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>