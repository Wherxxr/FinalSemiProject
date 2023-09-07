<%@page import="member.model.vo.Member"%>
<%@page import="qBoard.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    Qna q = (Qna)request.getAttribute("q");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        .outer{
            width: 1200px;
            margin: auto;
            margin-top: 50px;
            box-sizing: border-box;
            /* border: 1px solid black; */
        }
        .wrap{
            width: 800px; 
            /* border: 1px solid red; */
            margin: auto;
            font-family: 'NanumBarunGothic';
        }
        #header, #bar {
            border: none;
            border-bottom: 2px solid lightgray;
            padding: 10px;
            padding-bottom: 7px;
            margin-top: 20px;
        }
        
        #header>*{margin: 15px;}
        #h_etc{margin-bottom: 2px;}
        #subject{font-size: 20px; color: rgb(149, 193, 31);}
        #title{font-size: 40px;}
        #writer{font-size: 20px;}
        #h_etc{font-style: 10px; color: gray;}

        #content{
            padding: 15px;
            padding-top: 30px;
            font-size: 20px;
            line-height: 35px;
            /* border: 1px solid black; */
            margin-bottom: 100px;
        }

        #h_etc>span, #bar>span, #cmt_etc>span{margin-right: 10px;}
        #comment{
            padding: 20px;
          
        }
        
        #comment-area1{
            border: none;
            background-color: rgb(244, 244, 244);
            padding: 10px;
            margin-top: 10px;
        }
        #comment-area1>*{margin: 5px;}
        #cmt_id{font-size: 15px; font-weight: bold;}
        #cmt_txt{margin-top: 10px; margin-bottom: 10px; font-size: 14px;}
        #cmt_etc{font-size: 12px; color: gray;}
        #comment-area2{
            border: 1px solid gray;
            border-radius: 5px;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 30px;
        }
        #cmt_btn{
            padding-right: 10px;
        }
        #cmt_btn>button{
            border: none;
            width: 60px;
            height: 30px;
            font-family: 'NanumBarunGothic';
        }
    </style>
</head>
<body>
 <%@ include file="../common/menubar.jsp" %>
    <div class="outer">
       <h2 align="center">문의글 상세보기</h2> <br>
         <div class="wrap">
            <div id="header">
                <div id="title"><%= q.getqTitle() %></div>
                <div id="writer"><%= loginMember.getUserId() %></div>
                <div id="h_etc">
                    <span><%= q.getqDate() %></span>
                    <span><%= q.getCount() %></span>
                </div>
                
            </div>
            <div id="content">
                <%= q.getqContent() %>
            </div>

            <div align="center">
                <a href="<%= contextPath %>/qna.se" class="btn btn-sm btn-secondary" style="width: 90px; height: 35px; font-size: medium;">목록가기</a>
                <a href="<%= contextPath %>/qUpdateForm.se?qno=<%= q.getqNo() %>" class="btn btn-sm btn-warning" style="width: 90px; height: 35px; font-size: medium;">수정하기</a>
                <a href="<%= contextPath %>/qDeleteForm.se?qno=<%= q.getqNo() %>" class="btn btn-sm btn-danger" style="width: 90px; height: 35px; font-size: medium;">삭제하기</a>

            
            </div>
            
            <div id="comment">
                <div id="comment-area2">
                        <textarea name="comment" class="comment" style="resize: none; border: none; width: 95%; height: 50px;" placeholder="댓글을 입력하세요"></textarea>
                        <div id="cmt_btn" align="right">
                            <button type="reset">취소</button>
                            <button onclick="insertReply();">등록</button>
                        </div>
                </div>
                <b>댓글</b>
                <div id="comment-area1">
                <!-- 여기와서 꽂힘 -->        
                </div>
                </div>
                <!-- 비회원은 disabled -->
            </div>
        </div>
    </div>
    <input type="hidden" id="qno"  value="<%= q.getqNo()%>">



	<script>
    $(function(){
    	selectReplyList();
    });
    
    
    // ajax로 댓글 작성용
    function insertReply(){
    	$.ajax({
    		url:"qrinsert.se",
    		data:{
    			comment: $(".comment").val(),
    			bno: $("#qno").val()
    		},
    		type:"post",
    		success:function(result){
    			if(result > 0){ // 댓글 작성 성공! => 갱신된 댓글 리스트 조회
    					selectReplyList();
    					$(".comment").val("");
    			}
    		}, error: function(){
    			
    		}
    	})
    }
   
    
    // 댓글 목록 조회용
    function selectReplyList() {
			$.ajax({
				url : "qrlist.se",
				data : {
					bno : $("#qno").val()
				},
				success : function(list) {

					let result = "";
					for (let i = 0; i < list.length; i++) {
						result += "<div id='comment-area1'>"
						    + "<div id='cmt_id'>" + list[i].userId + "</div>"
						    + "<div id='cmt_txt'>" + list[i].qReplyContent + "</div>"
						    + "<div id='cmt_etc'>" + list[i].createDate + "</div>"
						    + "</div>";

					}
					$("#comment-area1").html(result);
				},
				error : function() {
					
				}
			})
		}
	</script>


</body>
</html>
