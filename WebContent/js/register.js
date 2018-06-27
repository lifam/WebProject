
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
function c_lose_focus() {
	var t3 = document.getElementById("nickname");
	if(t3.value == "") {
		t3.setAttribute("class", "change");
		t3.setAttribute("placeholder", "请输入昵称");
	}
}
function c_get_focus() {
	var t3 = document.getElementById("nickname");
	var tips = document.getElementById("tips");
	tips.style.visibility = "hidden";
	if(t3.value == "") {
		t3.setAttribute("class", "origin");
		t3.setAttribute("placeholder", "昵称");
	}
}
function submit() {
	var t1 = document.getElementById("name"), t2 = document.getElementById("password"), t3 = document.getElementById("nickname");
	
	if(t1.value == "" || t2.value == "" || t3.value == "") {
		if(t1.value == "") {
			t1.setAttribute("class", "change");
			t1.setAttribute("placeholder", "请输入账号或邮箱");
		}
		if(t2.value == "") {
			t2.setAttribute("class", "change");
			t2.setAttribute("placeholder", "请输入密码");
		}
		if(t3.value == "") {
			t3.setAttribute("class", "change");
			t3.setAttribute("placeholder", "请输入昵称");
		}
	}
	else {
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
		var search = "name=" + t1.value + "&password=" + t2.value + "&nickname=" + t3.value;
		xmlhttp.open("post", "registerserver.jsp", true);
		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttp.send(search);
	}
}
