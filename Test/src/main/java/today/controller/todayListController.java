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

@WebServlet("/today.to")
public class todayListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public todayListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Today> list = new TodayService().selectTodayList();

      
        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(list, response.getWriter());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
