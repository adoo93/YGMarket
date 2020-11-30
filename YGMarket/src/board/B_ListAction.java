package board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.BoardDao;
import com.yg.dto.BoardBean;

public class B_ListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		
		int page=0;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page=1;
		}
		
		BoardDao dao = BoardDao.getInstance();
		
		//System.out.println(list.size());
		
		List<BoardBean> list = null;
		int maxPageNum = 1;     // 초기값을 1로 한 것은 그냥 그렇게 한 것. (YG)
		try {
			try {
				list = dao.selectList(page);
				maxPageNum = dao.getMaxPageNum(10);          // page size를 10으로 가정함(YG)
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("boardList", list);
			request.setAttribute("maxPageNum", maxPageNum);
			request.getRequestDispatcher("B_List.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

}
