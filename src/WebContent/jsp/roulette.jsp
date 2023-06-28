<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>roulette</title>


</head>
<body>
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


</body>

<script type="text/javascript" language="javascript">
        'use strict';
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

            console.log("rotMax:" + rotMax  +" rotMin:" + rotMin);
           //回転の基数を乱数で決定
            const fullRots = Math.floor(Math.random() * 7) + 35;
           console.log(fullRots);
            //回転の規則性のブレを作り毎回異なる扇で停止
            const rot = (fullRots * 260) + Math.floor(Math.random() * (rotMax - rotMin + 1) + rotMin);
            console.log("rot:" + rot);
			//回転処理;
			console.log(wheelTrap);
            //wheelTrap.style.transform = `rotate( - ${abc}deg )`;
            wheelTrap.style.transform = "rotate(-" + rot + "deg )";
			console.log(wheelTrap.style.transform);
          }, 0);
        }
    	//ボタンクリックをスキャン
        rltStart.addEventListener('click', function (index) {
        	spinRound(5);
        });
</script>

   <style>
        :root {
            --rotateS: 0deg;
            --rotateE: 1080deg;
        }


        .btnStyle {
            height: 40px;
            width: 150px;
            margin: auto;
            margin-top: 10px;
            display: block;
        }

        /* 扇形 */
        .shape {
            margin: auto;
            width: 400px;
            height: 400px;
            /* degに 360 / 入力された人数 の値を代入 */
            /* すべて合わせてルーレットのマスにする */
            /* background-image: conic-gradient(rgb(22, 97, 227) 45deg, white 45deg); */
            background-image: conic-gradient(red 0deg 72deg, orange 72deg 144deg, yellow 144deg 216deg, green 216deg 288deg, blue 288deg 360deg);
            clip-path: circle();
        }

        /* ルーレット上部の矢印 */
        .arrow-clippath {
            position: absolute;
            display: inline-block;
            top: 0px;
            left: 185px;
            width: 30px;
            height: 50px;
            background-color: #00fddf;
            clip-path: polygon(50% 100%, 0 0, 100% 0);
            z-index: 1;
        }

        .outlineStyle {
            height: 400px;
            width: 400px;
            position: relative;
            border-radius: 50%;
            margin: auto;
        }
    </style>
</html>