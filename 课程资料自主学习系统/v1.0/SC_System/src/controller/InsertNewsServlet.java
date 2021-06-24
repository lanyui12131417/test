package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InsertDao;
import entity.News;
import entity.User;

/**
 * Servlet implementation class InsertNewsServlet
 */
@WebServlet("/InsertNewsServlet")
public class InsertNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String  newsTitle = request.getParameter("newsTitle");
			String newsBody = request.getParameter("newsBody");
			
			News news =new News() ;
			news.setNewsTitle(newsTitle);
			news.setNewsBody(newsBody);
			InsertDao insertDao = new InsertDao();
			insertDao.insertNews(news);			
			response.sendRedirect("/SC_System/page/addNews.jsp");
			} catch (SQLException e) {
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
