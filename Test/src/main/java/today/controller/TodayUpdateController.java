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
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.to")
public class TodayUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodayUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전달되는 파일 용량 제한 (int maxSize)
			int maxSize = 10 * 1024 * 1024; // 10메가 바이트
			
			// 1_2. 전달되는 파일을 저장시킬 서버의 폴더 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/today_upfiles");
			
			// 2. 전달된 파일명 수정작업 후 서버에 업로드
			// HttpsServletRequest => MultipartRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
 			
			// 3. 본격적으로 sql문 실행할떄 필요한 값 (요청시 전달값)뽑아서 vo에 기록	
			
			// >> 공통적으로 수헹 : update board
			String todayNo = multiRequest.getParameter("bno");
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
			t.setTodayNo(todayNo);
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
			
			Attachment at = null; // 처음에는 null로 초기화, 넘어온 새 첨부파일이 있을경우 그때 생성
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 새로 넘어온 첨부파일이 있을 경우 => Attachment 객체 생성
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/today_upfiles");
				if(multiRequest.getParameter("originFileNo") != null) {
					// 기존에 첨부파일이 있었을 경우 => Update Attachment (기존의첨부파일번호필요)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
				} else {
					// 기존에 첨부파일이 없었을 경우 => Insert Attachment (현재게시글번호필요)
					at.setRefNo(todayContent);
					
					
				}
			}
			// 만약 새로넘어온 첨부파일 없었다면 at는 null일거임
			int result = new TodayService().updateToday(t, at);

			if (result > 0) {
				// 성공 => /jsp/dateil.bo?bno=해당게시글번호 url 재요청 => 기존에 봤었던 상세조회 페이지
				request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
				response.sendRedirect(request.getContextPath()+"/detail.to?bno="+ todayNo);
				
			} else {
				// 실패 
				request.setAttribute("errorMsg", "수정에 실패했습니다.");
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
