<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.net.*,javax.servlet.http.Cookie"%>
<% request.setCharacterEncoding("utf-8");
    

   //数据库信息
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
   String name = "";
   
   StringBuilder table = new StringBuilder("");
   String str1 = "<div class = \"ui styled fluid accordion\"><div class=\"title\"><i class=\"dropdown icon\"></i>";
   String str2 = "</div><div class=\"content\"><p class = \"transition hidden\">";
   String fmt = "</p><p class = \"transition hidden\"><a href = \"page.jsp?uid=%s\">进入</a></p></div></div>";
   String str3 = "";



   Cookie[] cookies = request.getCookies();
   for(Cookie cookie:cookies){
      if(cookie.getName().equals("name"))
      {
        name = cookie.getValue();
      }
   }

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(connectString, user, pwd);
    Statement stmt = con.createStatement();
    String content = "";
    String title = "";
	  String nickname = "";
    try{
      String sql = "SELECT * FROM personal_info where name = '" + name + "'";
      System.out.println(sql);
      ResultSet rs = stmt.executeQuery(sql);
      if(rs.next()){
        nickname = rs.getString("nickname");
      //System.out.println(nickname);     
      }
    }catch(Exception e) {
      msg = e.getMessage();
    }
    if(request.getMethod().equalsIgnoreCase("post")){
    try{
      String fmt1="insert into bbs(nickname,title,content) values('%s','%s','%s')";
      title = request.getParameter("title");
      content = request.getParameter("content");
      String sql = String.format(fmt1,nickname,title,content);
      //System.out.println(sql);
      int cnt = stmt.executeUpdate(sql);

    }
    catch(Exception e){
      msg = e.getMessage();
    }
    }



   try {	   
	   String sql = "select * from bbs";
	   ResultSet rs = stmt.executeQuery(sql);

	   while(rs.next()) {
       table.append(str1);
       table.append(rs.getString("title"));
       table.append(str2);
       table.append(rs.getString("content"));
       str3 = String.format(fmt,rs.getString("uid"));
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


  <div class ="ui main container" >
	<div class = "ui grid">
    <% if(name!=""){ %>
      <a  href="write.jsp" class="ui primary button" style="margin-top:10px;margin-left:75rem;width:100px;font:white" ><i class="icon edit"></i>发帖</a>
    <%} else{ %>
          <a  href="login.jsp" class="ui primary button" style="margin-top:10px;margin-left:75rem;width:100px;font:white" ><i class="icon edit"></i>发帖</a>
    <% } %>
  </div>
<div class = "ui divider" style="margin-top:30px"></div>
    <%=table%>
</div>

<jsp:include page="frame/footer.jsp"></jsp:include>

</body>

</html>