package today.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import com.oreilly.servlet.MultipartRequest;

import today.model.service.TodayService;
import today.model.vo.Attachment;
import today.model.vo.Today;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.to")
public class TodayInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodayInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 일반방식이 아닌 multipart/form-data 로 전송하는 경우 request로부터 값 뽑기 불가
		// String boardTitle = request.getParameter("title");
		
		// enctype이 multipart/form-date로 잘 전송이 되었을 경우 전반적인 내용들이 수행되도록
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 10*1024*1024;
	
			String savePath = request.getSession().getServletContext().getRealPath("/resources/today_upfiles/");
		
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy()); 
			
	
			String todayTitle = multiRequest.getParameter("title");
			String todayContent = multiRequest.getParameter("content");
			String todayWriter = multiRequest.getParameter("userNo");
			String tip = multiRequest.getParameter("tip");
			String hash = multiRequest.getParameter("hashtagArr");
			String mtName = multiRequest.getParameter("mtname");
			String dateIn = multiRequest.getParameter("dateIn");
			String climbTime = multiRequest.getParameter("climbtime");
			String route = multiRequest.getParameter("route");
			String lev = multiRequest.getParameter("lev");
			String transport = multiRequest.getParameter("transport");
			
			Today t = new Today();
			t.setTodayTitle(todayTitle);
			t.setTodayContent(todayContent);
			t.setTodayWriter(todayWriter);
			t.setTodayTip(tip);
			t.setHashtag(hash);
			t.setTodayName(mtName);
			t.setTodayDate(dateIn);
			t.setTodayTime(climbTime);
			t.setTodayCourse(route);
			t.setLev(lev);
			t.setTodayVehicle(transport);
			
			Attachment at = null; 
			
			if(multiRequest.getOriginalFileName("upfile") != null) { // 넘어온 첨부파일이 있다.
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/today_upfiles");
			}
			
			// 4. 서비스 요청 (요청 처리)
			int result = new TodayService().insertToday(t, at);
			
			// 5. 응답뷰 지정

			if(result > 0) { // 성공 => /jsp/list.bo?cpage=1 url 재요청 => 목록페이지
				response.sendRedirect(request.getContextPath()+"/todayView.to");
				
			} else { // 실패 => 에러페이지
				request.setAttribute("errorMsg", "글작성에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
			
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
