package qBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qBoard.model.service.QnaService;
import qBoard.model.vo.Qna;

/**
 * Servlet implementation class qBoardUpdateFormController
 */
@WebServlet("/qUpdateForm.se")
public class qBoardUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qBoardUpdateFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int qNo = Integer.parseInt(request.getParameter("qno"));
		
		Qna q = new QnaService().selectqBoard(qNo);
		
		request.setAttribute("q", q);
		request.getRequestDispatcher("views/qBoard/qBoardUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
