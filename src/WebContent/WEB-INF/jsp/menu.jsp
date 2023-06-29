<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>メニュー</title>
<link rel="stylesheet" href="/nomikai/css/menu.css">

</head>

<body>

<div class="wrapper">

	<header>
		<h1 class="head">
			<img src = "/nomikai/img/object/logo.png" width="8%" id="logoImg">
			<a href= "/nomikai/LoginServlet" class="logout">ログアウト</a>
			<a href="/nomikai/PaymentServlet" class="pay">お会計</a>
		</h1>
	</header>

<div class="pc">
<table class="menuWrapper">
	<tr>
		<td><a href="/nomikai/DrinkRegistServlet">
			<div id="button1">
				<span class="menuText">飲み会登録</span>
			</div>
			</a>
		</td>
		<td><a href="/nomikai/DrinkServlet">
			<div id="button2">
				<span class="menuText">データ閲覧</span>
			</div>
			</a>
		</td>
	</tr>

	<tr>
		<td ><a href="/nomikai/FriendsRecordServlet">
			<div id="button3">
				<span class="menuText">呑み友一覧</span>
			</div>
			</a>
		</td>
		<td><a href="/nomikai/EditServlet">
			<div id="button4">
				<span class="menuText">　設　定　</span>
			</div>
			</a>
		</td>
	</tr>
</table>
</div>

<div class="smartphone">
<table class="menuWrapper">
	<tr>
		<td><a href="/nomikai/DrinkRegistServlet">
			<div id="button1">
				<span class="menuText">飲み会登録</span>
			</div>
			</a>
		</td>
	</tr>
	<tr>
		<td><a href="/nomikai/DrinkServlet">
			<div id="button2">
				<span class="menuText">データ閲覧</span>
			</div>
			</a>
		</td>
	</tr>

	<tr>
		<td ><a href="/nomikai/FriendsRecordServlet">
			<div id="button3">
				<span class="menuText">呑み友一覧</span>
			</div>
			</a>
		</td>
	</tr>
	<tr>
		<td><a href="/nomikai/EditServlet">
			<div id="button4">
				<span class="menuText">　設　定　</span>
			</div>
			</a>
		</td>
	</tr>
</table>
</div>

<div id="menu">
	<input type="checkbox" id="menu-btn-check">
	<label for="menu-btn-check" id="menu-btn"><span style="font-size: 35px;">&#128198;</span></label>
	<div id="menu-content">
			<div class="calWrapper">
			<p id=calTitle>&#127867;飲み会カレンダー</p>
			<p id="calendar"></p>
			</div>
	</div>

</div>

</div>

<input id="alert" type="hidden" value="${alert}">

</body>
<script type="text/javascript" src="/nomikai/js/menu.js"></script>
<script type="text/javascript" src="/nomikai/js/demo.js"></script>
<script>
let mitani = document.getElementById('alert').value;
window.addEventListener('load', (event)=> {
	if((mitani != null) && (mitani != "")){
		alert(mitani);
	}
})

</script>
</html>
