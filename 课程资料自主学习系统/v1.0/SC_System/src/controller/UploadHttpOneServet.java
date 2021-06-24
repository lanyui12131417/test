package controller;

import utils.MyUtil;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 * Servlet implementation class UploadHttpOneServet
 */
@WebServlet("/uploadHttpOneServet")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class UploadHttpOneServet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadHttpOneServet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("utf-8");
		Part part = request.getPart("resPath");
		String filediscription = request.getParameter("filediscription");
		//out.println("输入的文件描述：" + filediscription + "<br>");
		File uploadFileDir = new File(getServletContext().getRealPath("/uploadFiles"));
		if(!uploadFileDir.exists()){
			uploadFileDir.mkdir();
		}
		String oldName = MyUtil.getFileName(part);
		//out.println("上传文件的原始名：" + oldName + "<br>");
		//out.println("上传文件的大小：" + part.getSize() + "<br>");
		if(oldName != null){
			part.write(uploadFileDir + File.separator + oldName);
		}
		//out.println("文件上传到：" + uploadFileDir + File.separator + oldName + "<br>");
		response.sendRedirect("/SC_System/page/uploadFile.jsp");
	}

}
