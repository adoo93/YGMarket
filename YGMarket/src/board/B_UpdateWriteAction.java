package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.BoardDao;
import com.yg.dto.BoardBean;

public class B_UpdateWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
	      
		BoardDao bDao = BoardDao.getInstance();
		BoardBean bBean = new BoardBean();
		try {
			bBean = bDao.selectBoard(bno);
		} catch (Exception e) {
			e.printStackTrace();
		}
	      
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("title", bBean.getTitle());
		request.setAttribute("content", bBean.getContent());
		request.setAttribute("writer", bBean.getWriter());
		RequestDispatcher rd = request.getRequestDispatcher("B_UpdateWrite.jsp");
		rd.forward(request,response);
	}
}
