package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.BoardDao;
import com.yg.dto.BoardBean;

public class B_InsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("loginId");
		//int ref = Integer.parseInt(request.getParameter("bno"));
		
		BoardDao bDao = BoardDao.getInstance();
		BoardBean bBean = new BoardBean(title, content,writer);

		

		try {
			int bno = bDao.insertBoard(bBean);
			//String url = "BoardController?command=insertWrite&bno="+bno; 
			String url = "B_Detail.jsp&bno="+bno;

			bBean.setBno(bno);
			request.setAttribute("bBean", bBean);
			
			request.getRequestDispatcher("Controller?command=board_content&bno="+bno).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}