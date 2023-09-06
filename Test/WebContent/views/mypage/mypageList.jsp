<%@page import="java.util.ArrayList" %>
    <%@page import="board.model.vo.Board" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
            int listCount = (int)request.getAttribute("listCount");
                    %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Document</title>

                        <style>
                            div,
                            form,
                            input {
                                box-sizing: border-box;
                                /* border: 1px solid red; */
                            }

                            .wrap {
                                width: 1200px;
                                height: 1800px;
                                margin: auto;
                            }

                            #content {
                                width: 1000px;
                                height: 1440px;
                                margin: auto;
                            }

                      
                            #content_2 {
                                height: 30px;
                            }

                          

                            .mplist {
                                font-size: 20px;
                                font-weight: bold;
                            }

                            .mplist::after {
                                content: "";
                                display: block;
                                width: 150px;
                                border-bottom: 2.5px solid rgb(149, 193, 31);
                                margin: auto;
                            }

                            #content_3 {
                                height: 300px;
                                width: 800px;
                                margin: auto;
                            }

                            #content_3 h3 {
                                color: gray;
                            }

                            #profileImage {
                                width: 80px;
                                height: 150px;
                                float: left;
                            }

                            .other {
                                width: 720px;
                                height: 150px;
                                float: left;
                            }

                            .like,
                            .bookmark {
                                float: left;
                                width: 360px;
                            }

                            .bookmark {
                                text-align: right;
                            }

                            li>div {
                                height: 300px;
                            }

                            .bookmark:hover,
                            .item:hover {
                                cursor: pointer;
                            }

                            .profile-image {
                                margin: 7px;
                                border-radius: 50%;
                                width: 50px;
                                height: 50px;
                            }

                            .b-name {
                                font-weight: 900;
                                font-size: 20px;
                            }

                            .b-time {
                                font-size: 13px;
                                color: gray;
                            }

                            .b-course {
                                font-size: 17px;
                                font-weight: 700;
                                color: rgb(83, 83, 83);
                            }

                            .b-content {
                                font-size: 17px;
                            }

                            .b-image>img {
                                width: 125px;
                                height: 125px;
                                padding: 5px;
                            }

                            .titleprofile>img {
                                margin-left: 10px;
                                margin-top: 10px;
                                border-radius: 50%;
                                width: 150px;
                                height: 150px;
                            }


                            .bookmark:hover,
                            .item:hover {
                                cursor: pointer;
                            }

                            .etc img {
                                width: 40px;
                                height: 40px;
                            }

                            #topbtn {
                                position: fixed;
                                right: 24px;
                                bottom: 24px;
                                z-index: 50;
                            }
                            .listCount{
                                text-align: left;
                                color: gray;
                                margin: 15px 0px 10px 130px;
                                font-size: large;
                            }
                        </style>
                    </head>

                    <body>
                        <%@ include file="mypageheader.jsp" %>
                            <div class="wrap">
                                <div id="content">
                                    <% if(list.isEmpty()){ %>
                                        <!-- case1. 게시글이 없을경우 -->
                                      조회된 게시글이 없습니다.
                                        <% } else { %>
                                            <!-- case2. 게시글이 있을경우 -->
                                            <br>
                                            <div>
                                                <p class="listCount">내 게시물 <%= listCount %>개(최근 5개글만 보입니다.)</p>
                                            </div>
                                            <br>
                                            <ul style="list-style: none; padding: 0;">
                                                <% for(Board b : list) { %>
                                                    <div id="content_3">
                                                        <li>
                                                            <div>
                                                                <div id="profileImage">
                                                                    <img class="profile-image"
                                                                        src="<%=contextPath %>/<%= loginMember.getProfileImg() %>"
                                                                        alt="">
                                                                </div>
                                                                <div class="other">
                                                                    <div class="b-name">
                                                                        <p style="margin: 0;">
                                                                            <%= b.getBoardWriter() %>
                                                                        </p>
                                                                    </div>
                                                                    <div class="b-time">
                                                                        <p>
                                                                            <%= b.getCreateDate() %>
                                                                        </p>
                                                                    </div>
                                                                    <div class="b-course">
                                                                        <p>인왕산 등산 코스 : 초보자가 선택했던 경복궁 코스</p>
                                                                    </div>
                                                                    <div class="b-content">
                                                                        <p>
                                                                            <%= b.getBoardContent() %>
                                                                        </p>

                                                                    </div>
                                                                    <br clear="right">
                                                                    <div class="etc">
                                                                        <div class="like">
                                                                            <img name="likey" class="item"
                                                                                src="https://cdn-icons-png.flaticon.com/512/14/14815.png"
                                                                                alt="" onClick="setLike()">
                                                                            좋아요
                                                                        </div>
                                                                        <div class="bookmark">
                                                                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHcKgGArmldqjLgZ3n2HIogmWevXJT4_SXbySqfjm2BGK3PXAWPoaKu0PdbbXUaQNzpUU&usqp=CAU"
                                                                                alt="공유">
                                                                            <img name="icon_btn" class="item"
                                                                                src="https://cdn-icons-png.flaticon.com/512/1174/1174410.png"
                                                                                alt="북마크" onClick="setImg()">
                                                                            <img src="https://cdn-icons-png.flaticon.com/512/7066/7066144.png"
                                                                                alt="설정">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </div>
                                                        <% } %>
                                                            <% } %>
                                            </ul>
                                </div>
                            </div>
                            

                            <div id="topbtn">
                                <a href="#"><img
                                        src="https://blog.kakaocdn.net/dn/8Q2Lz/btrcOS9MCg8/GNshUKOnQXIjXq2nKhcYf1/img.png"
                                        style="width: 40px; height: 40px;"></a>
                            </div>

                            

                            <script>
                                var set_state = true;

                                var img_icon = new Array();

                                img_icon[0] = new Image();

                                img_icon[1] = new Image();

                                img_icon[0].src = "https://cdn-icons-png.flaticon.com/512/1174/1174410.png";

                                img_icon[1].src = "https://cdn-icons-png.flaticon.com/512/1174/1174484.png";



                                function setImg() {

                                    document.all.icon_btn.src = (set_state ? img_icon[0].src : img_icon[1].src);
                                    if (set_state) {
                                        set_state = false;
                                    } else {
                                        set_state = true;
                                    }

                                }

                            </script>
                            <script>
                                var set_state2 = true;

                                var like = new Array();

                                like[0] = new Image();

                                like[1] = new Image();

                                like[0].src = "https://cdn-icons-png.flaticon.com/512/14/14815.png";

                                like[1].src = "https://cdn-icons-png.flaticon.com/512/138/138533.png";



                                function setLike() {

                                    document.all.likey.src = (set_state2 ? like[0].src : like[1].src);
                                    if (set_state2) {
                                        set_state2 = false;
                                    } else {
                                        set_state2 = true;
                                    }

                                }

                            </script>
                            <%@ include file = "../common/footerbar.jsp" %>
                    </body>

                    </html>