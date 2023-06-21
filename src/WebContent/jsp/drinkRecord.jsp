<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>title</title>
	<link rel="stylesheet" href="/nomikai/css/drinkRecord.css">
</head>

<body>

    <main class="downContainer">
        <div class="downContent">
            <h1 class="fontA fontB fontC">今月の飲み会記録</h1>
            <div class="container">
                <div id="totalBox">
                    <h2 class="fontA h2margin">飲んだお酒：<div id="BeerIcon-container"></div>
                    </h2>
                    <h2 class="fontA h2margin">食べた量　：<div id="YakitoriIcon-container">
                    </h2>
                    <h2 class="fontA h2margin">使ったお金：</h2>
                    <button onclick="addIcon()">アイコン追加</button>
                    <button onclick="addIcon2()">アイコン追加</button>
                </div>
            </div>
        </div>

        <button type="button" id="myButton" class="buttonB buttonC"
            onclick="toggleContent(); changeText()">月間記録▼</button>
        <section class="splide" aria-labelledby="carousel-heading">
            <h1 id="carousel-heading" class="fontA fontC">飲み会記録閲覧</h1>
            <div class="splide__track">
                <ul class="splide__list">
                </ul>
            </div>
            <a href="/nomikai/DrinkRegistServlet.java">飲み会登録ページへ</a>
        </section>
    </main>
    <script src="/nomikai/js/drinkRecord.js"></script>
    <script>
        var value = 0;

        function addIcon() {
            value++;

            var iconContainer = document.getElementById("BeerIcon-container");

            if (value <= 5) {
                var iconElement = document.createElement("img");
                iconElement.src = "/nomikai/img/object/beer3.png";
                iconElement.alt = "icon";
                iconElement.classList.add("icon");
                iconContainer.appendChild(iconElement);
            } else {
                var plusElement = document.getElementById("plus");

                if (!plusElement) {
                    plusElement = document.createElement("span");
                    plusElement.id = "plus";
                    plusElement.classList.add("plus");
                    iconContainer.appendChild(plusElement);
                }

                plusElement.textContent = "+" + (value - 5);
            }
        }
        var valueY = 0;

        function addIcon2() {
            valueY++;

            var iconContainer = document.getElementById("YakitoriIcon-container");

            if (valueY <= 5) {
                var iconElement = document.createElement("img");
                iconElement.src = "/nomikai/img/object/yakitori.png";
                iconElement.alt = "icon";
                iconElement.classList.add("icon");
                iconContainer.appendChild(iconElement);
            } else {
                var plusYElement = document.getElementById("plusY");

                if (!plusYElement) {
                    plusYElement = document.createElement("span");
                    plusYElement.id = "plusY";
                    plusYElement.classList.add("plusY");
                    iconContainer.appendChild(plusYElement);
                }

                plusYElement.textContent = "+" + (valueY - 5);
            }
        }
    </script>
</body>

</html>