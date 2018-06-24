<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*"%>
<%@ page import = "java.security.MessageDigest" %>
<% request.setCharacterEncoding("utf-8");
   String msg = "";
   String connectString = "jdbc:mysql://localhost:3306/web_user?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "root";
   String pwd = "password";
   String name = request.getParameter("name");
   String password = request.getParameter("password");  
   String password_md5, warn = "";
   
   if(request.getMethod().equalsIgnoreCase("post")) {
	   
	  password_md5 = "";
	  MessageDigest md5 = MessageDigest.getInstance("md5");
	  md5.update(password.getBytes());
	  byte[] by = md5.digest();
	  for(int i = 0; i < by.length; i++)
	    	password_md5 += Byte.toString(by[i]);
	   		
	   		Class.forName("com.mysql.cj.jdbc.Driver");
	   		Connection con = DriverManager.getConnection(connectString, user, pwd);
	   		Statement stmt = con.createStatement();
	   
	  try {
	   		String sql = "select password_md5 from user_info where name = \"" + name + "\"";
	   		ResultSet rs = stmt.executeQuery(sql);
	   		
	   		if(rs.next()) {
	   			
		   		if(password_md5.matches(rs.getString("password_md5")))
		   			out.print("right");
	   		}

		}
	 	catch(Exception e) {
	   		msg = e.getMessage();
	   	}
   }
%>