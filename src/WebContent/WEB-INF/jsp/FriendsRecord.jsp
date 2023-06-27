<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>友達メニュー</title>
    <link rel="stylesheet" type="text/css" href="css/frendsRecord.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
 </head>
<!-- <body background="../img/backImage/frienddata3.png" background-size:100%auto> -->
 <body>
 <div class="img img-opacity"></div>
 <div class="for-pc">
 <div class="text-box">
   <ul class="size">
       <h1>呑み友一覧</h1>
   </ul>
<div id="friends">
 <c:forEach var="e" items="${cardList}">
<div class="a">
	<ul>
	<li class="big b">${e.number}
	${e.name}
	${e.visitTimes}回
	<img src="${e.avator}"  height="60px" width="60px" class="img-style">
	</ul>
	</div>
</c:forEach>
</div>
</div>
 <a href="/nomikai/MenuServlet">
   <img src="img/object/bell3.png"alt="bell" height="200px" width="170px" style="display: block; position: absolute; bottom: 5%; left: 3%;">
 </a>
  <c:if test="${ next >= 10 }">
 <a href="/nomikai/FriendsRecordServlet?start=${start+10}" onclick="history.forward()">
   <img src="img/object/sannkaku.png"alt="tugi" height="200px" width="300px" style="display: block; position: absolute; bottom: 3%; left:10%;">
 </a>
  </c:if>
 <c:if test="${start > 10 }">
  <a href="/nomikai/FriendsRecordServlet?start=${start-10}" onclick="history.forward()">
   <img src="img/object/sannkaku2.png"alt="tugi" height="150px" width="130px" style="display: block; position: absolute; bottom: 6%; left:25%;">
 </a>
 </c:if>
  <footer style="margin-bottom:510px;">
    <ul class="menu">
        <li class="menuBar">
            <a href="/nomikai/DrinkRegistServlet" class="menuText">&#127867;飲み会登録</a>
            <a href="/nomikai/DrinkServlet" class="menuText">&#129534;データ閲覧</a><br>
            <hr>
            <a href="/nomikai/FriendsRecordServlet" class="menuText">&#129309;呑み友一覧</a>
            <a href="/nomikai/EditServlet" class="menuText">&#9881;&#65039;設定</a>
        </li>
    </ul>
</footer>

 </div>
 <div class="for-sp">
 <div class="text-box">
   <ul class="size2">
       <h1 style="margin:0px;">呑み友一覧</h1>
   </ul>
<div class="nameWrapper">
<div id="friends">
 <c:forEach var="e" items="${cardList}">
<div class="a">
	<ul style="margin:10px; padding:0; ">
	<li class="big b">${e.number}
	${e.name}
	${e.visitTimes}回
	<img src="${e.avator}"  height="50px" width="50px" class="img-style">
	</ul>
</div>
</c:forEach>
</div>
</div>
 <a href="/nomikai/MenuServlet">
   <img src="img/object/bell3.png"alt="bell" height="100px" width="85px" style="display: block; position: fixed; top: 30%; left: 78%;">
 </a>
  <c:if test="${ next >= 10 }">
 <a href="/nomikai/FriendsRecordServlet?start=${start+10}" onclick="history.forward()">
   <img src="img/object/sannkaku.png"alt="tugi" height="100px" width="150px" style="display: block; position: fixed; top: 75%; left:-8%;">
 </a>
  </c:if>
 <c:if test="${start > 10 }">
  <a href="/nomikai/FriendsRecordServlet?start=${start-10}" onclick="history.forward()">
   <img src="img/object/sannkaku2.png"alt="tugi" height="85px" width="65px" style="display: block; position: fixed; top: 77%; left:80%;">
 </a>
 </c:if>
 </div>
 <footer>
    <ul class="menu">
        <li class="menuBar">
            <a href="/nomikai/DrinkRegistServlet" class="menuText">&#127867;飲み会登録</a>
            <a href="/nomikai/DrinkServlet" class="menuText">&#129534;データ閲覧</a><br>
            <hr>
            <a href="/nomikai/FriendsRecordServlet" class="menuText">&#129309;呑み友一覧</a>
            <a href="/nomikai/EditServlet" class="menuText">&#9881;&#65039;設定</a>
        </li>
    </ul>
 </div>
</footer>
 </body>
</html>