<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/nomikai/css/warning.css">
<title>警告画面</title>
</head>

<body>
	<div class="audio_wrap">
		<audio controls>
			<source src="/nomikai/audio/sound.mp3">
		</audio>
	</div>

<div class="wrapper">

	<div class="banner1">
		<p class="textTop1">&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING</p>
	</div>

	<div class="banner2">
		<p class="textTop2">&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING</p>
	</div>

	<div class="mainContent">
		<p class="warning">&#9888;&#65039;警告！</p>
		<p class="angryText">あんた！！</p>
		<p class="angryText">使いすぎもええ加減に</p>
		<p class="angryText">しいや！！</p>
		<div class="obachan animation"><img src="/nomikai/img/object/obachan.png" width=650px></div>

		<form>
			<a id="js" href="#"><input type="button" value="▶許して！" id="btn" onClick="sorry()"></a>
		</form>

	</div>

	<div class="banner3">
		<p class="textBottom1">&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING</p>
	</div>

	<div class="banner4">
		<p class="textBottom2">&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING&#9888;&#65039;WARNING</p>
	</div>
</div>
</body>

<script type="text/javascript">

	function sorry() {
		let rand = Math.floor(Math.random()*10);
		let msg

		if (rand <= 6) {
		msg = "許しまへん！";
		alert(msg);
		location.href = "/nomikai/LoginServlet"; //ログイン画面へ
		}

		else {
		msg = "許します！";
		alert(msg);
		location.href = "/nomikai/MenuServlet"; //メニュー画面へ
		}

		}

</script>
</html>