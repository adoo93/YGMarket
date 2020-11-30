package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.BoardDao;
import com.yg.dto.BoardBean;

public class B_ContentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDao dao = BoardDao.getInstance();
		//dao.updateHitcount(bno);
		
		try {
			BoardBean bbean = dao.selectBoard(bno);
			request.setAttribute("bb", bbean);
			request.getRequestDispatcher("B_Detail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	
	}

}
