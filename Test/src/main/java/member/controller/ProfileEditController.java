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
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class ProfileEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
		
		int maxSize = 10 * 1024 * 1024; 
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/member_upfiles");
	
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
		int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
		String userId = multiRequest.getParameter("userId");
		String profileImg = multiRequest.getFilesystemName("upfile");

        String profileImg2 = null; // 이전 이미지 URL
        
        if (profileImg != null) {
            
            profileImg = "resources/member_upfiles/" + profileImg;
        } else {
        	MemberService memberService = new MemberService();
            Member existImg = memberService.selectProImg(userNo);
            if (existImg != null) {
                profileImg2 = existImg.getProfileImg();
            }
        }
		String nickName = multiRequest.getParameter("nickname");
		String description = multiRequest.getParameter("desc");
		String instaId = multiRequest.getParameter("insta");
		int gradeNo = Integer.parseInt(multiRequest.getParameter("gradeNo"));
		
		Member m = new Member();
		m.setUserNo(userNo);
		m.setUserId(userId);
		
		if (profileImg != null) {
	        m.setProfileImg(profileImg);
	    } else if (profileImg2 != null) {
	         m.setProfileImg(profileImg2);
	    }
		m.setNickname(nickName);
		m.setDescription(description);
		m.setInstaId(instaId);
		m.setGradeNo(gradeNo);
	
		
		HttpSession session = request.getSession();
		Member updateMem = new MemberService().updateProfile(m, userId);
		request.setAttribute("userNo", userNo);
		session.setAttribute("userNo", userNo);
		if(updateMem != null) {
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
		}else {
			request.setAttribute("errorMsg", "회원정보수정에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
		String targetURL = "/profile.me";
		RequestDispatcher dispatcher = request.getRequestDispatcher(targetURL);
		dispatcher.forward(request, response);
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
