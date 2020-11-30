package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.MemberDao;
import com.yg.dao.OrderDao;
import com.yg.dao.ProductDao;

public class P_MyCartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		OrderDao oDao = OrderDao.getInstance();
		MemberDao mDao = MemberDao.getInstance(); 
		ProductDao pDao = ProductDao.getInstance();
		
		String id = (String)session.getAttribute("login_id");
		if(id!=null ) {			
			request.getRequestDispatcher("P_MyCart.jsp").forward(request, response);;
		} else {
			request.getRequestDispatcher("M_LoginCheck.jsp").forward(request, response);
		}
	
	
	}

}
