<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">


    <style>

        #ff1{font-family: 'NanumBarunGothicExtraLight';}
        #ff2{font-family: 'NanumBarunGothicLight';}
        #ff3{font-family: 'NanumBarunGothic';}
        #ff4{font-family: 'NanumBarunGothicBold';}

        /* div{border: 1px solid red; box-sizing: border-box;} */
        
        .wrap{width: 1200px;}

        #unregister{
            margin:auto;
            width: 600px;
        }

        #res{
            width: 400px;
            margin: auto;
        }
        #btn1{
           margin: 0px 10px 10px 20px;
        }

        input{
            width: 15px;
            height: 15px;
        }

    </style>
</head>
<body>
<%@ include file = "mypageheader.jsp" %>
    <div class="warp">
        <div id="unregister">
                <br>
                <h1 id="ff4">회원탈퇴</h1>
                
                <h3 id="ff3"><%= loginMember.getUserName() %>님</h3>
                <h3 id="ff3">정말 탈퇴하시겠어요?</h3>
                <br><br>
                
            <b id="ff2">회원탈퇴 전 유의사항을 확인해주세요.</b><br><br>
            <ul id="ff2">
                <li>탈퇴 시 회원님이 삭제하지 않은 게시물은 삭제되지 않습니다. </li>
                <li>한번 탈퇴한 아이디는 다시 사용이 불가합니다.</li> 
                <li>일부 정보에 대해서는 부정이용 방지 및 <br> 관계 법령의 규정에 의하여 1년간 보관합니다. </li>
            </ul>
            <br>
            <div id="res">
                <h5><b id="ff3">탈퇴사유</b></h5><br>
                <div id="ff3">
                    <input type="radio" name="reason" id="useoften" value="U" onclick='checkOnlyOne(this)'> <label for="useoften">사용 빈도가 낮거나 나에게 필요한 정보가 없어서</label><br>
                    <input type="radio" name="reason" id="many" value="M" onclick='checkOnlyOne(this)'> <label for="many">가입한 사이트가 많아서</label><br>
                    <input type="radio" name="reason" id="securityissue" value="S" onclick='checkOnlyOne(this)'> <label for="securityissue">개인정보 유출 방지 등 보안 상의 문제</label><br>
                    <input type="radio" name="reason" id="other" value="O" onclick='checkOnlyOne(this)'> 기타<br>
                    <pre>   <textarea cols="40" rows="5" style="resize: none;" placeholder="내용을 입력해주세요"></textarea></pre>
                    <button type="button" class="btn btn-secondary" style="width: 350px; height: 50px;" id="btn1" data-toggle="modal" data-target="#deleteModal">탈퇴하기</button>
                    <br><br>
                </div>

                <!-- 회원 탈퇴용 Modal -->
                <div class="modal" id="deleteModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
            
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title" id="ff2">회원탈퇴</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body" align="center">	
                                <form action="<%= contextPath %>/deleteMember.me" method="post">
                                <b id="ff2">탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까? </b> <br><br>
                        
                                    <input type="hidden" name="userId" value="<%= loginMember.getUserId() %>">
                                    <span id="ff2">
                                        비밀번호 : <input type="password" name="userPwd" required style="width: 200px; height: 30px;"> <br><br>
                                    </span>
                                    <button type="submit" class="btn btn-sm btn-danger" id="ff3">탈퇴하기</button>
                                </form>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>

        </div>    
    </div>
</body>
</html>