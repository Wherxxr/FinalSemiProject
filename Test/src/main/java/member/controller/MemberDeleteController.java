package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;


/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/deleteMember.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		int deleteMem = new MemberService().deleteMember(userId, userPwd);
		
		/*
		 *   성공했을 경우 : 메인페이지 alert(성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.)
						  				단, 로그아웃 되어있어야함 (세션에 loginMember 라는 키값에 해당하는걸 지우기)
						  실패했을 경우 => 마이페이지 alert (회원탈퇴 실패)	
		 */
		
		
		HttpSession session = request.getSession();
		if(deleteMem > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
			session.removeAttribute("loginMember");
			response.sendRedirect(request.getContextPath());
		
		} else {
			session.setAttribute("alertMsg", "회원탈퇴실패");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		}

	
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
