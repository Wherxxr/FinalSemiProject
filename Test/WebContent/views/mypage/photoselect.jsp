<%@page import="member.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");   
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>산 선택</title>
    <style>
        .outer {
            background-color: rgba(128, 128, 128, 0.169);
            color: rgba(0, 0, 0, 0.727);
            width: 1000px;
            height: 800px;
            margin: auto;
            margin-top: 50px;
            padding: 20px; 
            font-family: 'NanumBarunGothic';
        }

        #selectphoto {
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

        .dynamic-button {
            border: none;
            background-color: rgb(149, 193, 31);
            color: white;
            border-radius: 8px; 
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
        }

        #completedMountainsContainer {
            margin-left: 100px;
            margin-right: 100px;
            display: flex;
            flex-wrap: wrap;
        }
        .dynamic-image {
            margin: 0 5px 5px 0;
            margin-top: 10px;
        }
        .addfile {
            margin-top: 10px;
        }
        tr{
            margin: auto;
        }
        #imgs>td{
           width: 240px;
           text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="mypageheader.jsp" %>
<div class="outer">
    <div id="selectphoto">사진 선택
    </div>

    <div id="itemList">본인을 표현할수있는 사진을 올려주세요</div>
    <form id="imageForm" action="<%= contextPath %>/updateimg.me" method="POST" enctype="multipart/form-data">
    <input type="hidden" id="userNo" name="userNo" value="<%= loginMember.getUserNo() %>">
    <table>
        <tr id="imgs">
            <td>
                <img id="contentImg1" width="180" height="180" onclick="chooseFile(1);"
                    src="<%= list.size() > 0 ? request.getContextPath() + "/" + list.get(0).getFilePath() + "/"
                            + list.get(0).getChangeName() : "" %>">
                <input type="hidden" name="originFileNo1" value="<%= list.size() > 0 ? list.get(0).getFileNo() : "" %>">
            </td>
            <td>
                <img id="contentImg2" width="180" height="180" onclick="chooseFile(2);"
                    src="<%= list.size() > 1 ? request.getContextPath() + "/" + list.get(1).getFilePath() + "/"
                            + list.get(1).getChangeName() : "" %>">
                <input type="hidden" name="originFileNo2" value="<%= list.size() > 1 ? list.get(1).getFileNo() : "" %>">
            </td>
            <td>
                <img id="contentImg3" width="180" height="180" onclick="chooseFile(3);"
                    src="<%= list.size() > 2 ? request.getContextPath() + "/" + list.get(2).getFilePath() + "/"
                            + list.get(2).getChangeName() : "" %>">
                <input type="hidden" name="originFileNo3" value="<%= list.size() > 2 ? list.get(2).getFileNo() : "" %>">
            </td>
            <td>
                <img id="contentImg4" width="180" height="180" onclick="chooseFile(4);"
                    src="<%= list.size() > 3 ? request.getContextPath() + "/" + list.get(3).getFilePath() + "/"
                            + list.get(3).getChangeName() : "" %>">
                <input type="hidden" name="originFileNo4" value="<%= list.size() > 3 ? list.get(3).getFileNo() : "" %>">
            </td>
        </tr>
    </table>
        <div id="file-area" style="display:none">
            <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
            <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
            <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
            <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
        </div>

        
<div align="center">
    <button type="submit" class="btn btn-sm btn-secondary">수정완료</button>
</div>
</form>
</div>
<script>
    $(function () {
        (document.getElementsByName("originFileNo1")[0].innerHTML);
        (document.getElementsByName("originFileNo1")[0].value);
        (document.getElementsByName("originFileNo1")[0].textContent);
        });


    // JavaScript 변수에 기존 이미지의 경로 저장
    var originalImage1 = "<%= list.size() > 0 ? request.getContextPath() + "/" + list.get(0).getFilePath() + "/" + list.get(0).getChangeName() : "" %>";
    var originalImage2 = "<%= list.size() > 1 ? request.getContextPath() + "/" + list.get(1).getFilePath() + "/" + list.get(1).getChangeName() : "" %>";
    var originalImage3 = "<%= list.size() > 2 ? request.getContextPath() + "/" + list.get(2).getFilePath() + "/" + list.get(2).getChangeName() : "" %>";
    var originalImage4 = "<%= list.size() > 3 ? request.getContextPath() + "/" + list.get(3).getFilePath() + "/" + list.get(3).getChangeName() : "" %>";

    function chooseFile(num){
        $("#file"+num).click();
    }	
    
    function loadImg(inputFile, num){
        if(inputFile.files.length == 1){ 
            const reader = new FileReader();
            reader.readAsDataURL(inputFile.files[0]);
            reader.onload = function(e){
                // e.target.result => 읽어들인 파일의 고유한 url
                switch(num){
                    case 1: $("#contentImg1").attr("src", e.target.result); break;
                    case 2: $("#contentImg2").attr("src", e.target.result); break;
                    case 3: $("#contentImg3").attr("src", e.target.result); break;
                    case 4: $("#contentImg4").attr("src", e.target.result); break;
                }
            }
        } else { // 선택된 파일이 취소된 경우 => 미리보기 한 것도 사라지게
            switch(num){
                case 1: 
                    // 이미지를 수정하지 않는 경우, 이전 이미지의 경로를 다시 설정
                    $("#contentImg1").attr("src", originalImage1); 
                    break;
                case 2: 
                    $("#contentImg2").attr("src", originalImage2); 
                    break;
                case 3: 
                    $("#contentImg3").attr("src", originalImage3); 
                    break;
                case 4: 
                    $("#contentImg4").attr("src", originalImage4); 
                    break;
            }
        }
    }
</script>

</body>
</html>
