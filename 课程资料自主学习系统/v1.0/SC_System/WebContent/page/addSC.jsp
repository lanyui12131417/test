<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>成绩录入</title>
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
        <li><a href="${pageContext.request.contextPath}/LoginOutServlet" onclick="return confirm('确定退出？');"><i class="icon icon-share-alt"></i> 退出</a></li>
      </ul>
    </li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
  <a title="" href="${pageContext.request.contextPath}/LoginOutServlet"  onclick="return confirm('确定退出？');"><i class="icon icon-share-alt"></i> <span class="text">退出</span></a>
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

<!--close-left-menu-stats-sidebar-->

<div id="content">
<div id="content-header">
  <div id="breadcrumb"> <a href="page/teacherIndex.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> <a href="#" class="tip-bottom">成绩录入</a> <a href="#" class="current">${reqCourse.cname}</a> </div>
  
</div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
    <div class="span6" style="margin-left:300px">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>成绩录入</h5>
        </div>
        <div class="widget-content nopadding">        
            <form action="${pageContext.request.contextPath}/InsertThisCourseSCServlet?username=${sessionScope.existUser.getUsername()}&cno=${thisCno}" method="post" class="form-horizontal">
			<div class="control-group">
              <label class="control-label">学号 :</label>
              <div class="controls">
                <input type="text"  placeholder="" name="number" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">课程名 :</label>
              <div class="controls">
                <input type="text" value="${reqCourse.cname}" name="cname" readonly="readonly"/>
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">学期 :</label>
              <div class="controls">
                <input type="text"  placeholder="" name="semester" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">分数 :</label>
              <div class="controls">
                <input type="text"  placeholder="" name="source" />
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">授课教师 :</label>
              <div class="controls">
                <input type="text"  value="${ thisTeacher.getName() }" name="teacher" readonly="readonly" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">状态 :</label>
              <div class="controls">
                <input type="text" value="未送审"  name="flag" readonly="readonly"/>
              </div>
            </div>
            <div class="form-actions">
              <button type="submit" class="btn btn-success" style="margin-left:250px" onclick="return confirm('确定提交？');">提交</button>
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
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.form_validation.js"></script>
<script>
	$('.textarea_editor').wysihtml5();
</script>
</body>
</html>
