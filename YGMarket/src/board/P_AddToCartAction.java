package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.MemberDao;
import com.yg.dao.OrderDao;
import com.yg.dao.ProductDao;
import com.yg.dto.MemberBean;
import com.yg.dto.OrderBean;
import com.yg.dto.ProductBean;

//미완성입니다!

public class P_AddToCartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		
		OrderDao oDao = OrderDao.getInstance();
		MemberDao mDao = MemberDao.getInstance();
		
		String id = (String)session.getAttribute("login_id");

		String code = request.getParameter("code");
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		if(id!=null) {		
			try {
				int member_id = mDao.getMemberIdFromId(id);
				boolean search = oDao.searchOrder(member_id, code);
				for(int i=1; i<=1; i++) {
					if(search == true) {
						oDao.plusOrder(member_id, code, qty);
						response.sendRedirect("Controller?command=product_mycart&member_id="+id);
						
					} if(search == false) {
						member_id = mDao.getMemberIdFromId(id);
						oDao.insertOrder(member_id, code, qty);
						response.sendRedirect("Controller?command=product_mycart&member_id="+id);
						break;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("M_LoginCheck.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
