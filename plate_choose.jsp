<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.*, java.sql.*"%>
<% request.setCharacterEncoding("utf-8");
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
   
   try {	   
	  	Class.forName("com.mysql.jdbc.Driver");
	  	Connection con = DriverManager.getConnection(connectString, user, pwd);
	  	Statement stmt = con.createStatement();
	  	String sql = "";
		
	  	if(request.getParameter("type") != null) {
	  		sql = "select * from bbs where type in (select type from type where type_id = " + request.getParameter("type") + ")";
	  	}
	  	else if(request.getParameter("action") != null) {
	  		sql = "select * from type";
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
	        				  "\"type_id\":\"" + rs.getString("type_id") + "\"},";
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