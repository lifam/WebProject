<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.net.*,javax.servlet.http.Cookie"%>

<% request.setCharacterEncoding("utf-8");
   
   //设置数据库信息
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";

   //从cookie中获取当前用户名
   String name = "";
   Cookie[] cookies = request.getCookies();
   String nickname = "bravo";
   for(Cookie cookie:cookies){
   		if(cookie.getName().equals("name"))
   		{
   			name = cookie.getValue();
   		}
	}
   	

   String content = "";
   String title = "";

   //连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection(connectString, user, pwd);
   Statement stmt = con.createStatement();


	if(request.getMethod().equalsIgnoreCase("post")){

		try{
		  String fmt="insert into bbs(nickname,title,content) values('%s','%s','%s')";
		  title = request.getParameter("title");
		  content = request.getParameter("content");
		  String sql = String.format(fmt,nickname,title,content);
		  int cnt = stmt.executeUpdate(sql);

		  stmt.close();
		  con.close();
		}
		catch(Exception e){
			msg = e.getMessage();
		}
	  }
	  else{
	  try {
	  		String sql = "SELECT * FROM personal_info where name = \"" + name + "\"";
	  		ResultSet rs = stmt.executeQuery(sql);

	  		if(rs.next()){
	  			nickname = rs.getString("nickname");

	  		}


		}
	 	catch(Exception e) {
	   		msg = e.getMessage();
	   	}
	  }

%>

<jsp:include page="frame/head.jsp"></jsp:include>

	<div class = "ui main container">
	  <div class = "ui breadcrumb">
	  	<a class = "section" href="index.jsp">主页</a>
	  	<div class = "divider"> / </div>
	  	<div class = "active section">发帖</div>
	  </div>
	  <div class="ui grid">
	  </div>
	  	<div class = "ui divider" style="margin-top:40px">
	  	</div>
	  <form action="page.jsp" method="post">
	  	<h3 class = "ui header">标题</h3>
	  		<div class="ui input foucs" style= "width:80rem">
  				<input type="text" name="title" placeholder="标题"> 
			</div>
	  		<h3 class = "ui header">内容</h3>
<!-- 		<div class="ui icon buttons">
  			<button class="ui button"><i class="align left icon"></i></button>
  			<button class="ui button"><i class="align center icon"></i></button>
  			<button class="ui button"><i class="align right icon"></i></button>
  			<button class="ui button"><i class="align justify icon"></i></button>
		</div>
		<div class="ui icon buttons">
  			<button class="ui button"><i class="bold icon"></i></button>
  			<button class="ui button"><i class="underline icon"></i></button>
  			<button class="ui button"><i class="text width icon"></i></button>
		</div> -->
<!-- 		<div class = "field" style="margin-top:20px"> -->
			<style>
			textarea{
				width:80rem;
				height:25rem;
			}
		    </style>
		    <div class="field">
			 	<textarea name="content"></textarea>
			</div>
<!-- 		</div> -->


		<button type="submit" class="ui primary button" style="margin-top:10px;margin-bottom:50px" ><i class="icon edit"></i>发帖</button>
<!-- 		<button class="ui  button" style="margin-top:10px;margin-bottom:20px;" ><i class="folder  icon"></i>保存草稿</button>
		<button class="ui  button" style="margin-top:10px;margin-bottom:20px;" ><i class="unhide icon"></i>预览</button>
		<button class="ui  button" style="margin-top:10px;margin-bottom:20px;" ><i class="remove icon"></i>取消</button> -->
	</form>
</div>
</body>