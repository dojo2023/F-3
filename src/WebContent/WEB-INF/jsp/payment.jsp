<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/nomikai/css/payment.css">
    <title>payment</title>
</head>

<body>
    <img class="img-wide" src="/nomikai/img/backImage/payment.jpg">
    <img class="img-min" src="/nomikai/img/object/paymentResp.png">
    <img class="img-small" src="/nomikai/img/object/paymentResp.png">

    <form action="">
        <div class="payment-box">
            <button id="warikan" type="button" class="char-style fonts">割り勘</button>
            <button id="ogori" type="button" class="char-style fonts">奢り</button>
            <div>
                <span style="text-align: left;">金額 : </span><input class="input-style fonts" type="text"><span>円</span>
            </div>
            <div>
                <span style="text-align: left;">人数 : </span><input class="input-style fonts" type="text"><span>人</span>
            </div>
            <div>
                <span style="text-align: left;">名前 : </span><input class="input-style fonts" type="text">
                <button id="regist" type="submit">登録</button>
            </div>
            <div>
                <span style="text-align: left;">生贄 : </span><input class="input-style fonts" type="text"><span>人</span>
            </div>
            <div>
                <span style="text-align: left;">一人当たり : </span><input class="input-style fonts"
                    type="text"><span>円</span>
            </div>
        </div>
    </form>


</body>

</html>