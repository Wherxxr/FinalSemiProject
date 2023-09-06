<%@page import="today.model.vo.Attachment" %>
<%@page import="today.model.vo.Today" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Today t=(Today)request.getAttribute("t"); Attachment at=(Attachment)request.getAttribute("at"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #ff1 {
            font-family: 'NanumBarunGothicExtraLight';
        }

        #ff2 {
            font-family: 'NanumBarunGothicLight';
        }

        #ff3 {
            font-family: 'NanumBarunGothic';
        }

        #ff4 {
            font-family: 'NanumBarunGothicBold';
        }

        /* div{border: 1px solid red; box-sizing: border-box;} */

        #write {
            width: 1200px;
            margin: 0 auto;
        }

        #write1,
        #write2,
        #write3,
        #write4,
        #write5,
        #write6,
        #write7,
        #write8,
        #write9,
        #write10,
        #write11,
        #write12 {
            width: 670px;
            margin: 0 auto;
        }

        #searchimg {
            position: absolute;
            right: 460px;
            /* float: right; */
            margin: 12px 0 0 0;
            width: 15px;
            height: 15px;
            cursor: pointer;
        }

        #mtinput {
            float: right;
        }

        #top {
            width: 50px;
            height: 50px;
        }

        #dateIn {
            width: 650px;
        }
    </style>
</head>

<body>
    <%@ include file="../common/menubar.jsp" %>
        <form id="enroll-form" action="<%= contextPath %>/update.to" method="post"
            enctype="multipart/form-data">
            <input type="hidden" name="bno" value="<%= t.getTodayNo() %>" />

            <div id="write">
                <div id="write1">
                    <p id="ff4">썸네일 <em style="color: red;">*</em></p>
                    <div class="uploadimg">
                        <% if(at !=null) { %>
                            <input type="hidden" name="originFileNo" value="<%= at.getFileNo()%>" />
                            <img src="<%= contextPath %>/<%= at.getFilePath() %>/<%=at.getChangeName() %>"
                                id="titleImg" width="250" height="170" onclick="chooseFile(1);">
                        <% } else {%>
                            <img src="" id="titleImg" width="250" height="170"
                                onclick="chooseFile(1);">
                        <% }%>
                        <div id="file-area" style="display:none">
                            <input type="file" name="upfile" id="file1"
                                onchange="loadImg(this, 1);">
                        </div>
                    </div>
                </div>
                <br>
                <div id="write2">
                    <p id="ff4">제목 <em style="color: red;">*</em></p>
                    <input type="text" class="input" name="title" maxlength="35"
                        placeholder="제목을 입력해 주세요." value="<%= t.getTodayTitle()%>" required>
                </div>
                <br>
                <div id="write3">
                    <p id="ff4">본문 <em style="color: red;">*</em></p>

                    <textarea class="summernote" name="content" rows="10"
                        style="resize: none;" required><%= t.getTodayContent() %></textarea>
                </div>
                <br>
                <div id="write4">
                    <p id="ff4">하이킹팁 <em style="color: red;">*</em></p><br><input type="text"
                        style="width: 650px; height: 100px; margin: 5px 0 0 0;" name="tip" required>
                </div>
                <br>
                <div id="write5">
                    <p id="ff4">해시태그</p><input type="text" style="width: 650px; margin: 5px 0 0 0;"
                        placeholder="# 해시태그 입력(15자),(스페이스바)를 눌러주세요." name="hash"
                        value="<%= t.hashCode() %>" required>
                    <br><br><button class="btn btn-l"
                        style="border: 0px; background-color: rgb(175, 212, 133);">#아차산</button>
                    <br>
                    <h9 style="font-size: small; color: gray;">스페이스바를 누르면 해시태그가 완성돼요. 최대
                        5개</h9>
                </div>

                <br>
                <div id="write6">
                    <span id="ff4">🌄산 정보</span> <span id="mtinput"><input type="text"
                            placeholder="입력해주세요"
                            style="text-align: right; border-style: none; font-weight: 600; margin: 0 10px 0 0;"></span>
                    <hr>
                    <span id="ff3">산 이름</span><span
                        style="font-size: small; font-weight: 600; color: gray;"> *종주는
                        여러 산을 선택, 산이 없다면 '기타'를 선택해주세요</span>
                    <br><input type="text" style="width: 650px; margin: 5px 0 0 0;"
                        placeholder="산을 검색해주세요" name="mtname" value="<%= t.getTodayName() %>" required>
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/board_top_search_btn.png"
                        id="searchimg">
                    <hr>
                </div>
                <br>
                <div id="write7">
                    <span id="ff4">📅등산일자</span>
                    <hr>
                    <h6 id="ff4">등산일자와 대략적인 출발 시간</h6>
                    <input type="date" name="dateIn" id="dateIn" value="<%= t.getTodayDate()%>" required>
                    <hr>
                </div>
                <br>
                <div id="write8">
                    <span id="ff4">🕒소요시간</span><br>
                    <input type="text" style="width: 650px; margin: 5px 0 0 0;" name="climbtime"
                        value="<%= t.getTodayTime()%>" required><br><br>

                    <hr>
                </div>

                <div id="write9">
                    <span id="ff4">📍루트</span><br>
                    <input type="text" style="width: 650px; margin: 5px 0 0 0;"
                        placeholder="ex) 탐방지원센터, 연주암, 백운대" name="route"
                        value="<%= t.getTodayCourse() %>" required><br><br>
                    <button type="button" class="btn btn-success" style="width: 650px;">+
                        지점추가</button>
                    <hr>
                </div>

                <div id="write10">
                    <span id="ff4">🚶‍♂️레벨</span> <span id="mtinput"><input type="text"
                            placeholder="입력해주세요" value="<%= t.getLev() %>"
                            style="text-align: right; border-style: none; font-weight: 600; margin: 0 10px 0 0;"
                            name="lev" required></span>
                    <hr>
                    <button type="button" class="btn btn-outline-secondary">매우 쉬움</button>
                    <button type="button" class="btn btn-outline-secondary">쉬움</button>
                    <button type="button" class="btn btn-outline-secondary">보통</button>
                    <button type="button" class="btn btn-outline-secondary">어려움</button>
                    <button type="button" class="btn btn-outline-secondary">매우
                        어려움</button>
                    <hr>
                </div>

                <div id="write11">
                    <span id="ff4">🚌교통</span> <span id="mtinput"><input type="text"
                            placeholder="입력해주세요" value="<%= t.getTodayVehicle() %>"
                            style="text-align: right; border-style: none; font-weight: 600; margin: 0 10px 0 0;" required></span>
                    <hr>

                    <div id="ff4">
                        <input type="checkbox" name="transport" id="car"
                            style="width: 17px; height: 17px; margin: 0 5px 0 0;">
                        <label for="car">자차/택시</label><br>
                        <input type="checkbox" name="transport" id="traffic"
                            style="width: 17px; height: 17px; margin: 0 5px 0 0;">
                        <label for="traffic">대중교통</label><br>
                        <input type="checkbox" name="transport" id="etc"
                            style="width: 17px; height: 17px; margin: 0 5px 0 0;">
                        <label for="etc">기타</label><br>

                    </div>
                </div>

                <br>
                <div align="right" id="write12">
                    <button type="button" class="btn btn-light" id="ff4">취소</button>
                    <button type="button" class="btn btn-light" id="ff4">임시저장</button>
                    <button type="submit" class="btn btn-primary" id="ff4">저장</button>
                </div>
            </div>
            </div>
        </form>
        <div id="topbtn">
            <a style="display:scroll;position:fixed;bottom:10px;right:5px;" href="#" title="top">
                <img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top" alt="">
            </a>
        </div>
        <script>
            function chooseFile(num) {
                $("#file" + num).click();
            }

            function loadImg(inputFile, num) {
                if (inputFile.files.length == 1) {
                    const reader = new FileReader();
                    reader.readAsDataURL(inputFile.files[0]);
                    reader.onload = function (e) {

                        switch (num) {
                            case 1: $("#titleImg").attr("src", e.target.result); break;
                            case 2: $("#contentImg1").attr("src", e.target.result); break;
                            case 3: $("#contentImg2").attr("src", e.target.result); break;
                            case 4: $("#contentImg3").attr("src", e.target.result); break;
                        }
                    }

                } else { // 선택된 파일이 취소된 경우 => 미리보기 한것도 사라지게
                    switch (num) {
                        case 1: $("#titleImg").attr("src", null); break;
                        case 2: $("#contentImg1").attr("src", null); break;
                        case 3: $("#contentImg2").attr("src", null); break;
                        case 4: $("#contentImg3").attr("src", null); break;
                    }
                }
            }

            $('.summernote').summernote({
                height: 450,
                lang: "ko-KR",

                toolbar: [
                    // [groupName, [list of button]]
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                    ['color', ['forecolor', 'color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['view', ['fullscreen', 'help']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
            });

        </script>
</body>

</html>