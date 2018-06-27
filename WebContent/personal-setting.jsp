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
   String major = "";
   String qq = "";
   String tel = "";
   String headimg = "head_image/" + name + ".png";
   String fileName = "";
   String requestBody = "";
   String contentType = "";
   String boundary = "";	   	

	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection(connectString, user, pwd);
	  Statement stmt = con.createStatement();
	  if(request.getMethod().equalsIgnoreCase("post")){
		  try{
		  String fmt="UPDATE personal_info SET nickname='%s',sex='%s',description='%s',major='%s',qq='%s',tel='%s' where name='%s' ";
		  nickname = request.getParameter("nickname");
		  sex = request.getParameter("sex");
		  description = request.getParameter("description");
		  major = request.getParameter("major");
		  qq = request.getParameter("qq");
		  tel = request.getParameter("tel");
		  headimg = "/head_image" + name + ".png";
		  String sql = String.format(fmt,nickname,sex,description,major,qq,tel,name);
		  int cnt = stmt.executeUpdate(sql);
		  if (cnt>0) msg = "Update Success!";
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
	  			sex = rs.getString("sex");
	  			description = rs.getString("description");
	  			major = rs.getString("major");
	  			qq = rs.getString("qq");
	  			tel = rs.getString("tel");
	  		}


		}
	 	catch(Exception e) {
	   		msg = e.getMessage();
	   	}
	  }

%>
<jsp:include page="frame/head.jsp"></jsp:include>


    <div class="ui main container">
        <div class="ui internally celled grid">
            <!--第一列-->
            <div class="four wide column">
                <div class="ui vertical menu">
                    <a class="active teal header item">账户设置 </a>                    
                    <a class="active item">基本信息 </a>                
                </div>
            </div>
            <!--第2列-->
            <div class="six wide column">
                <h2 class="ui header">基础信息</h2>
                <div class="ui divider"></div>
                <form action="personal-setting.jsp" method="post" class="ui large form">
                    <p>
                        <h4 class="ui header">用户名:</h4>
                        <i class="user icon"></i>
                        <div class="ui input">
                            <%=name%>
                        </div>
                    </p>
                    <p>
                        <h4 class="ui header">昵称:</h4>
                        <i class="mail icon"></i>
                        <div class="ui input">
                            <%=nickname%>
                        </div>
                    </p>
                    <p>
                        <h4 class="ui header">QQ:</h4>
                        <i class="mail icon"></i>
                        <div class="ui input">
                            <input type="text" name="qq" value="<%=qq%>"/>
                        </div>
                    </p>
                    <p>
                        <h4 class="ui header">Tel:</h4>
                        <i class="mail icon"></i>
                        <div class="ui input">
                            <input type="text" name="tel" value="<%=tel%>"/>
                        </div>
                    </p>
                    <p>
                        <h4 class="ui header">个人简介:</h4>
                        <i class="mail icon"></i>
                        <div class="ui input">
                            <textarea rows="5" cols="50" name="description"><%=description%></textarea> 
                        </div>
                    </p>                                                                              
                    <button class="ui primary submit button" style="margin-top:60px;margin-left:100px">保存修改</button>
                    <a class="ui button" href="indentity.jsp">取消修改</a>
                    <div class="ui error message"></div>
                </form>
            </div>
            <!--第3列-->
            <div class="four wide column">
                <div class="ui segment">
                    <a href="#" class="ui centered medium image">
                        <img src="/LemonApp/media/{{ request.user.face }}">
                    </a>
                </div>
                <form action="change_face" method="post" class="ui form" enctype="multipart/form-data">
                    {% csrf_token %}
                      <div class="field">
                          <h5 class="ui header">更改头像:</h5>
                          <input type="file" name="face" placeholder="选择头像" required id="face" />
                      <button class="ui primary submit button" style="margin-top:10px;margin-left:90px">保存</button>
                      <a class="ui button" href="/identity/">取消</a>
                    </div>
                    <div class="ui error message"></div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

