package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.BoardDao;
import com.yg.dto.BoardBean;

public class B_DeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno =0;
		bno = Integer.parseInt(request.getParameter("bno"));

		BoardDao bDao = BoardDao.getInstance();
  
		//** 로그인한 id와 작성자가 일치하는지 체크
		BoardBean bBean = new BoardBean();
		try {
			bBean =bDao.selectBoard(bno);
			HttpSession session = request.getSession();
			String loginId = (String)(session.getAttribute("login_id"));
			request.setAttribute("writer", bBean.getWriter());
	      
	System.out.println("B_DeleteAction.java: writer "+ bBean.getWriter() +"/ loginId: "+loginId);      
			//일치하는 경우~
			if( loginId.equals(bBean.getWriter()) ){
				session.setAttribute("loginId",  true);
				try {
					bDao.deleteBoard(bno);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			else {
				//"작성자가 불일치";
				session.setAttribute("loginId", false);
			}
			request.getRequestDispatcher("B_DeleteResult.jsp?loginId="+loginId).forward(request, response);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}