package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDao;
import com.yg.dto.MemberBean;

public class M_JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String id = request.getParameter("ID");
		
		MemberDao dao = MemberDao.getInstance();
		
		MemberBean mb = new MemberBean();
		mb.setAddress(request.getParameter("address"));
		mb.setEmail(request.getParameter("email"));
		mb.setID(request.getParameter("ID"));
		mb.setName(request.getParameter("name"));
		mb.setPW(request.getParameter("PW"));
		mb.setPhone(request.getParameter("phone"));
		
		try {
			dao.insertMember(mb);
			request.setAttribute("mBean", mb);
			request.getRequestDispatcher("M_JoinSuccess.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
