package today.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import today.model.service.TodayService;
import today.model.vo.Attachment;
import today.model.vo.Today;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.to")
public class TodayDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodayDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String todayNo = request.getParameter("bno");
		TodayService tService = new TodayService();
		
		int result = tService.increaseCount(todayNo);
		
		if(result > 0 ) { // 유효한 게시글 => 게시글, 첨부파일 조회 => 상세조회페이지
			Today t = tService.selectToday(todayNo);
			Attachment at = tService.selectAttachment(todayNo);
			request.setAttribute("t", t);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/today/todayDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "글조회에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
