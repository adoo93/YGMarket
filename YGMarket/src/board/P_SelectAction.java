package board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.ProductDao;
import com.yg.dto.ProductBean;

public class P_SelectAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");

		ProductDao dao = ProductDao.getInstance();
		
		try {
			ProductBean pb = dao.selectProduct(code);
			request.setAttribute("pb", pb);
			request.getRequestDispatcher("/P_Select.jsp").forward(request, response);
			//System.out.println(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
