package mtinfo.controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import mtinfo.model.service.MtinfoService;
import mtinfo.model.vo.Mtinfo;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/mtinfo.do")
public class mtInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mtInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mtName = request.getParameter("mtName");
		
		Mtinfo mt = new MtinfoService().selectList(mtName);
		/*
		 request.setAttribute("mt", mt);
		 request.getRequestDispatcher("index.jsp").forward(request, response);
		 */
		
		response.setContentType("apllication/json; charset=UTF-8");
		new Gson().toJson(mt, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}