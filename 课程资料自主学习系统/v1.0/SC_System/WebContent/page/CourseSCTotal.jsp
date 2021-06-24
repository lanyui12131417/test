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
    <li><a><i class="icon icon-file"></i> <span>数据统计</span></a>
    </li>
  </ul>
</div>

<div id="content">
  <div id="content-header">
  <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/page/teacherIndex.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> <a href="#" class="tip-bottom">数据统计</a>  </div>
  
</div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">	
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>数据统计</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>课程名</th>
                  <th>最高分</th>
                  <th>最低分</th>
				  <th>平均分</th>
				  <th>及格人数</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="thisData" items="${ totals }">
              	<tr class="gradeX">
                  <td><center>${ thisData.cname }</center></td>
				  <td><center>${ thisData.maxScore}</center></td>
                  <td><center>${ thisData.minScore }</center></td>
                  <td><center>${ thisData.avg }</center></td>
				  <td><center>${ thisData.passNum }</center></td
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
