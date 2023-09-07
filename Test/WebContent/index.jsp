<%@page import="mainPage.model.service.BestService"%>
<%@page import="board.model.service.BoardService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="notice.model.vo.Notice"%>
<%@page import="board.model.vo.Board"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
	ArrayList<Board> list = new BestService().selectBestList();
	Board b = (Board)request.getAttribute("b");
	ArrayList<Notice> nlist = new BestService().selectRecentNotice(); 
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOUNTAINEER</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
    <script async src="https://cse.google.com/cse.js?cx=4264174f1840e418b">
    </script>
    <style>
        div{box-sizing: border-box; /*border: 1px solid red;*/}
        
        .wrap{
            width: 1200px;									
            height: 1500px;
            margin: auto;
            font-family: 'NanumBarunGothic';
        }

        .wrap>div{
            width: 100%;
        }

        #header{height: 10%;}
        #navigator{height: 5%;}
        #main1{height: 30%;}
        #content{height: 55%;}
               
        #h1{width: 15%;}
        #h2{width: 50%;}
        #h3{width: 8%;}
        #h4{width: 10%;}
        #h5{width: 8%;}
        #h6{width: 8%;}
        /* dfsf */
        #con1{width: 45%;}
        #con2{width: 40%;}
        #con3{width: 15%;} 
        
        /* 헤더 */
        #header>div{
            height: 100%;
            float: left;
        }
        /* 로고 */
        #logo{
        display: block;
        width: 70%;
        height: 80%;
        margin: auto;
        margin-top: 8px;
        /* border: 1px solid blue; */
        }

        /* 검색창 */
        #h2{
            position: relative;
           }
        #search_form{
            width: 90%; height: 30%;
            margin: auto;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            padding-left: 50px;
        }
        #search_form>div{height: 100%; float: left;  position: relative;}
        #search_text{width: 75%;}
        #search_btn{width: 10%; padding: 8px; border: 1px solid gray;}
        #search_form input{width: 100%; height: 100%;}

        /* 헤더 회원 */
        #header a{
            text-decoration: none;
            color: black;
            text-align: center;
            display: block; 
            font-size: 16px;
            font-weight: 550;
        }
        #h3 a{ 
            width: 70%;
            margin: auto;
            padding-top: 45px;
            }
        #h4 a, #h5 a, #h6 a{/*vertical-align: middle;*/ 
            padding-top: 60px;
        }
        #h4 a{font-size: 20px; padding-top: 57px;}
        #profile{
            display: block; 
            /* width: 100%;  */
            transform: translateY(-15%);
            border: 1px solid rgba(160, 160, 160, 0.453);
            border-radius: 50%;
        }
        
        /* 네비 */
        #navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
        }
        #navi>li{
            float: left;
            text-align: center;
            width: 20%;
            height: 70px;
            line-height: 70px;
        }
        #navi a{
            text-decoration: none;
            color: black;
            font-size: 17px;
            font-weight: 550;
            display: block;
            height: 60px;
            margin: auto;
        }
        #navi a:hover{
            text-decoration: none;
            border-bottom: 5px solid rgb(149, 193, 31);
            display: block;
        }

        /*메인1*/
        #main1>div{
            height: 100%;
        }
        
        .carousel-inner>.carousel-item>img{
            width: 1200px;
            height: 450px; 
        }
        
        /*컨텐트*/
        #content>div{
            height: 100%;
            float: left;
        }

        #con1>div, #con3>div{
            height: 33.3%;
        }
        
        #content a{
            text-decoration: none;
            color: black;
            font-size: 16px;
            padding: 10px;
        }

        #con2_1{height: 33.3%;}
        #con2_2{height: 66.6%;}

        #a1, #a2, #a3, #a4{
            height: 15%; 
            padding: 10px; 
            border-bottom: 1px solid #b3b0b0;
            width: 90%;
        }
        #b1, #b2, #b3, #b4{
            width: 90%;
            height: 85%;
            padding: 5px;
        }

        
        #a5{
            height: 7.5%; 
            padding: 10px; 
            border-bottom: 1px solid #b3b0b0;
            width: 90%;
        }
        #b5{height: 92.5%;}
        
        #writers{
            border-bottom: 1px solid #b3b0b0;
            width: 90%;
            padding: 5px;
        }
        
        /* 광고1 */
        #add1, #add2{
            width: 100%; 
            height: 100%;
            padding: 15px;
        }

        #top{
            width: 50px; 
            height: 50px;
        }
        
        #navi a{
        	width: 65%;
            font-weight: bolder;
            font-size: 19px;
            color: rgb(58,58,58);
        }
        #main1{
            margin-bottom: 25px;
        }
        .subtitle{
            font-size: 100px;
        }
        
        .btn_submit{
        background-image:url('https://cdn-icons-png.flaticon.com/128/2801/2801881.png'); 
        background-repeat: no-repeat; 
        background-size: 100%;
        background-position: center;
        border-style: outset;}

        .topUserimg{
            border-radius: 50%;
        }
    </style>
    
</head>
<body>
	<% if(alertMsg != null) { %>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>		
	<% } %>

    <div class="wrap">
        <div id="header">
            <div id="h1">
                <a href="#">
                    <img src="resources/image/logoBig.png" id="logo">
                </a>
            </div>
            <div id="h2">
                <form action="#" id="search_form">
                    <div id="search_text">
                        <input type="text" name="keyword">
                    </div>
                    <div id="search_btn">
                        <input type="image" id="search" src="https://cdn-icons-png.flaticon.com/128/2801/2801881.png">
                    </div>
                </form>
            </div>
            
                   
                <% if(loginMember == null){ %>
                <!-- case1. 로그인 전  -->
            <div id="h3">
                <a href="#">
                  
                    <img src="https://cdn-icons-png.flaticon.com/128/3985/3985429.png" id="profile" alt="" width="70" height="70">
            
                </a>
            </div>
                <div id="h4">
                    <a href="#">환영합니다.</a>
                </div>
                <div id="h5">
                    <a href="<%= contextPath %>/loginView.me">로그인</a>
                </div>
                <div id="h6">
                    <a href="<%= contextPath %>/enrollForm.me">회원가입</a>
                </div>
                
            <% }else { %>
                <!-- case2. 로그인 후  -->
                
            <div id="h3">
                <a href="#">
                  
                    <img src="<%= loginMember.getProfileImg() %>" id="profile" alt="" width="70" height="70">
            
                </a>
            </div>
                <div id="h4">
                    <a href="#"><%= loginMember.getUserName()%>님</a>
                </div>
                <div id="h5">
                    <form id="postForm" action="<%= contextPath %>/profile.me" method="post">
					    <input type="hidden" name="userNo" value="<%= loginMember.getUserNo()%>">
					    <input type="hidden" name="userId" value="<%= loginMember.getUserId()%>">
					</form>
					<a href="#" onclick="submitForm()">마이프로필</a>
                </div>
                <div id="h6">
                    <a href="<%= contextPath %>/logout.me">로그아웃</a>
                </div>
                
            <% } %> 
            
            
           
        </div>
        <div id="navigator">
             <ul id="navi">
                    <li>
                        <a href="<%=contextPath %>/listView.bo">자유게시판</a>
                    </li>
                    <li>
                        <a href="<%=contextPath %>/todayView.to">오등완💪</a>
                    </li>
                    <li>
                        <a href="<%=contextPath %>/mtInfoView.do">한국의 산</a>
                    </li>
                    <li>
                        <a href="<%=contextPath %>/list.tg">같이 등산행</a>
                    </li>
                    <li>
                        <a href="<%=contextPath %>/list.no">공지사항</a>
                    </li>
                </ul>
        </div>
        <div id="main1">
            <div id="demo" class="carousel slide" data-ride="carousel">

                <div class="carousel-inner">
                  <!-- 슬라이드 쇼 -->
                  <div class="carousel-item active">
                    <!--가로-->
                    <img class="d-block w-100" 
                      src="resources/image/cha2.png"
                      alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100"
                      src="resources/image/snow5.jpg"
                      alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100"
                      src="resources/image/cha1.png"
                      alt="Third slide">
                 </div>
                 <div class="carousel-item">
                    <img class="d-block w-100"
                      src="resources/image/usa.jpg"
                      alt="fourth slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100"
                      src="resources/image/somi.jpg"
                      alt="fifth slide">
                 </div><div class="carousel-item">
                    <img class="d-block w-100"
                      src="resources/image/black.jpg"
                      alt="sixth slide">
                 </div>
                 
                </div>
                
               
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                 
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <!-- <span>Next</span> -->
                </a>
           
                
                <!-- 인디케이터 -->
                <ul class="carousel-indicators">
                  <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
                  <li data-target="#demo" data-slide-to="1"></li>
                  <li data-target="#demo" data-slide-to="2"></li>
                  <li data-target="#demo" data-slide-to="3"></li>
                  <li data-target="#demo" data-slide-to="4"></li>
                  <li data-target="#demo" data-slide-to="5"></li>
                </ul>
                <!-- 인디케이터 끝 -->
            </div>
            <script>
                $('.carousel').carousel({
                  interval: 5000 //기본 5초
                })
            </script>
            
        </div>

        <div id="content">
            <div id="con1">
                <div id="con1_1">
                    <div id="a1">
                    <a href="#" class="subtitle" style="font-size: 19px; font-weight: bolder;">날씨예보</a>   
                    </div>
                    <div id="b1">
                         <div style="background-color : rgb(101, 178, 255); padding : 25px; color : #fff; height : 220px">
                            <div style="float : left;">
                                <div class="weather_icon"></div>
                            </div><br>
                            <div style="float : right; margin : -5px 0px 0px 60px; font-size : 11pt">
                                    <div class="temp_min"></div>
                                    <div class="temp_max"></div>
                                    <div class="humidity"></div>
                                    <div class="wind"></div>
                                    <div class="cloud"></div>
                            </div>
                            <div style="float : right; margin-top : -45px;">
                                <div class="current_temp" style="font-size : 20pt"></div>
                                <div class="weather_description" style="font-size : 20pt"></div>
                                <div class="city" style="font-size : 13pt"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
 
                    // 날씨 api - fontawesome 아이콘
                    var weatherIcon = {
                        '01' : 'fas fa-sun',
                        '02' : 'fas fa-cloud-sun',
                        '03' : 'fas fa-cloud',
                        '04' : 'fas fa-cloud-meatball',
                        '09' : 'fas fa-cloud-sun-rain',
                        '10' : 'fas fa-cloud-showers-heavy',
                        '11' : 'fas fa-poo-storm',
                        '13' : 'far fa-snowflake',
                        '50' : 'fas fa-smog'
                    };

                    // 날씨 api - 서울
                    var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+'seoul'+"&appid="+"e651e2c000b27432b857f7414c865414";
                    $.ajax({
                        url: apiURI,
                        dataType: "json",
                        type: "GET",
                        async: "false",
                        success: function(resp) {

                            var $Icon = (resp.weather[0].icon).substr(0,2);
                            var $weather_description = resp.weather[0].main;
                            var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
                            var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
                            var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
                            var $city = '서울';
                            var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
                            var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + 'º';
                            var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + 'º';
                            

                            $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 130px; width : 150px;"></i>');
                            $('.weather_description').prepend($weather_description);
                            $('.current_temp').prepend($Temp);
                            $('.humidity').prepend($humidity);
                            $('.wind').prepend($wind);
                            $('.city').append($city);
                            $('.cloud').append($cloud);
                            $('.temp_min').append($temp_min);
                            $('.temp_max').append($temp_max);               
                        }
                    })


                  </script>
                <div id="con1_2">
                    <div id="a2" >
                        <a href="<%=contextPath%>/list.tg" style="font-size: 19px; font-weight: bolder;">
                            이번주 등산 일정
                            <img src="resources/image/location.png" alt="" width="15px">
                        </a>
                    </div>
                    <div id="b2">
                        <table>
                            
                        </table>
                    </div>
                </div>
                <div id="con1_3">
                    <div id="a3">
                        <a href="#" style="font-size: 19px; font-weight: bolder;">Editor's Pick!</a>
                    </div>
                    <div id="b3">
                    	<table>
                            <tr>
                                <td>여름철 산행 주의사항</td>
                            </tr>
                            <tr>
                                <td>등산 에티켓 이것만은 꼭! 지켜줘요</td>
                            </tr>
                            <tr>
                                <td>요즘 유행하는 등산 잇템 💛💚</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div id="con2">
              <div id="con2_1">
                    <div id="a4">
						<a href="<%= contextPath %>/listView.bo" style="font-size: 19px; font-weight: bolder;">인기글</a>
                   	<table class="latestBoard" style="margin: 10px 0 0 0;">
						<% if(list.isEmpty()) {%>
					
						<tbody>
						<tr>
							<td>조회된 게시글이 없습니다.</td>
						</tr>
						<% } else { %>
						
						<% for(Board bo : list) { %>
						<tr>
                            <td>
                                
                            </td>
							<td> <a href="<%=contextPath%>/detail.bo?bno=<%= bo.getBoardNo() %>">
                                <%= bo.getBoardTitle() %>
                            </a>
                            
                            </td>
						</tr>
						<% } %>
						<% } %>
						</tbody>
						</table> 
                   
                    </div>
                    <div id="b4"></div>
                </div>
                
               <div id="con2_2">
                    <div id="a5">
                        <a href="<%= contextPath %>/list.no" style="font-size: 19px; font-weight: bolder;">최근 공지사항</a>
                        <div id="realtime">
                    	<table class="recentNotice" style="margin: 10px 0 0 0;">
						<tbody>
						<% if(nlist.isEmpty()) {%>
				
						<tr>
							<td colspan="2">조회된 공지글이 없습니다.</td>
						</tr>
						<% } else { %>

						<% for(Notice no : nlist) { %>
						<tr>
							<td style="width: 315px; margin: 0 0 0 10px;">
                                <a href="<%= contextPath %>/detail.no?num=<%=no.getNoticeNo()%>">
                                    <%= no.getNoticeTitle() %>
                                </a>
                            </td>
                            <td><%= no.getCreateDate() %></td>
						</tr>
						<% } %>
						<% } %>
						</tbody>
						</table>
                            
                        </div>
                    </div>
                    <div id="b5"></div>
                </div>
               
                
            </div>
            <div id="con3">
                <div id="con3_1">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzA4MjVfMjE0%2FMDAxNTAzNjU1MDIwNzIy.RW86PrajpO8ARPzK0DwjI0-Fi0m7rTgrplclQhjlyGog.ySLgC_RUMUA-BbWAFKuoUJLh2L-eHiuG-nyoldYW-uEg.JPEG.caprisun_zin%2F%25B6%25F3%25C7%25AA%25B8%25B6_%25282%2529.jpg&type=a340" id="add1">
                </div>
                <div id="con3_2">
                    <img src="resources/image/add3.png" id="add2">
                </div>
                <div id="con3_3" style="font-size: 18px; font-weight: bolder;">
                    <p id="writers">Top Writers</p>
                    <p style="font-size: 10px;">기준:1달동안의 글,댓글작성등의 활동</p>
                    	<table>
                       
                        </table>
                </div>
            </div>
           
        </div>
    
        <div id="topbtn">
            <a style="display:scroll; position:fixed; bottom:10px; right:5px;" href="#" title="top">
                <img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top">
            </a> 
        </div>



    </div>
<script>
    function submitForm() {
        document.getElementById("postForm").submit();
    }

    $(document).ready(function() {
        let userHtml = ""; 
        $.ajax({
            url: 'topUser.ma', 
            success: function(list) {
                (list);
                
                for (var i = 0; i < list.length && i < 5; i++) {
                    var rank = i + 1;
                    
                    userHtml += '<tr>'
                    + '<td style="color: red">' + rank + '</td>'
                    + '<td>&nbsp;</td>'
                    + '<td><img src="' + list[i].profileImg + '" width="25px" class="topUserimg"></td>'
                    + '<td style="font-size: small;">' + list[i].nickname + '</td>'
                    

                    if (rank === 1) {
                        userHtml += '<td>🥇</td>'
                    } else if (rank === 2) {
                        userHtml += '<td>🥈</td>'
                    } else if (rank === 3) {
                        userHtml += '<td>🥉</td>'
                    } else {
                        userHtml += '<td></td>'
                    }
                    
                    userHtml += '</tr>'
                              
                }
                (userHtml);
                $('#con3_3>table').html(userHtml);
            },
            error: function(xhr, status, error) {
                console.error('Error fetching top writers:', error);
            }
        });
    }); $(document).ready(function() {
        let userHtml = ""; 
        $.ajax({
            url: 'weekClimb.ma', 
            success: function(list) {
                (list);
                
                for (var i = 0; i < list.length; i++) {
                    userHtml+= "<tr><td>"
                            + "<a href=<%= contextPath %>/detail.tg?tno="
                            +list[i].todayNo
                            +">"
                            + list[i].weekClimb
                            + "</a><td></tr>"
                              
                }
                (userHtml);
                $('#b2>table').html(userHtml);
            },
            error: function(xhr, status, error) {
                console.error('Error fetching top writers:', error);
            }
        });
    });

</script>
    <%@ include file="views/common/footerbar.jsp" %>
</body>
</html>