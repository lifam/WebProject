<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.io.*,java.net.*"%>
<%@ page import = "java.security.MessageDigest" %>

<% request.setCharacterEncoding("utf-8");
   

   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
   String name = "";
   Cookie[] cookies = request.getCookies();
   String nickname = "";
   for(Cookie cookie:cookies){
   		if(cookie.getName().equals("name"))
   		{
   			name = cookie.getValue();
   		}
	}

   String password = request.getParameter("password"); 
   String password_md5, warn = "";
   String sex = "";
   String description = "";
   String qq = "";
   String tel = "";
   String headimg = "";
   String fileName = "";
	
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection(connectString, user, pwd);
	  Statement stmt = con.createStatement();
    
	  if(request.getMethod().equalsIgnoreCase("post")){
		  try{

		  String fmt="UPDATE personal_info SET description='%s',qq='%s',tel='%s' where name='%s' ";
		  description = request.getParameter("description");
		  qq = request.getParameter("qq");
		  tel = request.getParameter("tel");
		  String sql = String.format(fmt,description,qq,tel,name);
		  int cnt = stmt.executeUpdate(sql);
		  if (cnt>0) msg = "Update Success!";
		  stmt.close();
		  con.close();
		}
		catch(Exception e){
			msg = e.getMessage();
		}
	  }

	  try {
	  		String sql = "SELECT * FROM personal_info where name = \"" + name + "\"";
	  		ResultSet rs = stmt.executeQuery(sql);
	  		if(rs.next()){
	  			nickname = rs.getString("nickname");
	  			sex = rs.getString("sex");
	  			description = rs.getString("description");
	  			qq = rs.getString("qq");
	  			tel = rs.getString("tel");
          headimg = application.getRealPath("/head_image") + System.getProperty("file.separator") + rs.getString("head_image") ;
	  		}
		}
	 	catch(Exception e) {
	   		msg = e.getMessage();
	  }

%>
<jsp:include page="frame/head.jsp"></jsp:include>

    <div class="ui main container">
        <div class="ui internally celled grid">
            <!--第一列-->
            <div class="three wide column">
                <a href="#" class="ui medium image"><img src="<%=headimg%>"></a>
                <div class="ui labeled button" tabindex="0" style="margin:20px">
                    <div class="ui red button"><i class="heart icon"></i> Like </div>
                    <a class="ui basic red left pointing label">1</a>
                </div>
                <a href="personal-setting.jsp" class="ui button" tabindex="0" style="margin:19px">设置个人信息</a>
            </div>
            <!--second column-->
            <div class="six wide column">
                <h2 class="ui header">基础信息</h2>
                <br>
                
                <div class="ui segment">
                    <div class="content">
                        <h4 class="header"><i class="user icon"></i>昵称:<%=nickname%></h4>
                    </div>
                </div>
                <div class="ui segment">
                    <div class="content">
                        <h4 class="header">					
                        男：<input type="radio" name="sex" value="male" <%=sex.equals("male")?"checked":""%> />
						女：<input type="radio" name="sex" value="female" <%=sex.equals("female")?"checked":""%> /></h4>
                    </div>
                </div>
                <div class="ui segment">
                    <div class="content">
                        <h4 class="header"><i class="comments icon"></i>QQ:<%=qq%></h4>
                    </div>
                </div>
                <div class="ui segment">
                    <div class="content">
                        <h4 class="header"><i class="call icon"></i>电话:<%=tel%></h4>
                    </div>
                </div>  
                <div class="ui segment">
                    <div class="content">
                        <h4 class="header">个人简介:</h4>
                        <%=description%>
                    </div>
                </div>              
            </div>
            <!--third column-->
            <div class="seven wide column">
                <h2 class="ui header">我的动态:</h1>
                <p></p>
            <div class="ui feed">
              <div class="event">
              <div class="label">
                  <img src="<%=headimg%>">
              </div>
              <div class="content">
                  <div class="summary"><a class="user"><%=nickname%></a> added you as a friend <div class="date">1 小时前 </div>
                  </div>
                  <div class="meta">
                    <a class="like"><i class="like icon"></i> 1 Likes </a>
                  </div>
              </div>
            </div>  
          </p>
        </div>
    </div>
  </div>
  <jsp:include page="frame/footer.jsp"></jsp:include>
</body>
</html>