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
          
          <input type="text" name="id" placeholder="IDを入力してください" size="50" class="id" ><br>
          <h1>合言葉はお持ちですか？</h1>
          <input type="password" name="pw" placeholder="パスワードを入力してください" size="50" class="pw">
          <br>
          <br>
          <br>
          <br>
          <br>
          <button onclick="location.href='./signUp.jsp'">新規登録はこちら</button>
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
          <a href="./menu.jsp" class="btn" style="margin-right: 20px;">入店する</a>
          <a href="./payment.jsp" class="btn">お会計</a>
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

        <form style="margin-left: 50px;">
          <div class="text">いらっしゃいませ<br>お名前をお伺いいたします。</div>
          <input type="text" name="DI" placeholder="IDを入力してください" size="30" class="id2"><br><br>
          <div class="text">合言葉はお持ちですか</div>
          <input type="password" name="WP" placeholder="パスワードを入力してください" size="30" class="pw2">
          <br>
          <br>
          <br>
          <a  class="btn2">入店する</a>
          <a href="./payment.jsp" class="btn2">お会計</a>
          <br>
          <br>
          <br>
          <button onclick="location.href='./signUp.jsp'">新規登録はこちら</button>
        </form>
    </div>
    </div>


 </div>
</body>

</html>

