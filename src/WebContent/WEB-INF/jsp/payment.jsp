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
            <button type="button" id="ogori" class="paySelect" onclick="classChange()">・おごり</button>
            <div>
                <span style="text-align: left;">金額 : </span><input class="input-style fonts" type="number" id="account" value="20000"><span>円</span>
            </div>
            <div>
                <span style="text-align: left;">人数 : </span><input class="input-style fonts" type="number" id="numOp" value="5"><span>人</span>
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

<div class="rouletteNon" id="target">
    <div class="outlineStyle"> <!-- 外枠 -->
        <div id="arrow" class="arrow-clippath"></div> <!-- 矢印 -->
        <div id="roulette" class="shape"></div> <!-- ルーレット本体 -->
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <select id="hcSelect" name="example">
            <option value="">人数を選択</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
        </select>
    </div>
    <button id="rltStart" type="button" class="btnStyle">ルーレットスタート</button>
    <button id="rotateStart" type="button" style="opacity: 0;"></button>
    <button id="return" type="button" class="btnStyle" onclick="classChange2()">戻る</button>

</div>

</body>

<script>
'use strict';
//割り勘機能
	  function divide() {
		  let account = document.getElementById('account')
		  let numOp = document.getElementById('numOp')
		  let result = document.getElementById('result')

		  account =Number (account.value)
		  numOp = Number (numOp.value)
		 let  ans = account / numOp;
		result.innerHTML = Math.ceil(ans) + '円';
	}

//奢り機能
        // ルーレットの色の配列
        let color = ['red', 'blue', 'green', 'yellow', 'pink', 'greenyellow', 'magenta', 'orange'];
       // 選択された人数を取得
        var hcSelect = document.querySelector("select[name=example]");
        let i;
        hcSelect.addEventListener('change', function () {
            let t = hcSelect.value;
            console.log(t);
            // ルーレットを作成
            let roulette = document.getElementById('roulette');
            let createRoulette = "";
            for (i = 0; i < t; i++) {
                if (i > 0 && i < t) {
                    createRoulette += ", ";
                }
                let temp = color[i] + " " + (360 / t * i) + "deg " + (360 / t * (i + 1)) + "deg";
                createRoulette += temp;
            }
           console.log(createRoulette);
            roulette.style.backgroundImage = "conic-gradient(" + createRoulette + ")";
        });
       const wheelTrap = document.getElementById("roulette");
        const sliceSize = 360 / 5;
       function spinRound(index) {
          // ルーレットのリセット
          wheelTrap.style.transition = "none";
          wheelTrap.style.transform = "rotate(0deg)";
         // 次のフレームでアニメーションを実行
          setTimeout(() => {
        	//回転遷移方法のセッティング
            wheelTrap.style.transition = "all ease-out 8s";//最後の秒数で回転時間を決定
           //回転の間隔(残像幅)をセット　回転速度調整
            const rotMin = (sliceSize * (index)) + (sliceSize / 25);
            const rotMax = (sliceSize * (index + 1)) - (sliceSize / 47);
           //回転の基数を乱数で決定
            const fullRots = Math.floor(Math.random() * 7) + 35;
            //回転の規則性のブレを作り毎回異なる扇で停止
            const rot = (fullRots * 260) + Math.floor(Math.random() * (rotMax - rotMin + 1) + rotMin);
			//回転処理
            wheelTrap.style.transform = `rotate(-${rot}deg)`;
          }, 0);
        }
    	//ボタンクリックをスキャン
        rltStart.addEventListener('click', function (index) {
            console.log('ルーレットスタート');
        	spinRound(5);
        });

 //ルーレット出現

        function classChange() {
        	  let target = document.getElementById("target");
        	  target.className = "rouletteWrapper";
        	}

//ルーレット消す

        function classChange2() {
        	  let target = document.getElementById("target");
        	  target.className = "rouletteNon";
        	}

</script>

</html>