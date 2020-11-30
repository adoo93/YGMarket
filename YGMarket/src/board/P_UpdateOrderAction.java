package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDao;
import com.yg.dao.OrderDao;

public class P_UpdateOrderAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		OrderDao oDao = OrderDao.getInstance();
		MemberDao mDao = MemberDao.getInstance();
		
		String id = request.getParameter("member_id");
		String code = request.getParameter("code");
		int qty = Integer.parseInt(request.getParameter("newqty"));
		System.out.println("정보:"+id+","+ code+","+ qty);
		
		try {
			int member_id = mDao.getMemberIdFromId(id);
			oDao.updateOrder(member_id, code, qty);
			response.sendRedirect("Controller?command=product_mycart&member_id="+id);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
