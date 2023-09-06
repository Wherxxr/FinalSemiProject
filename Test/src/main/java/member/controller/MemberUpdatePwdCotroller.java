package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePwdCotroller
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글 없으니 인코딩 생략
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		Member updateMem = new MemberService().updatePwd(userId, userPwd);
		
		
		HttpSession session = request.getSession();
		if(updateMem == null) { //실패
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
		} else { // 성공
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경됐습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/infoEdit.me");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
