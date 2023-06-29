<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/nomikai/css/payment.css">
    <title>お会計</title>
</head>

<body>

    <form class="bigForm">
        <div class="payment-box">
            <button type="button" id="warikan" class="paySelect" onClick="divide()">・割り勘</button>
            <button type="button" id="ogori" class="paySelect" onclick="classChange()">・おごり</button>
            <div class="paymentForm">
                <span style="text-align: left; font-size: 40px;">金額 </span><input class="input-style fonts" type="number" id="account" min="0" max="1000000" value="20000"><span>円</span><br>
                <span style="text-align: left; font-size: 40px;">人数</span><input class="input-style fonts" type="number" id="numOp" value="5"><span>人</span>
            </div>
            <div>
                <p class="per1Text">一人当たり  </p><span id="result"></span>
            </div>
        </div>
    </form>

	<a href="/nomikai/LoginServlet" id="backButton">戻る</a>

<div class="rouletteNon" id="target"> <!-- ルーレット画面全体 -->
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

    <button id="rltStart" type="button" class="btnStyle1">ルーレットスタート</button>
    <button id="rotateStart" type="button" style="opacity: 0;"></button>
    <button id="return" type="button" class="btnStyle2" onclick="classChange2()">終わる</button>

    <table border="1" class="nameTable">
    	<tr>
    		<th class="nameText">色</th>
    		<th class="nameText" class="nameForm">名前</th>
    	</tr>
    	<tr>
    		<td class="nameText"><a id="color1">１</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form1" disabled></td>
    	</tr>
    	<tr>
    		<td class="nameText"><a id="color2">２</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form2" disabled></td>
    	</tr>
    	<tr id="name2" class="tableDisable">
    		<td class="nameText"><a id="color3">３</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form3" disabled></td>
    	</tr>
    	<tr>
    		<td class="nameText"><a id="color4">４</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form4" disabled></td>
    	</tr>
        <tr>
    		<td class="nameText"><a id="color5">５</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form5" disabled></td>
    	</tr>
    	<tr>
    		<td class="nameText"><a id="color6">６</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form6" disabled></td>
    	</tr>
    	<tr>
    		<td class="nameText"><a id="color7">７</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form7" disabled></td>
    	</tr>
    	<tr>
    		<td class="nameText"><a id="color8">８</a></td>
    		<td class="nameText"><input type="text" maxlength="20" class="nameForm" id="form8" disabled></td>
    	</tr>
    </table>
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

</script>

<script>
//奢り機能
        // ルーレットの色の配列
        let color = ['red', 'blue', 'green', 'yellow', 'pink', 'greenyellow', 'magenta', 'orange'];
       // 選択された人数を取得
        var hcSelect = document.querySelector("select[name=example]");
        let i;
        hcSelect.addEventListener('change', function () {
            let t = hcSelect.value;
            console.log(t);

            //入力フォーム制御

                if (t == 2) {
                    document.getElementById("form1").disabled = false;
                    document.getElementById("form2").disabled = false;
                    document.getElementById("form3").disabled = true;
                    document.getElementById("form4").disabled = true;
                    document.getElementById("form5").disabled = true;
                    document.getElementById("form6").disabled = true;
                    document.getElementById("form7").disabled = true;
                    document.getElementById("form8").disabled = true;
                }
                else if (t == 3) {
                    document.getElementById("form1").disabled = false;
                    document.getElementById("form2").disabled = false;
                    document.getElementById("form3").disabled = false;
                    document.getElementById("form4").disabled = true;
                    document.getElementById("form5").disabled = true;
                    document.getElementById("form6").disabled = true;
                    document.getElementById("form7").disabled = true;
                    document.getElementById("form8").disabled = true;
                }
                else if (t == 4) {
                    document.getElementById("form1").disabled = false;
                    document.getElementById("form2").disabled = false;
                    document.getElementById("form3").disabled = false;
                    document.getElementById("form4").disabled = false;
                    document.getElementById("form5").disabled = true;
                    document.getElementById("form6").disabled = true;
                    document.getElementById("form7").disabled = true;
                    document.getElementById("form8").disabled = true;
                }
                else if (t == 5) {
                    document.getElementById("form1").disabled = false;
                    document.getElementById("form2").disabled = false;
                    document.getElementById("form3").disabled = false;
                    document.getElementById("form4").disabled = false;
                    document.getElementById("form5").disabled = false;
                    document.getElementById("form6").disabled = true;
                    document.getElementById("form7").disabled = true;
                    document.getElementById("form8").disabled = true;
                }
                else if (t == 6) {
                    document.getElementById("form1").disabled = false;
                    document.getElementById("form2").disabled = false;
                    document.getElementById("form3").disabled = false;
                    document.getElementById("form4").disabled = false;
                    document.getElementById("form5").disabled = false;
                    document.getElementById("form6").disabled = false;
                    document.getElementById("form7").disabled = true;
                    document.getElementById("form8").disabled = true;
                }
                else if (t == 7) {
                    document.getElementById("form1").disabled = false;
                    document.getElementById("form2").disabled = false;
                    document.getElementById("form3").disabled = false;
                    document.getElementById("form4").disabled = false;
                    document.getElementById("form5").disabled = false;
                    document.getElementById("form6").disabled = false;
                    document.getElementById("form7").disabled = false;
                    document.getElementById("form8").disabled = true;
                }
                else if (t == 8) {
                    document.getElementById("form1").disabled = false;
                    document.getElementById("form2").disabled = false;
                    document.getElementById("form3").disabled = false;
                    document.getElementById("form4").disabled = false;
                    document.getElementById("form5").disabled = false;
                    document.getElementById("form6").disabled = false;
                    document.getElementById("form7").disabled = false;
                    document.getElementById("form8").disabled = false;
                }
                else {
                    document.getElementById("form1").disabled = true;
                    document.getElementById("form2").disabled = true;
                    document.getElementById("form3").disabled = true;
                    document.getElementById("form4").disabled = true;
                    document.getElementById("form5").disabled = true;
                    document.getElementById("form6").disabled = true;
                    document.getElementById("form7").disabled = true;
                    document.getElementById("form8").disabled = true;
                }

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
    	   console.log('abcde');
          // ルーレットのリセット
          wheelTrap.style.transition = "none";
          wheelTrap.style.transform = "rotate(0deg)";
         // 次のフレームでアニメーションを実行
          setTimeout(() => {
        	  console.log('setTimeOut');
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
            //wheelTrap.style.transform = `rotate(-${rot}deg)`;
            wheelTrap.style.transform = "rotate(-" + rot + "deg )";
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