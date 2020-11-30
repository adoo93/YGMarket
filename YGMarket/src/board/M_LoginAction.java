package board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.MemberDao;

public class M_LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		String id =request.getParameter("ID");
		String pw =request.getParameter("PW");
System.out.println("M_LoginAction.java =>id :" + id);	

		MemberDao mDao = MemberDao.getInstance();

		boolean login;
		try {
			login = mDao.login(id, pw);
			if(login == true) {
				HttpSession session = request.getSession();
				session.setAttribute("login_id", id);
				request.getRequestDispatcher("Index.jsp?login=ok").forward(request,  response);
			}
			request.getRequestDispatcher("M_LoginForm.jsp?login=fail").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
