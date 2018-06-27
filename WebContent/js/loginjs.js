function pwd_text() {
	var button = document.getElementById("button-switch"), pwd = document.getElementById("password");
	if(button.innerHTML.match("fa-eye-slash")) {
		button.innerHTML = "<i class= \"fa fa-eye\"></i>";
		pwd.type = "password";
	}
	else {
		button.innerHTML = "<i class= \"fa fa-eye-slash\"></i>";
		pwd.type = "text";
	}
}
function n_lose_focus() {
	var t1 = document.getElementById("name");
	if(t1.value == "") {
		t1.setAttribute("class", "change");
		t1.setAttribute("placeholder", "请输入账号或邮箱");
	}
}
function n_get_focus() {
	var t1 = document.getElementById("name");
	var tips = document.getElementById("tips");
	tips.style.visibility = "hidden";
	if(t1.value == "") {
		t1.setAttribute("class", "origin");
		t1.setAttribute("placeholder", "用户名或邮箱");
	}
}
function p_lose_focus() {
	var t2 = document.getElementById("password");
	if(t2.value == "") {
		t2.setAttribute("class", "change");
		t2.setAttribute("placeholder", "请输入密码");
	}
}
function p_get_focus() {
	var t2 = document.getElementById("password");
	var tips = document.getElementById("tips");
	tips.style.visibility = "hidden";
	if(t2.value == "") {
		t2.setAttribute("class", "origin");
		t2.setAttribute("placeholder", "密码");
	}
}
function submit() {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		
		if(xmlhttp.readyState == 4) {
			if(xmlhttp.status >= 200 && xmlhttp.status < 300 || xmlhttp.status >= 304) {
				var result = xmlhttp.responseText;
				if(result.indexOf("right") >= 0) {
					window.location.href = "index.jsp";
				}
				else {
					var tips = document.getElementById("tips");
					tips.style.visibility = "visible";
				}
			}
		}
	}
	var search = "name=" + document.getElementById("name").value + "&password=" + document.getElementById("password").value;
	xmlhttp.open("post", "frame\\loginserver.jsp", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(search);
}
