<%@ page import="java.util.ArrayList" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <style>
                .outer {
                    background-color: white;
                    /*border: 1px solid #000;*/
                    width: 1000px;
                    height: 100%;
                    margin: auto;
                    margin-top: 50px;
                }

                #enroll-form table {
                    border: 1px solid white;
                }

                #enroll-form input,
                #enroll-form textarea {
                    width: 100%;
                    box-sizing: border-box;
                }

                .input_box textarea.input {
                    padding: 15px 0;
                    height: auto;
                    resize: none;
                }

                .Write_btn_area {
                    float: right;
                }

                .wrap>div {
                    width: 100%;
                    padding: 3px;
                }

                #header {
                    height: 10%;
                    border: 1px solid gray;
                }

                #footer {
                    height: 10%;
                    border: 1px solid gray;
                }

                #navigator {
                    height: 5%;
                    border: 1px solid gray;
                    margin: 10px 0px 5px 0px;
                }

                #content {
                    width: 100%;
                }

                .content_1 {
                    height: 10%;
                }

                .content_2 {
                    height: 15%;
                }

                #content_3 {
                    height: 20%;
                }

                #content_4 {
                    height: 65%;
                }

                #topbtn {
                    position: fixed;
                    right: 24px;
                    bottom: 24px;
                    z-index: 50;
                }

                div#editor {
                    padding: 16px 24px;
                    border: 1px solid #d6d6d6;
                    border-radius: 4px;
                }

                div#editor img {
                    max-width: 100%;
                }

                button.active {
                    background-color: purple;
                    color: #fff;
                }

                #img-selector {
                    display: none;
                }

                [contenteditable=true]:empty:before {
                    content: attr(placeholder);
                    display: block;
                }

                .dropdown-toggle::after {
                    display: none;
                }

                .input {
                    width: 50%;
                    height: 50px
                }

                h2{
                    color: rgb(149, 193, 31);
                }

            </style>

        </head>

        <body>
            <%@ include file="../common/menubar.jsp" %>

                <div class="outer">
                    <br>
                    <h2 align="center">공지사항 작성</h2>
                    <br>
                    <form action="<%= contextPath %>/insert.no" id="enroll-form" method="post">

                            <div id="content">
                                <div class="Write_write_sections">
                                    <div class="Write_container content_1">
                                        <div class="write_box">
                                            <p class="title">제목 <span class="color_red">*</span></p>
                                            <input type="text" class="input" name="title" maxlength="35"
                                                placeholder="제목을 입력해 주세요." value="" required>
                                        </div>

                                        <div class="write_box">
                                             <br>
                                            <p class="content">본문<span class="color_red">*</span></p>
                                            <textarea class="nef_textArea1" name="content" rows="10" required style="resize: none;" placeholder="내용을 입력해 주세요." id="inField"></textarea>
                                        </div>

                                    </div>
									<br>
                                    <div class="Write_btn_area">
                                        <button type="reset" class="btn btn-warning">취소</button>
                                        <button type="submit" class="btn btn-secondary">등록</button>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                    <script>
                    const nef_textArea1 = document.querySelector(".nef_textArea1");

                    nef_textArea1.addEventListener("keydown", () => {
                        (nef_textArea1.value);
                        localStorage.setItem("textArea", nef_textArea1.value);
                    });

                    window.onload = () => {
                        if(localStorage.getItem("textArea")){
                            if(confirm("최근 작성한 글을 불러오시겠습니까?")){
                                (localStorage.getItem("textArea"));

                                document.querySelector(".nef_textArea1").innerText =
                                localStorage.getItem("textArea");
                            } else{
                                localStorage.removeItem("textArea");
                            }
                        }
                    }

                    </script>

                
            <br><br>
			<%@ include file="../common/footerbar.jsp" %>
</body>
</html>