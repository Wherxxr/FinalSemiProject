<%@page import="today.model.vo.Attachment"%>
<%@page import="today.model.vo.Today"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Today t = (Today)request.getAttribute("t");
	Attachment at = (Attachment)request.getAttribute("at");

    String[] hashtagList = new String[20];
	
    if(t.getHashtag() != null){
    String hashtag = t.getHashtag().trim().replaceAll(" ", "");
    hashtagList = hashtag.split(",");				
    }
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <title>자유게시판 글 상세</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    
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

         /*내용*/
         #content{
            padding: 15px;
            padding-top: 30px;
            /* margin-bottom: 100px; */
            font-size: 20px;
            line-height: 30px;
            /* border: 1px solid black; */
        }
        #content>table{
            margin-top: 30px;
            width: 80%;
           /* border: 3px solid rgb(149, 193, 31); */
           background-color: rgb(244, 244, 244);
            border-radius: 7px;
        }
        
        
        #content th{font-size: 17px; color: rgb(77, 77, 77); }
        #content td{padding: 15px; font-weight: bolder; font-size: 19px;}
        
        #content>table>tr{border-bottom: 1px solid lightgray;}

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
        .cmt_id{font-size: 15px; font-weight: bold;}
        .cmt_txt{margin-top: 10px; margin-bottom: 10px; font-size: 14px;}
        .cmt_etc{font-size: 12px; color: gray;}
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

        #content1{
            padding-bottom: 100px;
        }
       
        .img1{
            width: 800px;
            height: 500px;
        }
        #bar>button{
            border: none;
            background-color: rgba(0, 0, 0, 0);
            font-size: 14px;
        }
        .hashtag{
            display: inline-block;
            border: 1px solid lightgray;
            padding: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            border-radius: 10%;
            color:white;
            background-color: rgb(190, 188, 188);
            margin-right: 4px;
            font-size: 15px;
        }

        #hashtag{
            padding-left: 10px;
        }
        
        .modal-body>form>p{
            margin: 10px;
        }

        .deleteReply-btn{
            margin: 0;
            color: tomato;
            margin-top: 5px;
            cursor: pointer;
        }
        #writer:hover{
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <%@ include file = "../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
            <div id="header">
                <div id="title"><%= t.getTodayTitle() %></div>
                <div id="writer"onclick="userProfile(<%= t.getUserNo()%>)"><%= t.getTodayWriter() %></div>
                <div id="h_etc">
                    <span><%= t.getCreateDate() %></span>
                    <span><%= t.getCount() %></span>
                </div>
                
            </div>
            <div id="content">
                <h1 style="background-color:rgb(149, 193, 31); padding:10px; font-size: 27px; color: white;">오등완 정보</h1>

                <table>
                    <tr>
                        <th width="170">산</th>
                        <td><%= t.getTodayName() %></td>
                    </tr>
                    
                    <tr>
                        <th>등산일자</th>
                        <td><%= t.getTodayDate().substring(0, 10) %></td>
                    </tr>
                    <tr>
                        <th>소요시간</th>
                        <td><%= t.getTodayTime() %></td>
                    </tr>
                    <tr>
                        <th>등산루트</th>
                        <td><%= t.getTodayCourse() %></td>
                    </tr>
                    <tr>
                        <th>등산레벨</th>
                        <td><%= t.getLev() %></td>
                    </tr>
                    <tr>
                        <th>교통수단</th>
                        <td><%= t.getTodayVehicle() %></td>
                    </tr>
                </table>
                <table id="tip">
                    <tr>
                        <td style="padding: 20px; padding-bottom: 10px;">하이킹 팁</td>
                    </tr>
                    <tr>
                       <td style="font-size: 15px; padding-top: 0px;"><%= t.getTodayTip() %></td> 
                    </tr>
                </table>
            </div>
            <br><br><br>
            <div id="content1">
                <h1 style="background-color:rgb(149, 193, 31); padding:10px; padding-bottom: 10px; color: white;">오등완 이야기</h1>
               
                	<% if (at!=null) { %>

                    	<img class="img1" src="<%= at.getFilePath() %>/<%= at.getChangeName()%>"></img>
                	<% } %>
               
                <%=t.getTodayContent()%>
            </div>
            <div id="hashtag">
                <%if(hashtagList[0] != null){ %>
                    <% for(int i=0; i<hashtagList.length; i++){ %>
                        <div class="hashtag">
                            # <%= hashtagList[i] %>
                        </div>
                    <%} %>
                <%}else{ %>
                    <div></div>
                <%} %>
                </div>
                <br>
          
            <div align="center">
                <a href="<%= contextPath %>/todayView.to" class="btn btn-sm btn-secondary">목록가기</a>
                <% if(loginMember != null && loginMember.getNickname().equals(t.getTodayWriter())){ %>
                <a href="<%= contextPath %>/updateForm.to?bno=<%= t.getTodayNo() %>" class="btn btn-sm btn-warning">수정하기</a>
                <input type="hidden" name = "bno" value="<%= t.getTodayNo() %>"/>
            
                <a href="<%= contextPath %>/delete.to?bno=<%= t.getTodayNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
                <% }else if(loginMember.getUserNo() == 1){ %>
                <a href="<%= contextPath %>/delete.to?bno=<%= t.getTodayNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
                <%} %>
            </div>
            <div id="bar" align="right">
                <button type="button" data-toggle="modal" data-target="#reportBoard">신고</button>
                <button id="like1" onclick="insertLike();">좋아요 🤍</button>
                <button id="like2" style="display: none;" onclick="deleteLike();">좋아요 💚</button>
                <button id="bookmark1" onclick="insertBook();"><img src="views/resources/img/bookmark_blank.png" width="25" height="25"></button>
                <button id="bookmark2" onclick="deleteBook();" style="display: none;"><img src="views/resources/img/bookmark.png" width="25" height="25"></button>
            </div>
            <div id="comment">
                <b>댓글 <span id="countReply">보기와 작성은 로그인 후 가능합니다</span></b>
                <div id="comment-area2">
                
                <% if(loginMember != null) { %>
                        <!-- 로그인한 사용자만 보이는 화면 -->
                       <textarea name="comment" id="replyContent" style="resize: none; border: none; width: 95%; height: 50px;" placeholder="댓글을 입력하세요"></textarea>
                        <div id="cmt_btn" align="right">
                            <button type="reset">취소</button>
                            <button onclick="insertReply();">등록</button>
                        </div>
                        <% } else { %>
                        <!-- 로그인 안한 사용자가 보는 화면 -->
                            <textarea cols="50" rows="3" style="resize: none;" readonly>로그인 후 이용가능한 서비스입니다.</textarea>
                            <div id="cmt_btn" align="right">
                            <button disabled>취소</button>
                            <button disabled>등록</button>
                        </div>
                        <%} %>
                    
                </div>
                
                <div id="comment-area1"></div>
            </div>
        </div>
    </div>
    <script>



  function userProfile(userNo) {
    // userNo를 사용하여 URL을 생성
    location.href = '<%= contextPath %>/feedProfile.me?userNo=' + userNo;

  }
    let bno = "<%= t.getTodayNo()%>";
	<% if(loginMember != null){%>
		let userNo = "<%= loginMember.getUserNo()%>";
         function insertLike(){
 
            
           $.ajax({
            url:"like.to",
            data:{todayNo:bno, userNo:userNo},
            success:function(result){
                
                if(result == 'Y'){
                	$("#like1").css("display", "none");
                    $("#like2").css("display", "");
                }
            },
            error:function(){
                
            }
           })
        }
        
        function deleteLike(){
      
           $.ajax({
            url:"likeDelete.to",
            data:{todayNo:bno, userNo:userNo},
            success:function(result){
                
                if(result == 'Y'){
                	$("#like2").css("display", "none");
                    $("#like1").css("display", "");
                }
            },
            error:function(){
                
            }
           })
        }
        
        $(function(){
            
            $.ajax({
                url:"likeCheck.to",
                data:{todayNo:bno, userNo:userNo},
                success:function(result){
                    ;
                    if(result == 'Y'){
                    	$("#like2").css("display", "");
                        $("#like1").css("display", "none");
                    }else{
                    	$("#like2").css("display", "none");
                        $("#like1").css("display", "");                    	
                    }
                },
                error:function(result){
                    ;
                }
            })
        })
	
		// ----- 북마크 관련 -----------

        function insertBook(){
            
           $.ajax({
            url:"book.to",
            data:{todayNo:bno, userNo:userNo},
            success:function(result){
                
                if(result == 'Y'){
                	$("#bookmark1").css("display", "none");
                    $("#bookmark2").css("display", "");
                }
            },
            error:function(){
                
            }
           })
        }

        function deleteBook(){
         
           $.ajax({
            url:"deleteBook.to",
            data:{todayNo:bno, userNo:userNo},
            success:function(result){
                
                if(result == 'Y'){
                	$("#bookmark1").css("display", "");
                    $("#bookmark2").css("display", "none");
                }
            },
            error:function(){
                
            }
           })
        }
        
        $(function(){
      

            $.ajax({
                url:"bookCheck.to",
                data:{todayNo:bno, userNo:userNo},
                success:function(result){
                    
                    if(result == 'Y'){
                    	$("#bookmark2").css("display", "");
                        $("#bookmark1").css("display", "none");
                    }else{
                    	$("#bookmark2").css("display", "none");
                        $("#bookmark1").css("display", "");                    	
                    }
                },
                error:function(result){
                    ;
                }
            })
        })

        $(function(){
            let bno = $("input[name=bno]").val();
            let userNo = $("input[name=userNo]").val();

            $.ajax({
                url:"likeCheck.to",
                data:{todayNo:bno, userNo:userNo},
                success:function(result){
                    ;
                    if(result == 'Y'){
                    	$("#like2").css("display", "");
                        $("#like1").css("display", "none");
                    }else{
                    	$("#like2").css("display", "none");
                        $("#like1").css("display", "");                    	
                    }
                },
                error:function(result){
                    ;
                }
            })
        })
	
		// ----- 북마크 관련 -----------

        function insertBook(){
            let bno = $("input[name=bno]").val();
            let userNo = $("input[name=userNo]").val();
            
           $.ajax({
            url:"book.to",
            data:{todayNo:bno, userNo:userNo},
            success:function(result){
                
                if(result == 'Y'){
                	$("#bookmark1").css("display", "none");
                    $("#bookmark2").css("display", "");
                }
            },
            error:function(){
                
            }
           })
        }

        function deleteBook(){
            let bno = $("input[name=bno]").val();
            let userNo = $("input[name=userNo]").val();
            
           $.ajax({
            url:"deleteBook.to",
            data:{todayNo:bno, userNo:userNo},
            success:function(result){
                
                if(result == 'Y'){
                	$("#bookmark1").css("display", "");
                    $("#bookmark2").css("display", "none");
                }
            },
            error:function(){
                
            }
           })
        }
        
        $(function(){
            let bno = $("input[name=bno]").val();
            let userNo = $("input[name=userNo]").val();

            $.ajax({
                url:"bookCheck.to",
                data:{todayNo:bno, userNo:userNo},
                success:function(result){
                    ;
                    if(result == 'Y'){
                    	$("#bookmark2").css("display", "");
                        $("#bookmark1").css("display", "none");
                    }else{
                    	$("#bookmark2").css("display", "none");
                        $("#bookmark1").css("display", "");                    	
                    }
                },
                error:function(result){
                    ;
                }
            })
        })

        $(function(){
            selectReplyList();
            setInterval(selectReplyList,1000);
        })
        function selectReplyList(){
            $.ajax({
                url:"rlist.to",
                data:{bno:bno},
                success:function(list){
                
                    
                let value ="";
                	
                for(let i=0; i<list.length;i++){
                    value += 
                    	 "<div class='cmt_id'>" + list[i].replyWriter + "</div>"+
                		"<div class='cmt_txt'>" + list[i].replyContent + "</div>"
                            + "<div class='cmt_etc'>"+ list[i].createDate;
                            if(userNo == list[i].userNo){
                            	value += "<p class='deleteReply-btn' onclick='deleteReply($(this));'>삭제</p>"
	           				  		  + "<input type='hidden' value='" + list[i].replyNo + "'>"
	           					 	  + "</div></div>"; 
          				  }else{
          					value += "</div></div>";
          				  }
                        }
                $("#comment-area1").html(value); 
                    }, 
                error:function(){
                    
                }
            })

            $.ajax({
            	url:"countReply.to",
            	data:{boardNo:bno},
            	success:function(result){
            		$("#countReply").text(result);
                    (result+"댓수");
            	},
            	error:function(){
            		
            	}
            })
        }
        <%}%> 
        function insertReply(){
        	($("#replyContent").val());
            $.ajax({
                url:"rinsert.to",
                data:{content:$("#replyContent").val(),
                      bno:bno},
                   type:"post",
                success:function(result){
                    if(result>0){ // 댓글작성성공 => 갱신된 댓글리스트 조회
                        $("#replyContent").val("");
                        alert('댓글작성성공');
                    }
                },
                error:function(){
                    
                }
            })
        }
        function deleteReply(e){
        	let replyNo = e.next().val();
        	
        	if(confirm("댓글을 삭제하시겠습니까?")){
        		$.ajax({
        			url:"deleteReply.to",
        			data:{rno:replyNo},
        			success:function(result){
        				if(result > 0){
        					selectReplyList();
        				}
        			},
        			error:function(){
        				
        			}
        		})
        	}
     
        }

        
    </script>
    <div class="modal" id="reportBoard">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title"><b>신고하기</b></h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              <form action="<%= contextPath %>/reportBoard.bo" method="post">
                <p>작성자 : <%= t.getTodayWriter() %> </p>
                <p>글 제목 : <%= t.getTodayTitle() %> </p>
                
                <input name="bno" type="hidden" value="<%= t.getTodayNo() %>">
                <input name="reportedUserNo" type="hidden" value="<%= t.getUserNo()%>">
                <% if(loginMember != null){ %>
                <input name="reportUserNo" type="hidden" value="<%= loginMember.getUserNo()%>">
                <%} %>
                <hr>
                
                    <input type="radio" id="r1" name="report" value="영리목적/홍보성">
                    <label for="r1">영리목적/홍보성</label><br>
                    <input type="radio" id="r2" name="report" value="욕설/인신공격">
                    <label for="r2">욕설/인신공격</label> <br>
                    <input type="radio" id="r3" name="report" value="도배">
                    <label for="r3">같은 내용 반복(도배)</label> <br>
                    <input type="radio" id="r4" name="report" value="개인정보노출">
                    <label for="r4">개인정보노출</label> <br>
                    <input type="radio" id="r5" name="report" value="불법정보">
                    <label for="r5">불법정보</label><br>
                    <input type="radio" id="r6" name="report" value="음란성/선정성">
                    <label for="r6">음란성/선정성</label> <br>
        
                <textarea name="reportContent" style="resize: none;" placeholder=" 신고 사유 설명이 필요하신 경우 작성해주세요." cols="50" rows="3" style="margin: 20px;"></textarea>
                <br><button type="submit" class="btn btn-secondary" id="rpt_btn" style="width: 100%; height: 40px; margin-top: 15px;">신고</button>
              </form>
            </div>
  
         </div>
            
        </div>
    </div>
    
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>