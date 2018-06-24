<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.*, java.sql.*"%>
<% request.setCharacterEncoding("utf-8");
   String msg = "";
   String connectString = "jdbc:mysql://localhost:3306/web_user?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "root";
   String pwd = "password";
   
   try {	   
	  	Class.forName("com.mysql.cj.jdbc.Driver");
	  	Connection con = DriverManager.getConnection(connectString, user, pwd);
	  	Statement stmt = con.createStatement();
	  	String sql = "";
		
	  	if(request.getParameter("type") != null) {
	  		sql = "select * from user_invitation where type in (select type from type_id where id = " + request.getParameter("type") + ")";
	  	}
	  	else if(request.getParameter("action") != null) {
	  		sql = "select * from type_id";
	  	}
	  	
	  	ResultSet rs = stmt.executeQuery(sql);
	  	
	  	String res = "[";
	  	while(rs.next()) {
	  		if(request.getParameter("type") != null)
		   		res += "{" +  "\"type\":\"" + rs.getString("type") + "\"," + 
		   				  	  "\"title\":\"" + rs.getString("title") + "\"," + 
	  					      "\"browse\":\"" + rs.getString("browse") + "\"," +
		   				      "\"comment\":\"" + rs.getString("comment") + "\"," +
	  					      "\"date\":\"" + rs.getString("date") + "\"},";
	        else if(request.getParameter("action") != null)
	        	res += "{" +  "\"type\":\"" + rs.getString("type") + "\"," +
	        				  "\"id\":\"" + rs.getString("id") + "\"},";
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