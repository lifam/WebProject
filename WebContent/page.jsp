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
   String nickname = request.getParameter("nickname");
   String content = "";
   String title = "";

   //连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection(connectString, user, pwd);
   Statement stmt = con.createStatement();

   try{
      String fmt = "select * from bbs where nickname = '%s' ";
      String sql = String.format(fmt,nickname);
      ResultSet rs = stmt.executeQuery(sql);
      if(rs.next()){
         content = rs.getString("content");
         title = rs.getString("title");
      }
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
              <i class = "calendar icon"></i><span class = "date"> {{article.create_date|naturaltime}}</span>
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
              {% for comment in article.get_comments %}
                {% include 'partial_article_comment.html' with comment=comment %}
              {% endfor %}
            </div>
 		 </div>
      {% if request.user.id %}
  		<form action="{% url 'comment' %}" method ="post" id = "comment-form" class="ui reply form">
      {% else %}
      <form action="login" method="post" class ="ui reply form">
      {% endif %}
         {% csrf_token %}
          <input type="hidden" name="article" value="{{ article.pk }}">
    		    <div class="field" style="width:80rem">                
      			   <textarea placeholder ="{% trans 'Write a comment...' %}" name="comment"></textarea>
    		    </div>
    		<button id="comment-commit"  class="ui blue labeled submit icon button"><i class="icon edit"></i>回复</button>
  		</form>
</div>

	</div>
</body>
</html>