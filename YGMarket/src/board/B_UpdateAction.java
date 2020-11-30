package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.BoardDao;

public class B_UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		BoardDao bDao = BoardDao.getInstance();

		try { 
			bDao.updateBoard(bno, title, content);
			request.getRequestDispatcher("Controller?command=board_content&bno="+bno).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
