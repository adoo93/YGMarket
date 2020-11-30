package board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDao;

public class M_FindIdAction  implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String name = request.getParameter("name");
      String email = request.getParameter("email");
System.out.println("M_FindIdAction.java : name =" + name +"/ + email " + email);
      MemberDao mDao = MemberDao.getInstance();
      
      
      String id;
      try {
         id = mDao.findId(name, email);
System.out.println("M_FindIdAction.java : id=>" + id);         
         request.getRequestDispatcher("M_FindIdResult.jsp?ID="+id).forward(request, response);
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}