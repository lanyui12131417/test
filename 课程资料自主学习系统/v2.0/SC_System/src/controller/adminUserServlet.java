package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminUserDao;
import entity.Student;
import entity.User;

/**
 * Servlet implementation class adminUserServlet
 */
@WebServlet("/adminUserServlet")
public class adminUserServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminUserDao adminUserDao = new AdminUserDao();
		List<User> userList;
		try {
			userList = adminUserDao.findAll();
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("page/adminUser.jsp").forward(request, response); 
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
