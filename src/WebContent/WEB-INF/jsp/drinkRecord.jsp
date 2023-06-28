<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>title</title>
    <link rel="stylesheet" href="/nomikai/css/drinkRecord.css">
	    <link rel="stylesheet" type="text/css" href="css/common.css">
</head>

<body>

    <main class="downContainer">
        <div class="downContent">
            <h1 class="fontA fontB fontC">今月の飲み会記録</h1>
            <div class="container">
                <div id="totalBox">
                    <h2 class="fontA h2margin">飲んだお酒：<span id="totalDrink" class="span"></span></h2>
                    <div id="BeerIcon-container"></div> <!-- 飲んだお酒のアイコンを表示するコンテナ -->
                    <h2 class="fontA h2margin">食べた量：<span id="totalFood" class="span"></span></h2>
                    <div id="YakitoriIcon-container"></div> <!-- 食べた量のアイコンを表示するコンテナ -->
                    <h2 class="fontA h2margin">使ったお金：<span id="totalPrice"></span></h2>
                </div>
            </div>
        </div>
        <div class="height">
            <button type="button" id="myButton" class="buttonB buttonC"
                onclick="toggleContent(); changeText()">月間記録▼</button>

            <section class="splide" aria-labelledby="carousel-heading">
                <h1 id="carousel-heading" class="fontA fontC">飲み会記録閲覧</h1>
                <div class="splide__track">
                    <ul class="splide__list">
                    </ul>
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
				</footer>
            </section>
        </div>
    </main>
    <script src="/nomikai/js/drinkRecord.js"></script>
</body>

</html>