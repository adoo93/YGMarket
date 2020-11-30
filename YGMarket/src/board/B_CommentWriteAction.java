package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.BoardDao;

public class B_CommentWriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("commentTitle");
		String comment = request.getParameter("comment");
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao bDao = BoardDao.getInstance();

		//		String loginId = "";
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("login_id");
		if(loginId!=null) {
			try {
				bDao.insertComment(bno,title,comment,loginId);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			request.getRequestDispatcher("M_LoginForm.jsp?login=fail").forward(request, response);
		}
		
		
		request.getRequestDispatcher("Controller?command=board_list").forward(request, response);
	}
	
}
