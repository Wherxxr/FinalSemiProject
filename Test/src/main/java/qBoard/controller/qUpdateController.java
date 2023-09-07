package qBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qBoard.model.service.QnaService;
import qBoard.model.vo.Qna;

/**
 * Servlet implementation class qUpdateController
 */
@WebServlet("/qUpdate.se")
public class qUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int qNo = Integer.parseInt(request.getParameter("qno"));;
		String qTitle = request.getParameter("title");
		String qContent = request.getParameter("content");
		
		
		Qna q = new Qna();
		q.setqNo(qNo);
		q.setqTitle(qTitle);
		q.setqContent(qContent);
		
		int result = new QnaService().updateqBoard(q);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/detail.qbo?qno=" + qNo);
		} else {
			request.setAttribute("errorMsg", "문의글 수정에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorpage.jsp");
			view.forward(request, response);
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
