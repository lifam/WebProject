<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.net.*,javax.servlet.http.Cookie"%>
<% request.setCharacterEncoding("utf-8");
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
   String name = "";
   Cookie[] cookies = request.getCookies();
   StringBuilder table = new StringBuilder("");
   String str1 = "<div class = \"ui styled fluid accordion\"><div class=\"title\"><i class=\"dropdown icon\"></i>";
   String str2 = "</div><div class=\"content\"><p class = \"transition hidden\">";
   String fmt = "</p><p class = \"transition hidden\"><a href = \"page.jsp?nickname=%s\">进入</a></p></div></div>";
   String str3 = "";
   for(Cookie cookie:cookies){
      if(cookie.getName().equals("name"))
      {
        name = cookie.getValue();
      }
   }
   try {	   
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection(connectString, user, pwd);
	  Statement stmt = con.createStatement();

	  String sql = "select * from bbs where sign = \"1\" LIMIT 10";
	  ResultSet rs = stmt.executeQuery(sql);

	  while(rs.next()) {
       table.append(str1);
       table.append(rs.getString("title"));
       table.append(str2);
       table.append(rs.getString("content"));
       str3 = String.format(fmt,rs.getString("nickname"));
       table.append(str3);
	  }

	  rs.close();
	  stmt.close();
	  con.close();
   }
   catch(Exception e) {
	   msg = e.getMessage();
   }
%>

<jsp:include page="frame/head.jsp"></jsp:include>


  <div class ="ui main container">
	<div class = "ui grid">
    <% if(name!=""){ %>
      <a  href="write.jsp" class="ui primary button" style="margin-top:10px;margin-left:75rem;width:100px;font:white" ><i class="write icon"></i>发帖</a>
    <%} else{ %>
          <a  href="login.jsp" class="ui primary button" style="margin-top:10px;margin-left:75rem;width:100px;font:white" ><i class="write icon"></i>发帖</a>
    <% } %>
  </div>
  <div class = "ui divider" style="margin-top:30px"></div>
<!-- part I -->
    <%=table%>
<!-- End Part I -->
</div>

</body>

</body>
</html>