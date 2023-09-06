<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 정보</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <style>
        /* div{border: 1px solid red; box-sizing: border-box;} */
        #recruit{
            width: 1200px;
            margin: 20px auto;
            font-family: 'NanumBarunGothic';           
        }

        .warp{
            width: 600px;
            /* border: 1px solid red; */
            margin: auto;
            padding: 0 10px 10px 10px;
            background-color:rgb(240, 240, 240);
            border-radius: 20px;
        }

        #ff1{font-family: 'NanumBarunGothicExtraLight';}
        #ff2{font-family: 'NanumBarunGothicLight';}
        #ff3{font-family: 'NanumBarunGothic';}
        #ff4{font-family: 'NanumBarunGothicBold';}

    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <!--<h1 style="color: rgb(175 212 133);">채용 정보</h1>-->
    <div id="recruit">
        <div class="warp">

    	<br><br>
        <h1 id="ff4">채용 정보</h1>
        <h2>WHAT IS SPECIAL</h2><br>
        
       
        <b id="ff3">교육</b> <br>
        <ul>
        <li id="ff2">입사 후 한달 간의 체계적인 집중 교육&실습</li>
        <li id="ff2">연간 계획 아래 주기적으로 이루어지는 실무 교육</li>
        </ul>
        <br>
        <b id="ff3">경험</b> <br>
        <ul>
        <li id="ff2">팀 배정 후 프로젝트에 투입되어 실무를 경험</li>
        <li id="ff2">풍부한 노하우를 가진 프로페셔널한 동료들과 함께하는 경험</li>
        <li id="ff2">개인의 자율성과 책임을 중시하는 분위기 속에서 자기주도적으로 업무를 수행하는 경험</li>
        </ul>
        <br><br>

        <table>
            <tr>
                <td id="ff4">#성장에 대한 열정 &nbsp;&nbsp;&nbsp;</td>
                <td>우리는 혁신적이고 지속가능하며, <br>
                    회사와 구성원이 함께하는 성장을 추구합니다.
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td id="ff4">#생산성 향상 추구</td>
                <td>우리는 모두의 생산성 향상을 위해, <br>
                    자발적인 참여와 적극적인 공유의 가치를 중시합니다.
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td id="ff4">#자율과 책임</td>
                <td>
                    우리는 각자의 영역에서 독립성과 자율성을 보장받으며, <br>
                    책임감 있게 행동합니다.
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td id="ff4">#팀플레이</td>
                <td>One Team <br>
                    우리는 모두의 하나의 팀, 하나의 MOUNTAINEER 입니다.
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td id="ff4">#고객 중심적 사고</td>
                <td>우리는 함께 성장하며, <br>
                    시장의 변화와 혁신을 이끌어갑니다.
                </td>
            </tr>
        </table>

        <br><br>
        <b id="ff3">기타 사항</b><br>
        <ul>
        <li> 최종 합격자는 3개월간의 수습기간이 적용되며, 해당 기간 중 급여는 100% 지급됩니다.</li>
        <li>입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.</li>
        </ul>
        <br><br>
    </div>
</div>
    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>