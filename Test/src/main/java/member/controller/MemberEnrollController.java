package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.service.MemberService;
import member.model.vo.Attachment;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/insert.me")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/member_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String userId = multiRequest.getParameter("userId");
			String userPwd = multiRequest.getParameter("userPwd");
			String userName = multiRequest.getParameter("userName");
			String nickname = multiRequest.getParameter("nickname");
			String email = multiRequest.getParameter("email");
			String gender = multiRequest.getParameter("gender");
			String phone = multiRequest.getParameter("phone");
			String description = multiRequest.getParameter("description");
			String profileImg = "resources/member_upfiles/" +multiRequest.getFilesystemName("profileImg");
			int gradeNo = Integer.parseInt(multiRequest.getParameter("gradeNo"));	
			String instaId = multiRequest.getParameter("instaId");
			
			Member m = new Member();
			
			m.setUserId(userId);
			m.setUserPwd(userPwd);
			m.setUserName(userName);
			m.setNickname(nickname);
			m.setEmail(email);
			m.setGender(gender);
			m.setPhone(phone);
			m.setDescription(description);
			m.setProfileImg(profileImg);
			m.setGradeNo(gradeNo);
			m.setInstaId(instaId);
			
//			Attachment at = null;
//			
//			if(multiRequest.getOriginalFileName("upfile") != null) { 
//				at = new Attachment();
//				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
//				at.setChangeName(multiRequest.getFilesystemName("upfile"));
//				at.setFilePath("resources/member_upfiles");
//			}
					
			int result = new MemberService().insertMember(m);
			
			if(result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
				response.sendRedirect(request.getContextPath());
				
			}else {
				request.setAttribute("errorMsg", "회원가입에 실패했습니다");
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
