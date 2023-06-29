<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ログイン</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">

  </head>


<body>

    <div class="for-pc">
      <div class="img">


      <!-- <img src="../img/backImage/login.jpg" alt="" height="100%" width="100%" style="z-index: -1;"> -->

      <div class="main">

        <div class="a">
          <h1 style="line-height: 60px;">いらっしゃいませ<br>お名前をお伺いいたします。</h1>
          <form method="post" action="/nomikai/LoginServlet">

          <input type="text" name="id" placeholder="IDを入力してください" size="50" class="id" ><br>
          <h1>合言葉はお持ちですか？</h1>
          <input type="password" name="pw" placeholder="パスワードを入力してください" size="50" class="pw">
          <br>
          <br>
          <br>
          <br>
          <br>
          <a href="/nomikai/SignUpServlet" class="newText">～新規登録はこちら～</a>
        </div>

        <div class="b">
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
      <!--   <a href="#" class="btn" style="margin-right: 20px;">入店する</a> -->
      <button class="btn" style="margin-right: 20px; border: none;">入店する</button>
          </form>
          <a href="/nomikai/PaymentPreLoginServlet" class="btn">お会計</a>
        </div>
      </div>

    </div>

         <br>
         <br>
        <br>

  </div>


   <div class="sub">
    <div class="for-sp">
      <div class="img2">

        <div style="margin-left: 50px;">
          <div class="text">いらっしゃいませ<br>お名前をお伺いいたします。</div>
          <form method="post" action="/nomikai/LoginServlet">
          <input type="text" name="id" placeholder="IDを入力してください" size="30" class="id2"><br><br>
          <div class="text">合言葉はお持ちですか</div>
          <input type="password" name="pw" placeholder="パスワードを入力してください" size="30" class="pw2">
          <br>
          <br>
          <br>
          <div>
          <button class="btn2" style=" border: none;">入店する</button>
          </div>
          </form>
          <div class="okaikei">
          <a href="/nomikai/PaymentPreLoginServlet" class="btn2" class="v">お会計</a>
          </div>
          <br>
          <br>
          <br>
          <a href="/nomikai/SignUpServlet" class="newTextSp">～新規登録はこちら～</a>
        </div>
    </div>
    </div>


 </div>
</body>
<style>

.newText {
		font-size: 25px;
		border: 2px solid black;
		background: rgba(256, 256, 256, 0.8);
		text-decoration: none;
		color: black;
		padding: 10px 10px 10px 10px;
}

.newText:hover {
	text-decoration: none;
	color: white;
	background: rgba(255, 165, 0, 0.9);
}

.newTextSp {
		font-size: 15px;
		border: 2px solid black;
		background: rgba(256, 256, 256, 0.8);
		text-decoration: none;
		color: black;
		padding: 10px 10px 10px 10px;
}

</style>
</html>

