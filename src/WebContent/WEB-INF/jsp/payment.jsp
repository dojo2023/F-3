<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/nomikai/css/payment.css">
    <title>お会計</title>
</head>

<body>
    <img class="img-wide" src="/nomikai/img/backImage/payment.jpg">
    <img class="img-min" src="/nomikai/img/object/paymentResp.png">
    <img class="img-small" src="/nomikai/img/object/paymentResp.png">

    <form action="">
        <div class="payment-box">
            <button type="button" id="warikan" class="paySelect" onClick="divide()">・割り勘</button>
            <button type="button" id="ogori" class="paySelect">・おごり</button>
            <div>
                <span style="text-align: left;">金額 : </span><input class="input-style fonts" type="number" id="account" placeholder="20000"><span>円</span>
            </div>
            <div>
                <span style="text-align: left;">人数 : </span><input class="input-style fonts" type="number" id="numOp" placeholder="5"><span>人</span>
            </div>
            <div>
                <span style="text-align: left;">名前 : </span><input class="input-style fonts" type="text">
                <button id="regist" type="submit">登録</button>
            </div>
            <div>
                <span style="position: absolute; left: 22%; bottom: -8%;">生贄 : </span><span id="ikenie"></span>
            </div>
            <div>
                <span style="position: absolute; left: 18%; bottom: -15%;">一人当たり : </span><span id="result">
            </div>
        </div>
    </form>

</body>

<script>

	  function divide() {
		  let account = document.getElementById('account')
		  let numOp = document.getElementById('numOp')
		  let result = document.getElementById('result')

		  account =Number (account.value)
		  numOp = Number (numOp.value)
		  ans = account / numOp;
		result.innerHTML = Math.ceil(ans) + '円';

	}

</script>

</html>