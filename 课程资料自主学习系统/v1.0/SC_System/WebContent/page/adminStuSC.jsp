<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@page import="entity.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>学生管理</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/uniform.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-media.css" />
<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
<%
		User existUser = (User) request.getSession().getAttribute("existUser");
%>
<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">MatAdmin</a></h1>
</div>
<!--close-Header-part-->
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎 ${sessionScope.existUser.getPosition()} </span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> 修改密码</a></li>
        <li class="divider"></li>
        <li><a href="${pageContext.request.contextPath}/LoginOutServlet" onclick="return confirm('确定退出？');"><i class="icon icon-share-alt"></i> 退出</a></li>
      </ul>
    </li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
  <a title="" href="${pageContext.request.contextPath}/LoginOutServlet" onclick="return confirm('确定退出？');"><i class="icon icon-share-alt"></i> <span class="text">退出</span></a>
</div>
<!--sidebar-menu-->

<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-th"></i>Tables</a>
  <ul>
    <li ><a href="${pageContext.request.contextPath}/page/index.jsp"><i class="icon icon-home"></i> <span>首页</span></a> </li>
    <li><a href="${pageContext.request.contextPath}/adminUserServlet"><i class="icon icon-th"></i> <span>用户管理</span></a></li>
    <li class="active"><a href="${pageContext.request.contextPath}/adminStuServlet"><i class="icon icon-th"></i> <span>学生管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminTeacherServlet"><i class="icon icon-th"></i> <span>教师管理</span></a></li>
        <li><a href="${pageContext.request.contextPath}/SelectFlagSCServlet"><i class="icon icon-pencil"></i> <span>成绩审核</span></a></li>
     <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>添加 </span> </a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/page/addStu.jsp">添加学生</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addTeacher.jsp">添加教师</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addUser.jsp">添加用户</a></li>      
        <li><a href="${pageContext.request.contextPath}/page/addCollege.jsp">添加学院</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addMajor.jsp">添加专业</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addClasses.jsp">添加班级</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addSemester.jsp">添加学期</a></li>
      </ul>
    </li>
    <li><a href="${pageContext.request.contextPath}/adminCollegeServlet"><i class="icon icon-th"></i> <span>学院管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminMajorServlet"><i class="icon icon-th"></i> <span>专业管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminClassesServlet"><i class="icon icon-th"></i> <span>班级管理</span></a></li>
  </ul>
</div>
<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/page/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> <a href="${pageContext.request.contextPath}/adminStuServlet" class="tip-bottom">学生管理</a>  <a href="#" class="tip-bottom">学生成绩</a> </div>
  
</div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">	
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>学生数据</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>                            
                  <th>学号</th>
                  <th>课程名</th>  
				  <th>学期</th>
				  <th>分数</th>
				  <th>授课教师</th>
				  <th>审核状态</th>
				  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="sc" items="${ scList }">
              	<c:if test="${ sc.flag eq '已审核' }">
              	<tr class="gradeX">
              	  <td><center>${ sc.number }</center></td>
                  <td><center>${ sc.cname }</center></td>
				  <td><center>${ sc.semester }</center></td>
                  <td><center>${ sc.source }</center></td>                  
				  <td><center>${ sc.teacher }</center></td>
				  <td><center>${ sc.flag }</center></td>
                  <td>
                  <center>                  	
                  	<a href="${pageContext.request.contextPath}/UpdateASCServlet?number=${sc.number}&cname=${sc.cname}&semester=${sc.semester}"><button class="btn btn-warning btn-mini">修改</button></a>
                  	<a href="${pageContext.request.contextPath}/DelASCServlet?number=${sc.number}&cname=${sc.cname}&semester=${sc.semester}" onclick="return confirm('确定删除？');"><button class="btn btn-danger btn-mini">删除</button></a>
                  </center>
                  </td>
                </tr>
                </c:if>
              </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; MatAdmin.</div>
</div>
<!--end-Footer-part-->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath}/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.tables.js"></script>
</body>
</html>
