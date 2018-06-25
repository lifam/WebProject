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
	 	width:180px;
	}
	.webheader-nav a {
	    padding:2px 15px;
	    font-size:15px;
	    line-height:30px;
	    color:#8590a6;
	    text-decoration:none;
	}
	.search {
		display:block;
		position:relative;
		font-size:15px;
		color:#1a1a1a;
		visibility:hidden;
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
		min-width:1032px;
		border:1px solid black;
		justify-content:center;
	}
	.photo {
		z-index:100;
		position:absolute;
		width:150px;
		height:150px;
		background:orange;
		margin-left:20px;
		margin-top:-80px;
		border:4px solid #fff;
		background:grey;
	}
	.photo-inner {
		z-index:110;
		position:absolute;
		width:50%;
		height:50%;
		text-align:center;
		margin-left:36.5px;
		margin-top:36.5px;
		cursor:pointer;
		color:white;
	}
	.photo-inner i {
		margin-top:10px;
	}
	.maincontent {
		border:1px solid red;
		width:1000px;
		padding-top:10px;
		padding-bottom:10px;
	}
	.maincontent-header {
		border:1px solid rgba(26,26,26,0.1);
		width:998px;
		height:200px;
		border-top-right-radius:10px;
		border-top-left-radius:10px;
	}
	.maincontent-header-button {
		position:relative;
		width:130px;
		height:30px;
		left:830px;
		top:30px;
		border-radius:4px;
		background:transparent;
		border:1px solid rgba(26,26,26,0.1);
		color:rgba(26,26,26,0.1);
		cursor:pointer;
	}
	.maincontent-body {
	    z-index:10;
		border:1px solid rgba(26,26,26,0.1);
		width:998px;
		height:auto;
		background:white;
		border-bottom-left-radius:10px;
		border-bottom-right-radius:10px;
	}
	.maincontent-body h1 {
		margin-left:195px;
		margin-top:20px;
		font-size:26px;
		line-height:30px;
		font-weight:600;
	}
	.maincontent-body h1 + button {
		float:left;
		margin-left:290px;
		margin-top:-20px;
		border:none;
		background:transparent;
		font-size:14px;
		color:blue;
		cursor:pointer;
	}
	.sex-form, .one-introduce-form, .major-form, .qq-form, .tel-form {
		width:770px;
		padding:30px 32px;
		border-bottom:1px solid #ebebeb;
		margin-left:165px;
	}
	.tel-form {
		margin-bottom:100px;
	}
	.sex-form h3, .one-introduce-form h3, .major-form h3, .qq-form h3, .tel-form h3 {
		float:left;
	}
	.sex, .one-introduce, .major, .qq, .tel {
		border:1px solid red;
		margin-left:200px;
	}
	.sex button, .one-introduce button, .major button, .qq button, .tel button {
		margin-left:20px;
		border:none;
		background:transparent;
		font-size:14px;
		color:blue;
		cursor:pointer;
	}
</style>
<script>
	function notice_list() {
		var notice_list = document.getElementById("notice_list"), message_list = document.getElementById("message_list"), profile_list = document.getElementById("profile_list");
		var maincontent = document.getElementById("maincontent"), maincontent_header = document.getElementById("maincontent-header");
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
			maincontent.insertBefore(div, maincontent_header);
		}
	}
	function message_list() {
		var notice_list = document.getElementById("notice_list"), message_list = document.getElementById("message_list"), profile_list = document.getElementById("profile_list");
		var maincontent = document.getElementById("maincontent"), maincontent_header = document.getElementById("maincontent-header");
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
			maincontent.insertBefore(div, maincontent_header);
		}
	}
	function profile_list() {
		var notice_list = document.getElementById("notice_list"), message_list = document.getElementById("message_list"), profile_list = document.getElementById("profile_list");
		var maincontent = document.getElementById("maincontent"), maincontent_header = document.getElementById("maincontent-header");
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
		
			maincontent.insertBefore(div, maincontent_header);
		}
	}
</script>
</head>