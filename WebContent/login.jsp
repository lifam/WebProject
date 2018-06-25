<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*"%>
<%@ page import = "java.security.MessageDigest" %>
<% request.setCharacterEncoding("utf-8");
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
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
	   		
	   		Class.forName("com.mysql.jdbc.Driver");
	   		Connection con = DriverManager.getConnection(connectString, user, pwd);
	   		Statement stmt = con.createStatement();
	   
	  try {
	   		String sql = "select password_md5 from login where name = \"" + name + "\"";
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