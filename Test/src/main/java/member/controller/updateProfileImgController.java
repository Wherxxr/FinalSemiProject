package member.controller;

import java.io.*;	
import java.util.*;

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
import member.model.vo.Attachment;
import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class updateProfileImgController
 */
@WebServlet("/updateimg.me")
public class updateProfileImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfileImgController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");

        // 1_1. 전송용량 제한
        int maxSize = 10 * 1024 * 1024;

        // 1_2. 저장시킬 폴더의 물리적인 경로
        String savePath = request.getSession().getServletContext().getRealPath("/resources/mypage_upfiles");

        // 2. 전달된 파일 업로드
        MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
                new MyFileRenamePolicy());

        // 3. db에 기록할 값 뽑기
        String userNo = multiRequest.getParameter("userNo");
        

        // 이미지 업로드 가능 여부 확인
        int imageCount = new MemberService().getImageCount(userNo);

        // 이미지 업로드 가능 여부와 무관하게 업로드 수행
        ArrayList<Attachment> list = new ArrayList<Attachment>();

        for (int i = 1; i <= 4; i++) { // 1, 2, 3, 4
            String key = "file" + i;

            if (multiRequest.getOriginalFileName(key) != null) {
                // 첨부파일이 존재할 경우
                // Attachment 객체 생성 + 원본명, 수정명, 폴더경로, 파일레벨
                Attachment at = new Attachment();
                at.setOriginName(multiRequest.getOriginalFileName(key));
                at.setChangeName(multiRequest.getFilesystemName(key));
                at.setFilePath("resources/mypage_upfiles");
                at.setRefNo(userNo);
                if (multiRequest.getParameter("originFileNo" + i) != null) {
                	String originFileNoParam = multiRequest.getParameter("originFileNo" + i);
                	int originFileNo = (originFileNoParam != null && !originFileNoParam.isEmpty()) ? Integer.parseInt(originFileNoParam) : 0;
                	at.setFileNo(originFileNo);
                }
                list.add(at);
                System.out.println(list);
            }
        }
        
        int result = new MemberService().updatePostImg(list);
        // 이미지 업로드 가능 여부에 따라 INSERT 수행
        System.out.println(result+ "result");
        int insertResult = 0;
        if (imageCount <= 3) {
            insertResult = new MemberService().insertPostImg(list);
        }
		System.out.println(insertResult+"insertResult");
        int userNo2 = Integer.parseInt(userNo);

		HttpSession session = request.getSession();
		session.setAttribute("userNo", userNo2);

        if (result > 0 || insertResult >0 ) {
        	session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
        	response.sendRedirect(request.getContextPath() + "/profile.me");
        } else {
            session.setAttribute("errorMsg", "이미지 업로드에  실패했습니다.");
            RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
            view.forward(request, response);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
	}

}
