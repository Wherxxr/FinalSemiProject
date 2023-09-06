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
 * Servlet implementation class qBDetailController
 */
@WebServlet("/detail.qbo")
public class qBDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qBDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo = Integer.parseInt(request.getParameter("qno"));
		
		QnaService qService = new QnaService();
		
		int result = qService.increaseCount(qNo);
		
		if(result > 0) {
			Qna q = qService.selectqBoard(qNo);
			
			request.setAttribute("q", q);
			
			request.getRequestDispatcher("views/qBoard/qBoardDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "문의글 상세조회에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
