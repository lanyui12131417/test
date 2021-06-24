package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminNewsDao;
import entity.News;

/**
 * Servlet implementation class teacherNewsServlet
 */
@WebServlet("/teacherNewsServlet")
public class teacherNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public teacherNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.调用Java类处理数据
		AdminNewsDao adminNewsDao = new AdminNewsDao();
			List<News> newsList;
			try {
				newsList = adminNewsDao.findAll();
				for (News news : newsList) {
					System.out.println(news.toString());
				}
				request.setAttribute("newsList", newsList);
				request.getRequestDispatcher("page/teacherIndex.jsp").forward(request, response); 
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
