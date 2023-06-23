<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>s
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>drinkregist</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/9.3.2/swiper-bundle.css">
    <link rel="stylesheet" href="/nomikai/css/drinkRegist.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/9.3.2/swiper-bundle.min.js"></script>
</head>

<body>
    <form action="" class="pcScreen">
        <div class="h1-style">
            <h1 class="fonts" style="background-color: white;">データ登録</h1>
        </div>
        <table class="table-style" style="margin-right: 15%;">
            <tr>
                <td>
                    <span class="fonts label-style">飲んだ量</span>
                </td>
                <td>
                    <button id="btn1" type="button" class="btn-style" onclick="btnCount(1)">
                        <img src="/nomikai/img/object/beer.png" height="50px" width="50px" alt="" style="mix-blend-mode: multiply;">
                    </button>
                </td>
                <td>
                    <span class="fonts result-style">
                        <span>
                          <input id="drink" type="text" value="0"
                          class="fonts cntInput"  readonly size=1>
                        </span>
                        <span>杯</span>
                    </span>
                </td>
                <td>
                    <button type="button" name="" id="drinkResetBtn" class="resetBtn"
                        onclick="resetBtn(1)">リセット</button>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="fonts label-style">食べた量</span>
                </td>
                <td>
                    <button id="btn2" type="button" class="btn-style" onclick="btnCount(2)">
                        <img src="/nomikai/img/object/bean.png" height="50px" width="50px" alt="" style="mix-blend-mode: multiply;">
                    </button>
                </td>
                <td>
                    <span class="fonts result-style">
                     <input id="eat" type="text" value="0"
                          class="fonts cntInput"  readonly size=1>
                        <span>食</span>
                    </span>
                </td>
                <td>
                    <button type="button" name="" id="eatResetBtn" class="resetBtn" onclick="resetBtn(2)">リセット</button>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="fonts label-style">飲食代金</label>
                </td>
                <td>
                    <img src="/nomikai/img/object/money.png" height="55px" width="55px" alt="">
                </td>
                <td>
                    <div class="result-style" style="padding: 0;">
                        <input id="money" type="text" class="fonts account-input">
                        <span class="fonts account-en">円</span>
                    </div>
                </td>
                <td>
                    <button type="button" name="" id="monyResetBtn" class="resetBtn" onclick="resetBtn(3)">リセット</button>
                </td>
            </tr>
        </table>

        <table class="table-style" style="margin-right: 15%;">
            <tr>
                <td>
                    <div id="friendsListBox" class="box-style">
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                        <input type="checkbox" name="" id="">こんにちは<br>
                    </div>
                </td>
                <td>
                    <button id="btn" type="button" class="fonts label-style">▶ 友達</button>
                </td>
                <td style="padding: 0 30px;"></td>
                <td>
                    <button id="newFriendAddBtn" type="button" class="label-style fonts"
                        style="display: inline-block; text-align: center;">
                        <span>Frined</span><br>
                        <span>新規登録</span>
                    </button>
                </td>
            </tr>
        </table>


        <table class="table-style" style="margin-right: 15%;">
            <tr>
                <td>
                    <!-- アイコンスライダーを導入 -->
                    <!-- Swiper START -->
                    <div class="swiper-container" style="width: 400px; height: 160px; overflow: hidden;">
                        <!-- メイン表示部分 -->
                        <div class="swiper-wrapper">
                            <!-- 各スライド -->
                            <!-- <div class="swiper-slide"> -->
                            <img class="swiper-slide" src="/nomikai/img/icon/icon1.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon2.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon3.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon4.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon5.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon6.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon7.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon8.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon9.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon11.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon12.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                            <img class="swiper-slide" src="/nomikai/img/icon/icon13.png" alt=""
                                style="border-radius: 50%; height: 100px; width: 100px;">
                        </div>
                        <div style="width: 400px;">
                            <div class="swiper-button-prev"
                                style="position: relative; display: inline-block; padding-top: 35px;"></div>
                            <span style="margin: 0 150px;"></span>
                            <div class="swiper-button-next" style="position: relative; display: inline-block;"></div>
                        </div>
                        <!-- <div class="swiper-pagination"></div> -->
                    </div>
                    <!-- Swiper END -->

                </td>
                <td style="padding: 0 20px;"></td>
                <td>
                    <span class="fonts label-style" style="padding: 0;">登録</span>
                </td>
            </tr>
        </table>
    </form>
    <!-- pc画面終了 -->
    <!-- -------------------------------------------------------------------------- -->


    <!-- ----------------------------------------------------------------------- -->
    <!-- スマホ画面対応レスポンシブ画面 -->
   <form action="" class="resp">
        <div class="h1-style">
            <h1 class="fonts" style="background-color: white;">データ登録</h1>
        </div>
        <table class="table-style">
            <tr>
                <td style="margin-bottom: 20px;">
                    <span class="fonts label-style">飲んだ量</span>
                </td>
                <td>
                    <button id="btn1Mobile" type="button" class="btn-style" onclick="btnCount(1)">
                      <img src="/nomikai/img/object/beer.png" height="25px" width="25px" alt="">
                    </button>
                </td>
                <td>
                    <span class="fonts result-style"
                        style="display: block; width: 60px; height: 20px; margin-left: 10px;">
                        <input id="drinkMobile" type="text" name="DRINK" value="0"
                          class="fonts cntInput" readonly size=1>
                        <span style="font-size: 20px;">杯</span>
                    </span>
                </td>
                <td>
                    <button type="button" name="" id="drinkResetBtnMobile" class="resetBtn"
                        onclick="resetBtn(1)">リセット</button>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="fonts label-style">食べた量</span>
                </td>
                <td>
                    <button id="btn2Mobile" type="button" class="btn-style" onclick="btnCount(2)">
                        <img src="/nomikai/img/object/bean.png" height="25px" width="25px" alt="">
                    </button>
                </td>
                <td>
                    <span class="fonts result-style"
                        style="display: block; width: 60px; height: 20px; margin-left: 10px;">

                        <input id="eatMobile" type="text" name="EAT" value="0"
                          class="fonts cntInput" readonly size=1>
                        <span style="font-size: 20px;">食</span>
                    </span>
                </td>
                <td>
                    <button type="button" name="" id="eatResetBtnMobile" class="resetBtn"
                        onclick="resetBtn(2)">リセット</button>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="fonts label-style">飲食代金</label>
                </td>
                <td>
                    <img src="/nomikai/img/object/money.png" height="30px" width="30px" alt="">
                </td>
                <td>
                    <div class="result-style" style="padding: 0;">
                        <input id="moneyInput" type="text" class="fonts account-input" name="MONEY" value="0">
                        <span class="fonts account-en">円</span>
                    </div>
                </td>
                <td>
                    <button type="button" name="" id="monyeResetBtnMobile" class="resetBtn"
                        onclick="resetBtn(3)">リセット</button>
                </td>
            </tr>
        </table>

        <table class="table-style">
            <tr>
                <td>
                    <button id="friendListBtnMobile" type="button" class="fonts label-style">▼ 友達選択</button>
                </td>
                <td style="padding: 0 30px;"></td>
                <td>
                    <button id="newFriendAddBtnMobile" type="button" class="label-style fonts"
                        style="display: inline-block; text-align: center;">
                        <span>友達新規登録</span>
                    </button>
                </td>
            </tr>
             <tr>
                <td>
                    <div id="friendsListMobile" class="box-style-mobile">
                      <c:forEach var="e" items="${cardList}" >
                        <input type="checkbox" name="" id="">${e.name}<br>
                      </c:forEach>
                    </div>
                </td>
            </tr>
        </table>


        <table class="table-style">
            <tr>
                <td>
                     <!-- スライダーのメインコンテナ要素（必須） -->
                    <div class="swiper" style="width: 300px; height: 150px;">
                        <!-- スライドを囲む要素（必須） -->
                        <div class="swiper-wrapper">
                            <!-- スライド要素（必須） -->
                            <c:forEach var="e" items="${cardList}">
                            <div class="swiper-slide" style="width: 100px; background-color: inherit; border: none;">
                                <img src="${e.avator}" alt="">
                                <p>${e.name}</p>
                            </div>
                            </c:forEach>

                        </div>
                        <!-- ナビゲーションボタン要素（省略可能） -->
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>

                </td>
                <td style="padding: 0 20px;"></td>
            </tr>
        </table>
        <button type="submit" class="fonts label-style"
            style="margin: auto; display: block; height: 40px; width: 100px;">登録</button>
    </form>


    <!-- ------ 新規友達登録ウィンドウ ------ -->
    <form action="">
        <div id="registBox" class="registBox">
            <button id="closeBtn" class="closeBtn" type="button">
              <img src="/nomikai/img/object/x.svg" alt="">
            </button>
            <p>名前を入力してください</p>
              <input type="text" name="" id=""><br>
            <p>アイコンを選択してください</p>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(1)">
              <img id="img1" class="registBoxImg" src="/nomikai/img/icon/icon1.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(2)">
              <img id="img2" class="registBoxImg" src="/nomikai/img/icon/icon2.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(3)">
              <img id="img3" class="registBoxImg" src="/nomikai/img/icon/icon3.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(4)">
              <img id="img4" class="registBoxImg" src="/nomikai/img/icon/icon4.png" alt="">
            </button><br>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(5)">
              <img id="img5" class="registBoxImg" src="/nomikai/img/icon/icon5.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(6)">
              <img id="img6" class="registBoxImg" src="/nomikai/img/icon/icon6.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(7)">
              <img id="img7" class="registBoxImg" src="/nomikai/img/icon/icon7.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(8)">
              <img id="img8" class="registBoxImg" src="/nomikai/img/icon/icon8.png" alt="">
            </button><br>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(9)">
              <img id="img9" class="registBoxImg" src="/nomikai/img/icon/icon9.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(10)">
              <img id="img10" class="registBoxImg" src="/nomikai/img/icon/icon10.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(11)">
              <img id="img11" class="registBoxImg" src="/nomikai/img/icon/icon11.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(12)">
              <img id="img12" class="registBoxImg" src="/nomikai/img/icon/icon12.png" alt="">
            </button><br>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(13)">
              <img id="img13" class="registBoxImg" src="/nomikai/img/icon/icon13.png" alt="">
            </button>
            <button type="button" class="registBoxBtnStyle" onclick="btnCircleBorder(14)">
              <img id="img14" class="registBoxImg" src="/nomikai/img/icon/icon14.png" alt="">
            </button>
            <button type="button" class="newFriendRegistBtn">登録する</button>
        </div>
    </form>
    <!-- ----------------------------------- -->

 <script src="/nomikai/js/drinkRegist.js"></script>
</body>
</html>