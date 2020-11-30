package board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDao;

public class M_FindPwAction  implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String id = request.getParameter("ID");
      String name = request.getParameter("name");
      String email = request.getParameter("email");
System.out.println("M_FindPwAction.java : name =" + name +"/ + email " + email);
      MemberDao mDao = MemberDao.getInstance();
      //아직 미완성
      
      String pw;
      try {
         pw = mDao.findPw(name, id, email);
System.out.println("M_FindPwAction.java : pw=>" + pw);         
         request.getRequestDispatcher("M_FindPwResult.jsp?PW="+pw).forward(request, response);
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}