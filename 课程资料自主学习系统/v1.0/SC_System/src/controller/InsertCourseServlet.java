package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InsertDao;
import entity.Course;
import entity.News;

/**
 * Servlet implementation class InsertCourseServlet
 */
@WebServlet("/InsertCourseServlet")
public class InsertCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String  cname = request.getParameter("cname");
			String  teacher = request.getParameter("teacher");
			String  semester = request.getParameter("semester");
			
			Course course =new Course() ;
			course.setCname(cname);
			course.setTeacher(teacher);
			course.setSemester(semester);
			InsertDao insertDao = new InsertDao();
			insertDao.insertCourse(course);			
			response.sendRedirect("/SC_System/page/addCourse.jsp");
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
