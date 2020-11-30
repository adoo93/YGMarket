package board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.ProductDao;
import com.yg.dto.ProductBean;

public class P_ListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ProductBean pb = new ProductBean();
		ProductDao dao = ProductDao.getInstance();
		String type = request.getParameter("type");
		
		//System.out.println(type);
		
		List<ProductBean> list = dao.productList(type);
		System.out.println(list.size());
		
		request.setAttribute("pList", list);
		request.getRequestDispatcher("P_List.jsp").forward(request, response);
	
	}

}
