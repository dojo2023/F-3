<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<h1>${alert}</h1>

<p>更新の結果:${result}</p>

</div>

</body>
<script type="text/javascript" src="/nomikai/js/menu.js"></script>
<script type="text/javascript" src="/nomikai/js/demo.js"></script>
</html>
