package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.cj.Session;
import dao.AdminUserDao;
import entity.User;

/**
 * Servlet implementation class UpdateAdminPwdServlet
 */
@WebServlet("/UpdateAdminPwdServlet")
public class UpdateAdminPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User  user= (User) session.getAttribute("existUser");
		String  username = request.getParameter("username");
		String  password = request.getParameter("pwd");
		String  position = request.getParameter("position");
		try {
			AdminUserDao adminUserDao = new AdminUserDao();
			adminUserDao.updatePwd(username,password);
			if("管理员".equals(position)) {
				request.getRequestDispatcher("page/updateAdminPwd.jsp").forward(request, response);
			}else if("教师".equals(position)) {
				request.getRequestDispatcher("page/updateTeacherPwd.jsp").forward(request, response);
			}else if("学生".equals(position)){
				request.getRequestDispatcher("page/updateStuPwd.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("login.jsp").forward(request, response); 
			}
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
