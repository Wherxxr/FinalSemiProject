package qBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qBoard.model.service.QnaService;
import qBoard.model.vo.Qna;

/**
 * Servlet implementation class qSelectDetailController
 */
@WebServlet("/qInsert.se")
public class qInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public qInsertController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String qTitle = request.getParameter("title");
		String qContent = request.getParameter("content");

		Qna q = new Qna();
		q.setqTitle(qTitle);
		q.setqContent(qContent);

		

		int result = new QnaService().insertBoard(q);
		

		if (result > 0) {
//			HttpSession session = request.getSession();
//			session.setAttribute("alertMsg", "문의글이 성공적으로 등록됐습니다.");
			response.sendRedirect(request.getContextPath() + "/qna.se");
		} else {
			request.setAttribute("errorMsg", "문의 등록에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorpage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
