<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>失敗</title>
	</head>

    <body>
	<div class="for-pc">
	<div class="img">
		<h1>ログイン残念だったね</h1>
		<p><c:out value="${result}"/></p>
		<a href="/nomikai/LoginServlet" >ログインへもどる</a>
	</div>
	</div>

	<div class="for-sp">
	<div class="img2">
		<h1></h1>
		<p><c:out value="${result}" /></p>


	</div>
	</div>
	</body>
</html>
