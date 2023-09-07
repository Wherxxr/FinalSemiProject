package member.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * Servlet implementation class mtSelectController
 */
@WebServlet("/mtselect.me")
public class mtSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mtSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String mtlist = request.getParameter("mtname");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Member updateMem = new MemberService().updateCompleteMt(mtlist, userNo);
		
		
		HttpSession session = request.getSession();
		if(updateMem != null) { //실패
			session.setAttribute("loginMember", updateMem);
			
			session.setAttribute("alertMsg", "성공적으로 등반완료산이 변경됐습니다.");
		} else {
			session.setAttribute("alertMsg", "등반완료산 변경에 실패했습니다.");
		}
		
		
		String targetURL = "/profile.me";
		request.setAttribute("userNo", userNo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(targetURL);
		dispatcher.forward(request, response);
//		request.setAttribute("userNo", userNo);

//		 request.getRequestDispatcher("/profile.me").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

