<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.net.*,javax.servlet.http.Cookie"%>
<% request.setCharacterEncoding("utf-8");
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
   String name = request.getParameter("name");

   try {	   
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection(connectString, user, pwd);
	  Statement stmt = con.createStatement();

	  String sql = "select * from bbs where sign = \"1\" LIMIT 10";
	  ResultSet rs = stmt.executeQuery(sql);
	  String res = "[";
	  while(rs.next()) {
		   res += "{" +   "\"type\":\"" + rs.getString("type") + "\"," + 
		   				  "\"title\":\"" + rs.getString("title") + "\"," + 
	  					  "\"browse\":\"" + rs.getString("browse") + "\"," +
		   				  "\"comment\":\"" + rs.getString("comment") + "\"," +
	  					  "\"date\":\"" + rs.getString("date") + "\"},";
	  }
	  res = res.substring(0, res.length() - 1);
	  res += "]";
	  out.print(res);
	  
	  rs.close();
	  stmt.close();
	  con.close();
   }
   catch(Exception e) {
	   msg = e.getMessage();
   }
%>
