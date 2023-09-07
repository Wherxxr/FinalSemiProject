	package today.controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import today.model.service.TodayService;
import today.model.vo.Today;


/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/search.to")
public class todaySearchListView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public todaySearchListView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String keyword = request.getParameter("keyword");
		

		
		
		if(request.getParameter("option").equals("TTTC")) {
			ArrayList<Today> list = new TodayService().searchTodayTiCon(keyword);
			response.setContentType("apllication/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
		}
		else if(request.getParameter("option").equals("TT")) {
			ArrayList<Today> list = new TodayService().searchTodayTi(keyword);
			response.setContentType("apllication/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
		}
		else if(request.getParameter("option").equals("TW")) {
			ArrayList<Today> list = new TodayService().searchTodayWri(keyword);
			response.setContentType("apllication/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
		}
		else if(request.getParameter("option").equals("R")) {
			ArrayList<Today> list = new TodayService().searchTodayRep(keyword);
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
