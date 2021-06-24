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

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 控制台</a>
  <ul>
    <li><a href="page/teacherIndex.jsp"><i class="icon icon-home"></i> <span>首页</span></a> </li>
    <li class="submenu"><a href="#"><i class="icon icon-th"></i> <span>成绩查询</span></a>
    	<ul>
    		<c:forEach var="teaCourse" items="${sessionScope.thisTeaCoursesList}">
	       	 <li><a href="${pageContext.request.contextPath}/SearchSCServlet?username=${sessionScope.existUser.getUsername()}&cno=${teaCourse.cno}">${teaCourse.cname}</a></li>
	        </c:forEach>
      	</ul>
    </li>
 	<li class="submenu"><a href="#"><i class="icon icon-pencil"></i> <span>成绩录入</span></a>
    	<ul>
    		<c:forEach var="teaCourse" items="${sessionScope.thisTeaCoursesList}">
	       	 <li><a href="${pageContext.request.contextPath}/GotoAddSCServlet?username=${sessionScope.existUser.getUsername()}&cno=${teaCourse.cno}">${teaCourse.cname}</a></li>
	        </c:forEach>
      	</ul>
    </li>
    <li><a href="${pageContext.request.contextPath}/CourseSCTotal?username=${sessionScope.existUser.getUsername()}"><i class="icon icon-file"></i> <span>数据统计</span></a>
    </li>
  </ul>
</div>

<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/page/teacherIndex.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> <a href="#" class="tip-bottom">成绩查询</a>  </div>
  
</div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">	
      	<a href="${pageContext.request.contextPath}/SearchSCmServlet?username=${sessionScope.existUser.getUsername()}&cno=${sessionScope.thisCno}"><button class="btn btn-danger btn-mini">不及格成绩</button></a>
      	<a href="${pageContext.request.contextPath}/SearchSCbServlet?username=${sessionScope.existUser.getUsername()}&cno=${sessionScope.thisCno}"><button class="btn btn-success btn-mini">及格成绩</button></a>
        <a href="${pageContext.request.contextPath}/SearchSCServlet?username=${sessionScope.existUser.getUsername()}&cno=${sessionScope.thisCno}"><button class="btn btn-primary btn-mini">全部成绩</button></a>
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>学生成绩</h5>
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
				  <th>状态</th>
				  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="thisCoursesSC" items="${ thisCoursesSCList }">
              	<tr class="gradeX">
                  <td><center>${ thisCoursesSC.number }</center></td>
				  <td><center>${ thisCoursesSC.cname }</center></td>
                  <td><center>${ thisCoursesSC.semester }</center></td>
                  <td><center>${ thisCoursesSC.source }</center></td>
				  <td><center>${ thisCoursesSC.teacher }</center></td>
				  <td><center>${ thisCoursesSC.flag }</center></td>
                  <td>
                  <center>
                  	<c:if test="${ thisCoursesSC.flag eq '审核中'  ||  thisCoursesSC.flag eq '已审核' }">
                  		<font color="red">不可操作</font>
                  	</c:if>
                  	<c:if test="${ thisCoursesSC.flag eq '未送审'  ||  thisCoursesSC.flag eq '驳回' }">
                  		<a href="${pageContext.request.contextPath}/UpdateStuScServlet?number=${ thisCoursesSC.number }&username=${sessionScope.existUser.getUsername()}&cname=${thisCoursesSC.cname}&semester=${thisCoursesSC.semester}"><button class="btn btn-warning btn-mini">修改</button></a>
                  		<a href="${pageContext.request.contextPath}/UpdateTFlagServlet?number=${ thisCoursesSC.number }&username=${sessionScope.existUser.getUsername()}&cname=${thisCoursesSC.cname}&semester=${thisCoursesSC.semester}" onclick="return confirm('确定送审？');"><button class="btn btn-info btn-mini">送审</button></a>                  	
                  		<a href="${pageContext.request.contextPath}/DelTStuSCServlet?number=${thisCoursesSC.number}&username=${sessionScope.existUser.getUsername()}&cname=${thisCoursesSC.cname}&semester=${thisCoursesSC.semester}" onclick="return confirm('确定删除？');"><button class="btn btn-danger btn-mini">删除</button></a>
                  	</c:if>
                  </center>
                  </td>
                </tr>
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
