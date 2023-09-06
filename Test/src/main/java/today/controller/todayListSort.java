package today.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import today.model.service.TodayService;
import today.model.vo.Today;

/**
 * Servlet implementation class todayListSort
 */
@WebServlet("/sort.to")
public class todayListSort extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public todayListSort() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("option").equals("date")) {
			ArrayList<Today> list = new TodayService().sortDate();
			response.setContentType("apllication/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
		}
		else if(request.getParameter("option").equals("like")) {
			ArrayList<Today> list = new TodayService().sortLike();
			response.setContentType("apllication/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
		}
		else if(request.getParameter("option").equals("reply")) {
			ArrayList<Today> list = new TodayService().sortReply();
			response.setContentType("apllication/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
		}
		else if(request.getParameter("option").equals("count")) {
			ArrayList<Today> list = new TodayService().sortCount();
			response.setContentType("apllication/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
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
