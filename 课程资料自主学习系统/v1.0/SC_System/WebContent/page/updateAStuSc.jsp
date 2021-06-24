<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="entity.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>首页</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-media.css" />
<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.gritter.css" />
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
<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 控制台</a>
  <ul>
    <li><a href="${pageContext.request.contextPath}/page/index.jsp"><i class="icon icon-home"></i> <span>首页</span></a> </li>
    <li><a href="${pageContext.request.contextPath}/adminUserServlet"><i class="icon icon-th"></i> <span>用户管理</span></a></li>
    <li class="active"><a href="${pageContext.request.contextPath}/adminStuServlet"><i class="icon icon-th"></i> <span>学生管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminTeacherServlet"><i class="icon icon-th"></i> <span>教师管理</span></a></li>
    <li><a href="#"><i class="icon icon-pencil"></i> <span>成绩审核</span></a></li>
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
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/page/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> <a href="${pageContext.request.contextPath}/adminStuServlet" class="tip-bottom">学生管理</a>  <a href="${pageContext.request.contextPath}/SearchStuServlet?number=${reqNumber}" class="tip-bottom">学生成绩</a> <a href="#" class="tip-bottom">成绩修改</a> </div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
    <div class="span6" style="margin-left:300px">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>成绩修改</h5>
        </div>
        <div class="widget-content nopadding">        
            <form action="${pageContext.request.contextPath}/UpdateThisASCServlet" method="post" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">学号 :</label>
              <div class="controls">
                <input type="text"  value="${thisSc.number}" name="number" readonly="readonly" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">课程名 :</label>
              <div class="controls">
                <input type="text"  value="${thisSc.cname}" name="cname" readonly="readonly" />
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">学期 :</label>
              <div class="controls">
                <input type="text"  value="${thisSc.semester}" name="semester" readonly="readonly" />
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">分数 :</label>
              <div class="controls">
                <input type="text"  value="${thisSc.source}" name="source" />
              </div>
            </div>

            <div class="control-group">
              <label class="control-label"> 授课教师:</label>
              <div class="controls">
                <input type="text" value="${thisSc.teacher}" name="teacher" readonly="readonly" />
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">状态 :</label>
              <div class="controls">
                <input type="text"  value="${thisSc.flag}" name="flag" readonly="readonly" />
              </div>
            </div>
            <div class="form-actions">
            <button type="button" class="btn btn-warning"  onclick="javascript:history.back(-1);" style="margin-left:220px">返回</button>
             
             <button type="submit" class="btn btn-success" onclick="return confirm('确定修改？');" style="margin-left:5px">修改</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12">  &copy; 学生成绩管理系统. </div>
</div>

<!--end-Footer-part-->

<script src="${pageContext.request.contextPath}/js/excanvas.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.flot.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.flot.resize.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.peity.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.dashboard.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.gritter.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.interface.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.chat.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.form_validation.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.wizard.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath}/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.popover.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.tables.js"></script> 

<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>
