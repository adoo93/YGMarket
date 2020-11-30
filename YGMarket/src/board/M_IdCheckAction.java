package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDao;

public class M_IdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		
		String id = request.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
		
		boolean result;
		try {
			result = dao.idCheck(id);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			System.out.println("그런데 쿼리스트링은 : " + request.getQueryString());
			System.out.println("아이디("+id+") M_IdCheckAction에서 result:"+ (result ? "중복아님" : "중복임"));
			if(result) 	out.println("중복아님"); 
			else 		out.println("중복임");
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
	}

}
