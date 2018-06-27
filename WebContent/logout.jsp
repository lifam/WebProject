<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.util.*, java.sql.*,java.net.*,javax.servlet.http.Cookie"%>
<% request.setCharacterEncoding("utf-8");
   String msg = "";
   String connectString = "jdbc:mysql://172.18.187.234:53306/15336142?characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
   String user = "user";
   String pwd = "123";
   String name = "";
   Cookie[] cookies = request.getCookies();
   for(Cookie cookie:cookies){
      if(cookie.getName().equals("name"))
      {
        cookie.setMaxAge(0);
        response.addCookie(cookie);
      }
   }
   // String name = "123";
   String nickname = "";
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection(connectString, user, pwd);
   Statement stmt = con.createStatement();   
   try {       
          String fmt = "select * from login where name = '%s'";
          String sql = String.format(fmt,name);
          ResultSet rs = stmt.executeQuery(sql);
          if(rs.next()){
              nickname = rs.getString("nickname");
          }
          stmt.close();
          con.close();
        }catch(Exception e){
          msg = e.getMessage();
      }

%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Technique BBS!</title>
    <link rel="icon" href="/LemonApp/media/logo.jpg"  type="image/jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="css/semantic.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/semantic.js"></script>
    <script>
    $(document).ready(function() {
        // 鼠标放到 dropdown 时显示下拉菜单，默认只有点击后才显示
        $('.dropdown.item').dropdown({
            on: 'hover'
        });
        $('.menu .item').tab();
        $('.ui.accordion').accordion();
        $('.ui.sticky').sticky({context: '#example1'});

    });
</script>
    <style>
    p.spec{
    	color:black;
    }
    </style>
</head>
<body>
    <div class="ui inverted large head main menu ">
        <div class="ui  container">
            <div class="header item"><i class= "lemon icon"></i>Technique BBS</div>
            <a href="index.jsp" class="item">主页</a>
            <a class="item" href="indentity.jsp">个人中心</a>
            <div class="right menu">
                <div class="item">
                    <div class="ui transparent inverted icon input">
                        <i class="search icon"></i>
                        <input type="text" placeholder="Search">
                    </div>
                </div>
                <% if(name!=""){%>
                   <div class="ui dropdown item" tabindex="0">
                        Hi，<%=nickname%><i class="dropdown icon"></i>
                        <div class="menu" tabindex="-1">
                            <div class="item"><a href="logout.jsp"><p class="spec">退出登录</p></a></div>
                        </div>
                    </div>
                <% }else{%>
                    <a class="item" href="login.jsp">登录</a>
                    <a class="item" href="register.jsp">注册</a>
                <%}%>
            </div>
        </div>
</div>

<div class ="ui main container">
  <div class = "ui grid">
    <% if(name!=""){ %>
      <a  href="write.jsp" class="ui primary button" style="margin-top:10px;margin-left:75rem;width:100px;font:white" ><i class="write icon"></i>发帖</a>
    <%} else{ %>
          <a  href="login.jsp" class="ui primary button" style="margin-top:10px;margin-left:75rem;width:100px;font:white" ><i class="write icon"></i>发帖</a>
    <% } %>
  </div>
  <div class = "ui divider" style="margin-top:30px"></div>
<!-- part I -->
    <div class = "ui styled fluid accordion">
      <div class="title"><i class="dropdown icon"></i>{{article.title}}</div>
        <div class="content">
          <p class = "transition hidden">
            {{ article.get_content_as_markdown|safe }}
          </p>
      <p class = "transition hidden"><a href = "{% url 'article' article.slug %}">进入</a></p>
    </div>
    <div class = "ui styled fluid accordion">
      <div class="title"><i class="dropdown icon"></i>{{article.title}}</div>
        <div class="content">
          <p class = "transition hidden">
            {{ article.get_content_as_markdown|safe }}
          </p>
      <p class = "transition hidden"><a href = "{% url 'article' article.slug %}">进入</a></p>
    </div>
</div>
<!-- End Part I -->
</div>

</body>

</body>
</html>