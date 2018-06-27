<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page import = "java.security.MessageDigest" %>
<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.net.*,javax.servlet.http.Cookie"%>
<link rel="stylesheet" type="text/css" href="css/login.css">
<script src="js/loginjs.js"></script>
<jsp:include page="frame/head.jsp"></jsp:include>

<body class="login_body">
	<div class = "content">
		<div class = "login_main">
			<div class = "login_main_header">
				BBS技术论坛
			</div>
			<form id = "messagesubmit" name = "messqgesubmit" class = "login_messagesubmit" method="post">
				<div class = "login_username">
					<input id ="name" name = "name" type = "text" placeholder = "用户名或邮箱" onblur = "n_lose_focus()" onfocus = "n_get_focus()"/>
				</div>
				<div class = "login_password">
					<input name = "password" id = "password" type = "password" placeholder = "密码" onblur = "p_lose_focus()" onfocus = "p_get_focus()"/>
					<button id = "button-switch" class = "login_button-switch" onclick = "pwd_text()"><i class= "fa fa-eye"></i></button>
				</div>
				<div id = "tips" class = "login_tips">账号或密码错误</div>
			</form>
			<div class = "login_forget">
				<a href = "#">忘记密码</a>
			</div>
			<input id = "button" type = "button" class = "login_login" value = "登录" onclick = "submit()"/>
			<div class = "login_register">
				<div class = "login_registera">
					没有账号？<a href = "register.jsp">注册</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>