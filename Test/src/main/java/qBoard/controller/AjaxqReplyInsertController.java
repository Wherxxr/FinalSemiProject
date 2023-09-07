package qBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import qBoard.model.service.QnaService;
import qBoard.model.vo.Qreply;
import qBoard.model.vo.Reply;

/**
 * Servlet implementation class AjaxqReplyInsertController
 */
@WebServlet("/qrinsert.se")
public class AjaxqReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxqReplyInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("comment");
		
		int qNo = Integer.parseInt(request.getParameter("bno"));
		
		
		int userNo = ((Member)request.getSession().getAttribute("loginMember")).getUserNo();
		
		Qreply r = new Qreply();
		r.setRefQNo(qNo);
		r.setqReplyContent(replyContent);
		r.setqReplyWriter(userNo);
		
		int result = new QnaService().insertReply(r);
		
		response.getWriter().print(result);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
