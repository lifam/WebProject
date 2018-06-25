
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
<style type = "text/css">
	* {
		margin:0px;
		padding:0px;
	}
	html,body {
		height:100%;
		width:100%;
	}
	body {
		background:rgb(246, 246, 246);
		overflow-x:hidden;
	}
	.webheader {
		position:fixed;
		z-index:100;
		width:100%;
		min-width:1032px;
		border:none;
		border-bottom:1px solid rgba(26,26,26,0.1);
		height:52px;
		background:white;
	}
	.webheader-inner {
		position:relative;
		display:flex;
	    width:1000px;
	    height:52px;
	    padding:0 16px;
	    margin:0 auto;
	    align-items:center;
	}
	.logo {
		margin-left:10px;
		height:50px;
		width:50px;
		vertical-align:text-bottom;
	}
	.logo_img {
		height:50px;
		width:50px;
	}
	.webheader-nav {
		display:flex;
	 	justify-content:space-between;
	 	height:30px;
	 	margin-right:18px;
	 	margin-left:10px;
	 	color:#999;
	 	width:200px;
	}
	.webheader-nav button {
	    padding-top:2px;
	    padding-left:10px;
	    padding-right:10px;
	    font-size:15px;
	    line-height:30px;
	    color:#8590a6;
	    text-decoration:none;
	    background:transparent;
		border:none;
		cursor:pointer;
	}
	.search {
		display:block;
		position:relative;
		font-size:15px;
		color:#1a1a1a;
	}
	.searchbutton {
		cursor:pointer;
		border:transparent;
		position:relative;
		float:left;
		width:40px;
		height:34px;
		background:#f6f6f6;
		border-top-left-radius:3px;
		border-bottom-left-radius:3px;
	}
	.fa-search {
		color:#8590a6;
	}
	.searchcontent {
		float:left;
		color:#1a1a1a;
		height:34px;
		line-height:24px;
		padding:4px 10px;
		overflow:hidden;
		outline:none;
		background:#f6f6f6;
		width:326px;
		padding-left:0px;
		position:relative;
		display:flex;
		font-size:14px;
		border:none;
		box-sizing:border-box;
		border-top-right-radius:3px;
		border-bottom-right-radius:3px;
	}
	.private {
		position:relative;
		flex:1;
		display:flex;
		align-items:center;
		height:34px;
	}
	.button-notice {
		margin-left:188px;
	}
	.button-profile {
		margin-left:34px;
	}
	.button-message {
		margin-left:34px;
	}
	.button-notice, .button-message, .button-profile {
		height:34px;
		width:34px;
		display:inline-block;
		font-size:14px;
		color:#8590a6;
		text-align:center;
		cursor:pointer;
		padding:0;
		background-color:transparent;
		border:none;
	}
	.main {
		position:absolute;
	    display:flex;
		margin-top:53px;
		width:100%;
		height:auto;
		min-width:1032px;
		border:1px solid black;
		justify-content:center;
	}
	.maincontent-header {
		width:1000px;
		height:auto;
		padding-top:10px;
		padding-bottom:10px;
		border:1px solid red;
	}
	.topchoose {
		border:1px solid rgba(26,26,26,0.1);
		width:700px;
		height:56px;
		background-color:white;
		padding-top:30px;
		display:flex;
	 	justify-content:space-between;
	 	float:left;
	 	border-radius:4px;
	}
	.topchoose a {
	    font-size:20px;
	    color:#8590a6;
	    text-decoration:none;
	    width:175px;
	    height:30px;
	    text-align:center;
	}
	.sidebar {
		position:fixed;
		border:1px solid rgba(26,26,26,0.1);
		width:289px;
		height:168px;
		background:white;
		margin-left:710px;
		float:left;
		border-radius:4px;
	}
	.siderbar-list {
		margin:10px auto;
		padding:0;
		list-style-type:none;
		width:289px;
		background-color:white;
	}
	.siderbar-list li a {
		display:block;
		color:#8590a6;
		padding:8px 16px;
		text-decoration:none;
	}
	.siderbar-list li a:hover {
		background-color:rgb(246, 246, 246);
		color:#8590a6;
	}
	.siderbar-footer {
		position:fixed;
		width:289px;
		height:50px;
		margin-top:178px;
		margin-left:710px;
		text-align:center;
	}
	.siderbar-footer a {
		text-decoration:none;
		color:#8590a6;
	}
	.invitation {
		border:1px solid rgba(26,26,26,0.1);
		width:700px;
		height:auto;
		background:white;
		position:absolute;
		top:110px;
		border-radius:4px;
		float:left;
	}
	.invitation-header {
		width:700px;
		border:1px solid green;
		height:35px;
		border:none;
		border-top-right-radius:4px;
		border-top-left-radius:4px;
		background:rgb(51,122,183);
	}
	.invitation-header p {
		position:relative;
		color:white;
		font-family:Microsoft Yahei;
		font-size:80%;
		top:10px;
		left:10px;
	}
	.invitation-header a {
		position:relative;
		color:white;
		font-family:Microsoft Yahei;
		font-size:80%;
		left:645px;
		bottom:8px;
		text-decoration:none;
	}
</style>
<script>
	function notice_list() {
		var notice_list = document.getElementById("notice_list"), message_list = document.getElementById("message_list"), profile_list = document.getElementById("profile_list");
		var maincontent = document.getElementById("maincontent-header");
		if(notice_list) {
			maincontent.removeChild(notice_list);
		}
		else {
			if(message_list)
				maincontent.removeChild(message_list);
			if(profile_list)
				maincontent.removeChild(profile_list);
			var div = document.createElement("div");
			div.style.width = "360px";
			div.style.height = "50px";
			div.style.border = "1px solid rgb(246, 246, 246)";
			div.style.background = "white";
			div.style.borderRadius = "4px";
			div.style.zIndex = "300";
			div.style.position = "fixed";
			div.style.marginLeft = "670px";
			div.style.marginTop = "-7px";
			div.id = "notice_list";
			maincontent.appendChild(div);
		}
	}
	function message_list() {
		var notice_list = document.getElementById("notice_list"), message_list = document.getElementById("message_list"), profile_list = document.getElementById("profile_list");
		var maincontent = document.getElementById("maincontent-header");
		if(message_list) {
			maincontent.removeChild(message_list);
		}
		else {
			if(notice_list)
				maincontent.removeChild(notice_list);
			if(profile_list)
				maincontent.removeChild(profile_list);
			var div = document.createElement("div");
			div.style.width = "360px";
			div.style.height = "50px";
			div.style.border = "1px solid rgb(246, 246, 246)";
			div.style.background = "white";
			div.style.borderRadius = "4px";
			div.style.zIndex = "300";
			div.style.position = "fixed";
			div.style.marginLeft = "730px";
			div.style.marginTop = "-7px";
			div.id = "message_list";
			maincontent.appendChild(div);
		}
	}
	function profile_list() {
		var notice_list = document.getElementById("notice_list"), message_list = document.getElementById("message_list"), profile_list = document.getElementById("profile_list");
		var maincontent = document.getElementById("maincontent-header");
		if(profile_list) {
			maincontent.removeChild(profile_list);
		}
		else {
			if(notice_list)
				maincontent.removeChild(notice_list);
			if(message_list)
				maincontent.removeChild(message_list);
		
			var div = document.createElement("div"), div1 = document.createElement("div"), div2 = document.createElement("div");
			var a1 = document.createElement("a"), a2 = document.createElement("a");
			div.style.width = "120px";
			div.style.height = "85px";
			div.style.border = "1px solid rgb(246, 246, 246)";
			div.style.background = "white";
			div.style.borderRadius = "4px";
			div.style.zIndex = "300";
			div.style.position = "fixed";
			div.style.marginLeft = "915px";
			div.style.marginTop = "-7px";
			div.id = "profile_list";
			
			div1.style.width = "120px";
			div1.style.height = "35px";
			div1.style.border = "none";
			div1.style.background = "white";
			div1.style.marginTop = "5px";
			div1.style.zIndex = "310";
			div1.style.position = "fixed";
			div1.id = "profile_list1";
			div1.addEventListener("mouseover", function() {
				div1.style.background = "rgb(246, 246, 246)";
			});
			div1.addEventListener("mouseout", function() {
				div1.style.background = "white";
			});
			
			div2.style.width = "120px";
			div2.style.height = "35px";
			div2.style.border = "none";
			div2.style.background = "white";
			div2.style.marginTop = "42px";
			div2.style.zIndex = "310";
			div2.style.position = "fixed";
			div2.id = "profile_list2";
			div2.addEventListener("mouseover", function() {
				div2.style.background = "rgb(246, 246, 246)";
			});
			div2.addEventListener("mouseout", function() {
				div2.style.background = "white";
			});
			
			a1.style.position = "relative";
			a1.style.textDecoration = "none";
			a1.style.paddingLeft = "20px";
			a1.href = "#";
			a1.innerHTML = "<i class=\"fa fa-user\"></i>&nbsp;&nbsp;我的主页";
			a1.style.top = "10px";
			a1.style.color = "#77839c";

			a2.style.position = "relative";
			a2.style.textDecoration = "none";
			a2.style.paddingLeft = "20px";
			a2.href = "#";
			a2.innerHTML = "<i class=\"fa fa-cog\"></i>&nbsp;&nbsp;设置</a>";
			a2.style.top = "10px";
			a2.style.color = "#77839c";
			
			div1.appendChild(a1);
			div.appendChild(div1);
			div2.appendChild(a2);	
			div.appendChild(div2);
		
			maincontent.appendChild(div);
		}
	}
	function plate_list() {
		var notice_list = document.getElementById("notice_list"), 
			message_list = document.getElementById("message_list"), 
			profile_list = document.getElementById("profile_list")
			plate_list = document.getElementById("plate_list");
		var maincontent = document.getElementById("maincontent-header");
		if(plate_list) {
			maincontent.removeChild(plate_list);
		}
		else {
			if(notice_list)
				maincontent.removeChild(notice_list);
			if(message_list)
				maincontent.removeChild(message_list);
			if(profile_list)
				maincontent.removeChild(message_list);
		
			var div = document.createElement("div"), div1 = document.createElement("div"), div2 = document.createElement("div");
			var a1 = document.createElement("a"), a2 = document.createElement("a");
			div.style.width = "120px";
			div.style.height = "83px";
			div.style.border = "1px solid rgb(246, 246, 246)";
			div.style.background = "white";
			div.style.borderRadius = "4px";
			div.style.zIndex = "300";
			div.style.position = "fixed";
			div.style.marginLeft = "105px";
			div.style.marginTop = "-7px";
			div.id = "plate_list";
			
			div1.style.width = "120px";
			div1.style.height = "35px";
			div1.style.border = "none";
			div1.style.background = "white";
			div1.style.marginTop = "5px";
			div1.style.zIndex = "310";
			div1.style.position = "fixed";
			div1.id = "plate_list1";
			div1.style.borderTop = "1px solid rgb(246, 246, 246)";
			div1.style.borderBottom = "1px solid rgb(246, 246, 246)";
			div1.addEventListener("mouseover", function() {
				div1.style.background = "rgb(246, 246, 246)";
			});
			div1.addEventListener("mouseout", function() {
				div1.style.background = "white";
			});
			
			div2.style.width = "120px";
			div2.style.height = "35px";
			div2.style.border = "none";
			div2.style.background = "white";
			div2.style.marginTop = "42px";
			div2.style.zIndex = "310";
			div2.style.position = "fixed";
			div2.id = "plate_list2";
			div2.style.borderBottom = "1px solid rgb(246, 246, 246)";
			div2.addEventListener("mouseover", function() {
				div2.style.background = "rgb(246, 246, 246)";
			});
			div2.addEventListener("mouseout", function() {
				div2.style.background = "white";
			});
			
			a1.style.position = "relative";
			a1.style.textDecoration = "none";
			a1.style.paddingLeft = "10px";
			a1.href = "plate.html?type=0";
			a1.innerHTML = "移动开发";
			a1.style.top = "10px";
			a1.style.color = "#77839c";

			a2.style.position = "relative";
			a2.style.textDecoration = "none";
			a2.style.paddingLeft = "10px";
			a2.href = "plate.html?type=1";
			a2.innerHTML = "开发语言/框架";
			a2.style.top = "10px";
			a2.style.color = "#77839c";
			
			div1.appendChild(a1);
			div.appendChild(div1);
			div2.appendChild(a2);	
			div.appendChild(div2);
		
			maincontent.appendChild(div);
		}
	}
	function fresh() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if(xmlhttp.readyState == 4) {
				if(xmlhttp.status >= 200 && xmlhttp.status < 300 || xmlhttp.status == 304) {
					content = JSON.parse(xmlhttp.responseText);
					for(var i = 0; i < content.length; i++) {
						var invitation = document.getElementById("invitation");
						var div = document.createElement("div"), 
						    a1 = document.createElement("a"),
						    a2 = document.createElement("a"),
						    sdiv = document.createElement("div"),
						    p = document.createElement("p");
						
						div.style.position = "relative";
						div.style.width = "700px";
						div.style.height = "60px";
						div.style.border = "none";
						if(i != content.length - 1)
							div.style.borderBottom = "1px solid rgba(26,26,26,0.1)";
						else {
							div.style.borderBottomRightRadius = "4px";
							div.style.borderBottomLeftRadius = "4px";
						}
						
						a1.style.position = "relative";
						a1.style.fontFamily = "Microsoft Yahei";
						a1.style.top = "5px";
						a1.style.left = "10px";
						a1.style.textDecoration = "none";
						a1.style.color = "black";
						a1.href = "#";
						a1.innerHTML = "[" + content[i].type + "]&nbsp;";
						
						a2.style.position = "relative";
						a2.style.fontFamily = "Microsoft Yahei";
						a2.style.top = "5px";
						a2.style.left = "10px";
						a2.style.textDecoration = "none";
						a2.style.color = "gray";
						a2.href = "#";
						a2.innerHTML = content[i].title;
						
						p.style.position = "relative";
						p.style.top = "10px";
						p.style.left = "10px";
						p.innerHTML = "浏览量: " + content[i].browse + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
									  "评论量: " + content[i].comment + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
									  "发表日期: " + content[i].date;

						div.appendChild(a1);
						div.appendChild(a2);
						div.appendChild(p);
						invitation.appendChild(div);
					}
				}
			}
		}
		xmlhttp.open("get", "home_page.jsp", true);
		xmlhttp.send();
	}
</script>
</head>