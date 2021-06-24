<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>添加用户</title>
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
        <li><a href="${pageContext.request.contextPath}/page/updateAdminPwd.jsp"><i class="icon-user"></i> 修改密码</a></li>
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

<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-list"></i>Forms</a>
 <ul>
    <li><a href="${pageContext.request.contextPath}/page/index.jsp"><i class="icon icon-home"></i> <span>首页</span></a> </li>        
    <li class="submenu""> <a href="#"><i class="icon icon-th"></i> <span>用户管理</span> </a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/adminUserServlet">用户管理</a></li>
 		<li><a href="${pageContext.request.contextPath}/page/addUser.jsp">添加用户</a></li>
      </ul>
    </li>
    
    <li class="submenu active"> <a href="#"><i class="icon icon-th-list"></i> <span>新闻管理</span> </a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/adminNewsServlet">新闻管理</a></li>
 		<li><a href="${pageContext.request.contextPath}/page/#">添加新闻</a></li>
      </ul>
    </li>
  </ul>
</div>

<!--close-left-menu-stats-sidebar-->

<div id="content">
<div id="content-header">
  <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/page/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> <a href="#" class="tip-bottom">添加</a> <a href="#" class="current">添加新闻</a> </div>
  
</div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
    <div class="span6" style="margin-left:300px">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>添加新闻</h5>
        </div>
        <div class="widget-content nopadding">
            <form action="${pageContext.request.contextPath}/InsertNewsServlet" class="form-horizontal" method="post" name="password_validate" id="password_validate" novalidate="novalidate" >
		            <div class="control-group">
		              <label class="control-label">新闻标题:</label>
		              <div class="controls">
		                <input type="text" width="300px" placeholder="" name="newsTitle" />
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">新闻内容:</label>
		              <div class="controls" >
		                <input type="text" width="300px" height="500px" placeholder="" name="newsBody" />
		              </div>
		            </div>
		                <div class="form-actions">                
		                  <input type="submit" value="提交" class="btn btn-success" style="margin-left:250px">
		                </div>
              </form>
        </div>
      </div>
    </div>
  </div>
</div></div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12">  &copy; 课程资料自主学习系统.</div>
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
