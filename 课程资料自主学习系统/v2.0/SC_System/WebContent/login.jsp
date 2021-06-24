<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Calm breeze login screen</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
  
</head>

<body>
  <div class="wrapper">
	<div class="container">
		<h1>欢迎</h1>
		<%
		//显示错误信息
		String msg = "";
		if (request.getAttribute("msg") != null) {
			msg = (String) request.getAttribute("msg");
		}
		%>
		<h3>
		<font color="red">
		<%=msg %>
		</font>
		</h3>
		<form method="post" action="${pageContext.request.contextPath}/LoginServlet" class="form">
			<input type="text" placeholder="用户名" name="username">
			<input type="password" placeholder="密码" name="password" >
			<button type="submit" id="login-button">登陆</button>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>




</body>
</html>