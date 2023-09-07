<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%
  ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
  %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원피드-프로필</title>
  
    <style>

      .wrap {
        margin: auto;
        width: 1000px;
      }

      .complete-mt,
      .career-mt,
      .photo {
        color: rgb(60, 60, 60);
        font-size: 18px;
      }

      .container {
        margin-left: 100pz;
        margin-top: 10px;
      }

      .my_btn {
        width: 70px;
        height: 30px;
        font-size: 13px;
        background-color: whitesmoke;
        color: gray;
        border: none;
        border-radius: 20px;
        margin-left: 2px
      }

      .edit_button {
        margin-left: auto;
        border: white;
      }


      .mpprofile {
        font-size: 20px;
        font-weight: bold;
      }

      .mpprofile::after {
        content: "";
        display: block;
        width: 150px;
        border-bottom: 2.5px solid rgb(149, 193, 31);
        margin: auto;
      }
    </style>
  </head>

  <body>
    <%@ include file="myfeedheader.jsp" %>
<div class="wrap">
        <br><br>
        <div class="complete-mt">등반완료 산
		    <!-- 등산완료 산 버튼-->
		    <div class="container">
		    <%if (m.getCompleteMt()==null) {  %>
		    <span>등반완료한산을 추가해주세요!</span>
		    <%} else { %>
		        <% 
		        String[] mtlists = m.getCompleteMt().split(",");
		        for (String mtlist : mtlists) { 
		        %>
		        	<button type="button" class="my_btn"><%= mtlist %></button>
		        <% } %>
	        <% } %>
         
		        <div class="round-button-container"></div>
		    </div>
		</div>
        <br>

       <br>

        <div class="photo"> 대표사진
          <div class="imageAll" style="margin-top: 10px;">
          <%if(list.isEmpty()){ %>
          	<span>대표사진을 추가해주세요.</span>
          <%} else { %>
          	<% for(int i=0; i<list.size(); i++){ %>
            	<img src="<%= contextPath %>/<%= list.get(i).getFilePath()%>/<%=list.get(i).getChangeName()%>" width="150" height="150">
          	<% } %>
          <% } %>
          </div>
        </div>
 </div>

  
  
<%@ include file = "../common/footerbar.jsp" %>
  </body>

  </html>	