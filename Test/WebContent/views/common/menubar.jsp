<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% 
     String contextPath = request.getContextPath(); 
     Member loginMember = (Member)session.getAttribute("loginMember");
     String alertMsg = (String)session.getAttribute("alertMsg");
    
     %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>  
    <style>
        div{box-sizing: border-box; font-family: 'NanumBarunGothic';}
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

        .mb_outer{
            width: 1200px;
            height: 120px;
            margin: auto;
            /* margin-top: 10px; */
            border-bottom: 1px solid gray;
            
        }
        .mb_outer>div{height: 100%; float: left;}
        .mb_menu-area{
            width: 70%; 
            /* border: 1px solid blue;  */
        }
        .mb_login-area{
            width: 30%; 
            /* border: 1px solid red; */
        }

        .mb_menu-area>div{height: 100%; float: left;}
        #mb_logo{width: 17%; height: 100%;}
        #mb_nav{width: 75%;}
        #mb_logo>img{
            display: block; 
            width: 80%; 
            height: 70%; 
            margin: auto;
            margin-top: 25px;
            /* border: 1px solid ; */
        } 
        #mb_logo>img:hover{
            cursor: pointer;
        }


        #mb_navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
        }

        #mb_navi li{
            float: left;
            text-align: center;
            width: 16%;
            /* border: 1px solid red; */
            height: 100%;
            margin-left: 4px;
            
        }
        
        #mb_navi a{
            text-decoration: none;
            color: rgb(78, 78, 78);
            font-size: 17px;
            font-weight: bold;
            display: block;
            height: 90%;
            width: 90%;
            line-height: 170px;
            cursor: pointer;
            margin: auto;
            /* border: 1px solid red; */
        }

        #mb_navi a:hover {
            border-bottom: 5px solid rgb(149, 193, 31);
        }


        .mb_login-area>div{
            height: 70%;
            float: left;
            margin-top: 40px;
            /* border: 1px solid black; */
        }
        #mb_user_1{
            width: 55%;
        }
        #mb_user_2{
            width: 45%;
        }
        #mb_user_1 img{
            border: 1px solid rgba(160, 160, 160, 0.453);
            border-radius: 50%;
            /* width: 55px;
            aspect-ratio: auto 55 / 55;
            height: px; */
        }

        #mb_user_2 a{
            text-decoration: none;
            font-size: 15px;
            color: gray;
        }
        
        .pImg{
            display: block; 
            width:70px; height: 70px;
            transform: translateY(-15%);
            border: 1px solid rgba(160, 160, 160, 0.453);
            border-radius: 50%;
        }
        
    </style>
</head>
<body>
	<% if(alertMsg != null) {%>
		<script>
			alert("<%= alertMsg%>");
			<% session.removeAttribute("alertMsg"); %>
		</script>
	<%} %>
    <div class="mb_outer">
        <div class="mb_menu-area">
            <div id="mb_logo"  onclick="main();">
                <img src="resources/image/logo.png" alt="로고">
            </div> 
            <div id="mb_nav">
                <ul id="mb_navi">
                    <li><a href="<%= contextPath%>/listView.bo">자유게시판</a></li>
                    <li><a href="<%= contextPath %>/todayView.to">오등완 💪</a></li>
                    <li><a href="<%= contextPath%>/mtInfoView.do">한국의 산</a></li>
                    <li><a href="<%= contextPath%>/list.tg">같이 등산행</a></li>
                    <li><a href="<%= contextPath%>/list.no">공지사항</a></li>
                </ul>
            </div>
        </div>
        <script>
 			/*       
            */
            $(function(){
                // 해당 페이지 스타일부여하는 함수
                const a = location.href;
                
                const b = ["/listView.bo", "/detail.bo", "/enrollForm.bo"];
                const c = ["/list.tg", "/detail.tg", "/enrollFormView.tg"];
                const d = ["/todayView.to", "/detail.to", "/enrollForm.to", "/updateForm.to"];
                const e = ["/mtInfoView.do"];
                
                
                (b[1]);
                let result = 0;
                
                for(let i=0; i<b.length; i++){
                	if(a.search(b[i]) != -1){
	                    $("#mb_navi").children().eq(0).children().css("border-bottom","5px solid rgb(149, 193, 31)");                	
                	}	
                }
                
                for(let i=0; i<c.length; i++){
                	if(a.search(c[i]) != -1){
                		$("#mb_navi").children().eq(3).children().css("border-bottom","5px solid rgb(149, 193, 31)"); 
                	}
                }
                for(let i=0; i<d.length; i++){
                	if(a.search(d[i]) != -1){
                		$("#mb_navi").children().eq(1).children().css("border-bottom","5px solid rgb(149, 193, 31)"); 
                	}
                }
                for(let i=0; i<e.length; i++){
                	if(a.search(e[i]) != -1){
                		$("#mb_navi").children().eq(2).children().css("border-bottom","5px solid rgb(149, 193, 31)"); 
                	}
                }
                
            })
            function main(){
            	location.href = "<%= contextPath %>/index.jsp";
            }
        </script>	
        <div class="mb_login-area">

            <% if(loginMember == null){ %>
                <div id="mb_user_1">
                    <table align="center">
                        <tr height="75">
                            <th width="70"><img width="60" height="60" src="https://cdn-icons-png.flaticon.com/128/3985/3985429.png" alt=""></th>
                            <td width="100" style="font-size: 17px"><b>로그인하세요</b></td>
                        </tr>
                    </table>

    
                </div>
                <div id="mb_user_2">
                    <table align="center">
                        <tr height="75" align="center">
                            <td width="50"><a href="<%= contextPath %>/loginView.me">로그인</a></td>
                            <td width="70"><a href="<%= contextPath %>/enrollForm.me">회원가입</a></td>
                        </tr>
                    </table>
                </div>
    
                
            <% }else { %>
                <div id="mb_user_1">

                    <table align="center">
                        <tr height="75">
                            <th width="100"><img src="<%= loginMember.getProfileImg()%>" class="pImg"></th>
                            <td width="100" style="font-size: 20px;"><b><%= loginMember.getUserName()%>님</b></td>
                        </tr>
                    </table>
    
    
                </div>
                <div id="mb_user_2">
                    <table align="center">
                        <tr height="75" align="center">
                            <td width="80">
                                <form id="postForm" action="<%= contextPath %>/profile.me" method="post">
                                    <input type="hidden" name="userNo" value="<%= loginMember.getUserNo()%>">
                                </form>
                            <a href="#" onclick="submitProfileForm()">마이프로필</a></td>
                            <td width="60"><a href="<%= contextPath %>/logout.me">로그아웃</a></td>
                        </tr>
                    </table>
                </div>

                
                <script>
                    function submitProfileForm(action) {
                        const form = document.getElementById("postForm");
                        form.action = "<%= contextPath %>/profile.me";
                        form.submit();
                    }
                </script>
            <% } %> 
            
        </div>
    </div>
</body>
</html>