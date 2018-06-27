<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.net.*,javax.servlet.http.Cookie"%>

<% request.setCharacterEncoding("utf-8");
   
   //设置数据库信息
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
   String url = "";
   StringBuilder table = new StringBuilder(""); 

   //table 串
   String fmt1 = "<div class = \"comment\"><a class = \"avatar\"><img src = \"#\"></a><div class = \"content\"><a class = \"author\">";
   String fmt2 = "</a><div clas=\"metadata\"><i class = \"calendar icon\"></i><span class = \"date\"> ";
   String fmt3 = "</span></div><div class = \"text\" style = \"width:80rem\">";
   String fmt4 = "</div></div></div>";

   //连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection(connectString, user, pwd);
   Statement stmt = con.createStatement();

   //从cookie中获取当前用户名
   String name = "";
   Cookie[] cookies = request.getCookies();
   for(Cookie cookie:cookies){
   		if(cookie.getName().equals("name"))
   		{
   			name = cookie.getValue();
   		}
	}

   //获得主键
   String nickname = "";
   String uid = request.getParameter("uid");
   //获取nickname
   String getNickname = "select * from login where name = '" + name + "'" ;
   ResultSet rs = stmt.executeQuery(getNickname);
   if(rs.next())
   {
      nickname = rs.getString("nickname");
   }

   String content = "";
   String title = "";
   String datetime = "";
   url = "page.jsp?uid=" + uid;

   //回复内容插入数据库
   if(request.getMethod().equalsIgnoreCase("post")){
        String fmt = "insert into comment(pageid,nickname,content) values('%s','%s','%s')";
        String Sql = String.format(fmt,uid,nickname,request.getParameter("article"));
        int cnt = stmt.executeUpdate(Sql);

        if(cnt>0)
          out.print("insert successfully!");  
    }

   try{
      String fmt = "select * from bbs where uid = '%s' ";
      String sql = String.format(fmt,uid);
      rs = stmt.executeQuery(sql);
      if(rs.next()){
         content = rs.getString("content");
         title = rs.getString("title");
         nickname = rs.getString("nickname");
         datetime = rs.getString("date");
      }

      //获取comment信息
      fmt = "select * from comment where pageid = %s ";
      sql = String.format(fmt,uid);
      rs = stmt.executeQuery(sql);
      while(rs.next()){
          table.append(fmt1);
          table.append(rs.getString("nickname"));
          table.append(fmt2);
          table.append(rs.getString("date"));
          table.append(fmt3);
          table.append(rs.getString("content"));
          table.append(fmt4);
      }

      rs.close();
      stmt.close();
      con.close();
   }catch(Exception e){
   msg = e.getMessage();
   }



%>

<jsp:include page="frame/head.jsp"></jsp:include>

	<div class = "ui main container">
		<!-- 帖子主题 -->
      <div class="ui breadcrumb">
        <a class="section" href = "index.jsp"> 返回 </a>
      </div>
		    <div class="ui segment" id="example1">
         <div class = "ui comments">
            <div class = "comment">
            <a class = "avatar" >
              <img src = " /LemonApp/media/{{ article.create_user.face }}">
            </a>
            <div class = "content" >
              <a class = "author" ><%=nickname%></a>
              <div clas="metadata">
              <i class = "calendar icon"></i><span class = "date"><%=datetime%> </span>
              </div>
      			</div>
            <h3 class="ui header"><%=title%></h3>
      			<p><%=content%></p>
    		</div>
      </div>
   		</div>
   		<!--  End 帖子主题-->
		<div class="ui comments">
          <h3 class="ui dividing header" style="width:80rem">讨论</h3>
            <div id="comment-list">
                <%=table%>
            </div>
 		 </div>
      <%if(name!=""){%>
  		<form action="<%=url%>" method ="post" id = "comment-form" class="ui reply form">
      <%}else{%>
      <form action="login.jsp" method="post" class ="ui reply form">
      <%}%>
          <input type="hidden" name="article">
    		    <div class="field" style="width:80rem">                
      			   <textarea placeholder ="Write a comment..." name="comment"></textarea>
    		    </div>
    		<button id="comment-commit"  class="ui blue labeled submit icon button"><i class="icon edit"></i>回复</button>
  		</form>
</div>

	</div>
</body>
</html>