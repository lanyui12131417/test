<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>添加学期</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorpicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/uniform.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-media.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5.css" />
<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

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
        <li><a href="${pageContext.request.contextPath}/LoginOutServlet" onclick="return confirm('确定退出？');"><i class="icon-key"></i> 退出</a></li>
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

<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-list"></i>Forms</a>
 <ul>
    <li ><a href="${pageContext.request.contextPath}/page/index.jsp"><i class="icon icon-home"></i> <span>首页</span></a> </li>
    <li><a href="${pageContext.request.contextPath}/adminUserServlet"><i class="icon icon-th"></i> <span>用户管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminStuServlet"><i class="icon icon-th"></i> <span>学生管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminStuServlet"><i class="icon icon-th"></i> <span>教师管理</span></a></li>
    <li><a href="grid.html"><i class="icon icon-fullscreen"></i> <span>网格布局</span></a></li>
    <li class="submenu active"> <a href="#"><i class="icon icon-th-list"></i> <span>添加</span> </a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/page/addStu.jsp">添加学生</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addTeacher.jsp">添加教师</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addUser.jsp">添加用户</a></li>      
        <li><a href="${pageContext.request.contextPath}/page/addCollege.jsp">添加学院</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addClasses.jsp">添加班级</a></li>
        <li><a href="${pageContext.request.contextPath}/page/addSemester.jsp">添加学期</a></li>
      </ul>
    </li>
    <li><a href="${pageContext.request.contextPath}/adminCollegeServlet"><i class="icon icon-th"></i> <span>学院管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminMajorServlet"><i class="icon icon-th"></i> <span>专业管理</span></a></li>
    <li><a href="${pageContext.request.contextPath}/adminClassesServlet"><i class="icon icon-th"></i> <span>班级管理</span></a></li>
</div>

<!--close-left-menu-stats-sidebar-->

<div id="content">
<div id="content-header">
  <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/page/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> <a href="#" class="tip-bottom">添加</a> <a href="#" class="current">添加专业</a> </div>
  
</div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
    <div class="span6" style="margin-left:300px">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>添加班级</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="${pageContext.request.contextPath}/InsertMajorServlet" method="post" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">专业名 :</label>
              <div class="controls">
                <input type="text"  placeholder="" name="majorname" />
              </div>
           </div>
           <div class="control-group">
              <label class="control-label">所属学院 :</label>
              <div class="controls">
                <input type="text"  placeholder="" name="mcollege" />
              </div>
           </div>
            <div class="form-actions">
              <button type="submit" class="btn btn-success" style="margin-left:250px">提交</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12">  &copy; 学生成绩管理系统.</div>
</div>
<!--end-Footer-part--> 
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-colorpicker.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.toggle.buttons.html"></script> 
<script src="${pageContext.request.contextPath}/js/masked.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath}/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.form_common.js"></script> 
<script src="${pageContext.request.contextPath}/js/wysihtml5-0.3.0.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.peity.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-wysihtml5.js"></script> 
<script>
	$('.textarea_editor').wysihtml5();
</script>
</body>
</html>
