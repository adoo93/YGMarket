package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDao;
import com.yg.dao.OrderDao;

public class P_DeleteOrder implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String code = request.getParameter("code");
		String id = request.getParameter("member_id");
		
		int ordernum = Integer.parseInt(request.getParameter("ordernum"));
		
		OrderDao odao = OrderDao.getInstance();
		MemberDao mdao = MemberDao.getInstance();
		
		try {
			int member_id = mdao.getMemberIdFromId(id);
			odao.deleteOrder(ordernum);
			request.getRequestDispatcher("Controller?command=product_mycart&member_id="+member_id).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
