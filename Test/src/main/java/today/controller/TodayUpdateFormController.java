package today.controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import today.model.service.TodayService;
import today.model.vo.Attachment;
import today.model.vo.Today;



/**
 * Servlet implementation class BoardUpdateFormController
 */
@WebServlet("/updateForm.to")
public class TodayUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodayUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String todayNo = request.getParameter("bno");
		
		TodayService tService = new TodayService();
		Today t = tService.selectToday(todayNo);
		Attachment at = tService.selectAttachment(todayNo);
		
		request.setAttribute("t", t);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/today/todayUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
