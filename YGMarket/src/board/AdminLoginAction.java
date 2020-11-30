package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String pw = request.getParameter("PW");
		
		if(id.equals("admin") && pw.equals("1111")){
			//로그인 성공
			request.setAttribute("ID",id);
			request.setAttribute("PW", pw);
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminIndex.jsp");
			rd.forward(request, response);
		}else {
			//로그인 실패
			response.sendRedirect("AdminLoginForm.jsp");
		}
	
	}
	
}
