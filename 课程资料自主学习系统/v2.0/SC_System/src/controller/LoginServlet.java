package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Course;
import entity.News;
import entity.Student;
import entity.Teacher;
import entity.User;
import dao.AdminNewsDao;
import dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			UserDao userDao =  new UserDao(); 
			User existUser = userDao.login(user); 						
			if(existUser==null) {
				request.setAttribute("msg", "用户名或密码错误！！！");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}		
			else {
				HttpSession session = request.getSession();
				session.setAttribute("existUser", existUser);								
				if( "管理员".equals( existUser.getPosition() ) ) {					
					response.sendRedirect("/SC_System/page/index.jsp");					
				}else if ("教师".equals(existUser.getPosition())) {
					AdminNewsDao adminNewsDao = new AdminNewsDao();
					List<News> newsList;
					newsList = adminNewsDao.findAll();
					session.setAttribute("newsList", newsList);
					request.getRequestDispatcher("page/teacherIndex.jsp").forward(request, response); 
				}				
				else {
					AdminNewsDao adminNewsDao = new AdminNewsDao();
					List<News> newsList;
					newsList = adminNewsDao.findAll();
					session.setAttribute("newsList", newsList);
					request.getRequestDispatcher("page/stuIndex.jsp").forward(request, response); 
				}
					
			}
			}catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException();
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
