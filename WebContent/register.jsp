<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*"%>
<%@ page import = "java.security.MessageDigest" %>
<link rel="stylesheet" type="text/css" href="css/register.css">
<script src="js/register.js"></script>


<jsp:include page="frame/head.jsp"></jsp:include>
<div class = "content">
		<div class = "reg_main">
			<div class = "main_header">
				Movie Circle
			</div>
			<form class = "messagesubmit" name = "messagesubmit" class = "messagesubmit">
				<div class = "reg_username">
					<input id = "name" name = "name" type = "text" placeholder = "用户名或邮箱" onblur = "n_lose_focus()" onfocus = "n_get_focus()"/>
				</div>
				<div class = "reg_password">
					<input name = "password" id = "password" type = "password" placeholder = "密码" onblur = "p_lose_focus()" onfocus = "p_get_focus()"/>
					<button id = "button-switch" class = "button-switch" onclick = "pwd_text()"><i class= "fa fa-eye"></i></button>
				</div>
				<div class = "nickname">
					<input name = "nickname" id = "nickname" type = "text" placeholder = "昵称" onblur = "c_lose_focus()" onfocus = "c_get_focus()"/>
				</div>
				<div id = "tips" class = "tips">账号或昵称已存在</div>
			</form>
			<input id = "button" type = "button" class = "login" value = "注册" onclick = "submit()"></input>
			<div class = "register">
				<div class = "registera">
					已有账号？<a href = "login.jsp">登录</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="frame/footer.jsp"></jsp:include>
</body>
</html>

