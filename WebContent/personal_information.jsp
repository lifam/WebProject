<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.io.*,java.net.*"%>
<%@ page import = "java.security.MessageDigest" %>
<%!// 读取http请求的正文并转化为字符串。
 String getRequestBody(HttpServletRequest request)throws Exception{
 	 int contentLength = request.getContentLength(); 
 	 DataInputStream in = new DataInputStream(request.getInputStream());
 	 byte dataBytes[]=new byte[contentLength]; 
 	 int bytesRead = 0; int totalBytesRead = 0; 
 	 while(totalBytesRead<contentLength){ 
 	 	bytesRead = in.read(dataBytes,totalBytesRead,contentLength);
 	 	totalBytesRead += bytesRead; 
 	 	} 
 	 String requestBody = new String(dataBytes,"ISO-8859-1");
 	 return requestBody; 
 }
 // 找出用来把正文划分为多个部分的边界字符串 
 String getBoundary(String contentType){ 
 	int lastIndex = contentType.lastIndexOf("="); 
 	return contentType.substring(lastIndex+1,contentType.length());      
 } 

 // 找出正文的一个划分部分的头部中找出文件名 
 String getFileName(String partOfBody) throws Exception { 
 	final String RET = "\r\n"; String fileName = ""; 
 	int lineStart = 0; int lineEnd = partOfBody.indexOf(RET); 
 	while(lineEnd>=0){ 
 		String line = partOfBody.substring(lineStart, lineEnd); 
 		lineStart = lineEnd+RET.length();        
 		lineEnd = partOfBody.indexOf(RET,lineStart); 
 		if(line.isEmpty()){ break; } 
 		else{ 
 			if(line.toLowerCase().indexOf("filename")>=0){            
 			fileName = line.substring(line.lastIndexOf("=")+1).trim(); 
 			fileName = fileName.substring(1, fileName.length()-1); 
 			fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");
 			 break; 
 			}
 		}
 	}
 	return fileName; 
 }

 boolean saveFile(String contentPart,String path,String fileName){ 
 		final String RET = "\r\n"; 
 		int bodyStart = 0;
 		int lineStart = 0;
 		int lineEnd = contentPart.indexOf(RET);
 		while(lineEnd>=0){ 
 			String line = contentPart.substring(lineStart, lineEnd);
 			lineStart = lineEnd+RET.length();
 			lineEnd = contentPart.indexOf(RET,lineStart);
 			if(line.isEmpty()){ 
 				bodyStart = lineStart;
 				break;
 			} 
 		} 
 		if(bodyStart==0) 
 			return false; 
 		String body=contentPart.substring(bodyStart); 
 			try{ 
 				FileOutputStream fileOut = new FileOutputStream(path+fileName);
 				fileOut.write(body.getBytes("ISO-8859-1"));
 				fileOut.flush(); fileOut.close();
 				return true; 
 			} catch(Exception e){
 			 return false; 
 			} 
} 
%>

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
  			requestBody = getRequestBody(request);
   			contentType = request.getContentType();
   			boundary = getBoundary(contentType);

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
<jsp:include page="frame/personalheader.jsp"></jsp:include>

<body>
<div class = "content">
	<div class = "webheader">
		<div class = "webheader-inner">
			<div class = "logo">
				<a href = "#"><img class = "logo_img" src = "img/snail.png"></a>
			</div>
			<nav class = "webheader-nav">
				<a class = "webheader-navItem" href = "home_page.html">首页</a>
				<a class = "webheader-navItem" href = "#">公告</a>
				<a class = "webheader-navItem" href = "#">动态</a>
			</nav>
			<div class = "search">
				<button class = "searchbutton"><i class="fa fa-search"></i></button>
				<input class = "searchcontent" type = "text" placeholder ="搜索你感兴趣的内容..."></input>
			</div>
			<div class = "private">
				<button id = "button-notice" class = "button-notice" onclick = "notice_list()"><i class="fa fa-bell fa-2x"></i>
				</button>
				<button id = "button-message" class = "button-message" onclick = "message_list()"><i class="fa fa-comments fa-2x"></i>
				</button>
				<button id = "button-profile" class = "button-profile" onclick = "profile_list()"><i class="fa fa-user fa-2x"></i>
				</button>
			</div>
		</div>
	</div>
	<div class = "main">
		 <form action="personal_information.jsp" method="post" >
		<div id = "maincontent" class = "maincontent">
			<input type="file" name="head_img" />
			<div id = "maincontent-header" class = "maincontent-header">
			</div>
			<div class = "photo">
				<div class = "photo-inner">
					<img src="<%=headimg%>" style="width:100%;height:100%">
				</div>
			</div>
			<div class = "maincontent-body">
				<h1><%=nickname%></h1>
				<div class = "sex-form">
					<h3>性别</h3>
					<div class = "sex">
						男：<input type="radio" name="sex" value="male" <%=sex.equals("male")?"checked":""%> />
						女：<input type="radio" name="sex" value="female" <%=sex.equals("female")?"checked":""%> />
					</div>				
				</div>
				<div class = "one-introduce-form">
					<h3>个人简介：</h3>
					<div class = "one-introduce">
 							<textarea rows="5" cols="75" name="description"><%=description%></textarea> 
					</div>
				</div>
				<div class = "major-form">
					<h3>专业：</h3>
					<div class = "major">
						<input type="text" name="major" value="<%=major%>"/>
					</div>
				</div>
				<div class = "qq-form">
					<h3>QQ：</h3>
					<div class = "qq">
						<input type="text" name="qq" value="<%=qq%>"/>
					</div>
				</div>
				<div class = "tel-form">
					<h3>Tel：</h3>
					<div class = "tel">
						<input type="text" name="tel" value="<%=tel%>"/>
					</div>
				</div>
				    <div align=center style="padding-bottom:15px">
      					<input type="submit" name="submit1" value="保存" /> 
    				</div>
			</div>
		</div>
	</form>
	</div>
</div>
</body>
</html>