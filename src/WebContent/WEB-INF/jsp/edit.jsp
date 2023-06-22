<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>設定</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/nomikai/css/edit.css" rel="stylesheet">
<link href="/nomikai/css/common.css" rel="stylesheet">
</head>

<body>
    <header>

    </header>

    <main>
        <div>
            <p class="img-style1"><img class="img-style1-1" src="/nomikai/img/object/manaita.png"></p>
            <p class="p-style">ID</p>
            <p class="input-style1"><input class="input-style1-1" type="text" name="changeID" placeholder="新規ID"></p>
            <p class="p-style2">パスワード</p>
            <p class="input-style2"><input class="input-style2-1" type="password" name="changePW" placeholder="新規PW"></p>
        </div>
        <div>
            <p class="img-style2"><img class="img-style2-1" src="/nomikai/img/object/manaita.png"></p>
            <p class="p-style3">上限金額</p>
            <p class="input-style3"><input class="input-style3-1" type="text" name="changeMax"></p>
            <p class="p-style4">円</p>
        </div>
        <div>
            <p class="img-style3"><img class="img-style3-1" src="/nomikai/img/object/manaita.png"></p>
            <p class="p-style5">年齢</p>
            <p class="input-style4"><input class="input-style4-1" type="number" name="changeAge"></p>
            <p class="p-style6">歳</p>
        </div>
        <div>
            <p class="img-style4"><img class="img-style4-1" src="/nomikai/img/object/manaita.png"></p>
            <p class="p-style7">男性　女性　その他</p>
        </div>
        <div>
            <p class="radio-style">
                <input type="radio" name="iconSelect" value="男性" id="iconSelectMale1" checked>
                <label for="iconSelectMale1"></label>
                <input type="radio" name="iconSelect" value="女性" id="iconSelectMale2">
                <label for="iconSelectMale2"></label>
                <input type="radio" name="iconSelect" value="その他" id="iconSelectFemale1">
                <label for="iconSelectFemale1"></label>
            </p>
        </div>
        <div>
            <a href>
                <p class="img-style5"><img class="img-style5-1" src="/nomikai/img/object/soisauce2.png"></p>
                <p class="p-style8">戻る</p>
            </a>
        </div>
        <div>
            <a href>
                <p class="img-style6"><img class="img-style6-1" src="/nomikai/img/object/mirin2.png"></p>
                <p class="p-style9">削除</p>
            </a>
        </div>
        <div>
            <a href>
                <p class="img-style7"><img class="img-style7-1" src="/nomikai/img/object/oil2.png"></p>
                <p class="p-style10">更新</p>
            </a>
        </div>
    </main>
    <footer>
    <ul class="menu">
        <li class="menuBar">
            <a href="/nomikai/DrinkRegistServlet" class="menuText">&#127867;飲み会登録</a>
            <a href="/nomikai/DrinkServlet" class="menuText">&#129534;データ閲覧</a><br>
            <hr>
            <a href="/nomikai/FriendsRecordServlet" class="menuText">&#129309;呑み友一覧</a>
            <a href="/nomikai/EditServlet" class="menuText">&#9881;&#65039;設定</a>
        </li>
    <ul>
</footer>
</body>
</html>