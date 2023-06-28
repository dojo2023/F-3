/**
 *
 */


let drinkMob = 0;
let eatMob = 0;

function btnCount(i) {
            let btn = document.getElementById('btn' + i);
            console.log('abcde');

            if (i === 1) {
                drinkMob = cntUp(drinkMob);
                document.getElementById('drinkMobile').value = drinkMob;
            }
            else {
                eatMob = cntUp(eatMob);
                document.getElementById('eatMobile').value = eatMob;
            }
        }


        // カウントアップする
        function cntUp(i) {
            i += 1;
            return i;
        }

         // リセットボタンのメソッド
        function resetBtn(i) {
            if (i === 1) {
                document.getElementById('drinkMobile').value = `0`;
                drinkMob = 0;
            }
            else if (i === 2) {
                document.getElementById('eatMobile').value = `0`;
                eatMob = 0;
            }
            else {
                document.getElementById('moneyInput').value = `0`;
            }
        }

         // 友達ボタンを押したら、プルダウンチェックボックスを表示する
        let friendBtn = document.getElementById('btn');
        friendBtn.addEventListener('click', function () {
            // console.log('abcdefg');
            let friendList = document.querySelector('.box-style');
            if (friendList.style.display === "none") {
                friendList.style.display = "inline-block";
                // friendBtn.textContent = `▼ 友達`;
                friendBtn.value = "▼ 友達";
            }
            else {
                friendList.style.display = "none";
                friendBtn.value = "▶ 友達";
            }
        });


        // スライダー
         let mySwiper = new Swiper('.swiper', {

            // オプション設定
            loop: true,

            // 以下のコードは省略可能
            //ナビゲーションボタン（矢印）表示の設定
            navigation: {
                nextEl: '.swiper-button-next', //「次へボタン」要素の指定
                prevEl: '.swiper-button-prev', //「前へボタン」要素の指定
            },
            //ここまで省略可能
            slidesPerView: 3 // 画像の表示枚数
        });

         // ふわっとボックスを表示する
        let registBtn = document.getElementById('newFriendAddBtn');
        let registBox = document.getElementById('registBox');
        registBtn.addEventListener('click', function () {
            console.log('abcde');
            if (registBox.style.opacity === "0") {
                registBox.style.zIndex = 10;
                registBox.style.display = `block`;
                registBox.style.opacity = "100";
            }
            else {
                registBox.style.opacity = "0";
                registBox.style.zIndex = -10;
            }
        });

        let newFriendAddBtnMobile = document.getElementById('newFriendAddBtnMobile');
        newFriendAddBtnMobile.addEventListener('click', function () {
            if (registBox.style.opacity === "0") {
                registBox.style.zIndex = 10;
                registBox.style.display = `block`;
                registBox.style.opacity = "1";
            }
            else {
                registBox.style.opacity = "0";
                registBox.style.zIndex = -10;
            }
        });

        // ボタンが押されたらborderをつける
        let imgNum = 0; // 呼び出された回数の判定
        let temp = 0; // 前に押されたボタンの番号を記憶

        //  丸を削除するボタンを呼び出す
        function removeBtnCircle(i) {
            imgNum += 1;
            if (imgNum > 1) {
                imgCircleBorderRemove(i);
            }
        }

        // 丸を追加
        function btnCircleBorder(i) {
            removeBtnCircle(temp);
            let img = document.getElementById('img' + i);
            img.classList.add('imgCircleBoeder');
            temp = i;
            let imgSelect = document.getElementById('imgSelect');
            imgSelect.value = temp;
        }

        // 丸を削除
        function imgCircleBorderRemove(i) {
            let img = document.getElementById('img' + i);
            img.classList.remove('imgCircleBoeder');
        }

        // 新規登録ウィンドウを閉める
        let closeWindow = document.getElementById('closeBtn');
        closeWindow.addEventListener('click', function () {
            registBox.style.opacity = "0";
            registBox.style.zIndex = -10;
        });




       let friendList = document.getElementById('friendListBtnMobile');
        friendList.addEventListener('click', function () {
            let list = document.querySelector('.box-style-mobile');
            if (list.style.display === "none") {
                list.style.display = `block`;
            }
            else {
                list.style.display = `none`;
            }
        })

        // 飲食金額入力フォームがフォーカスされたらデフォルトで表示されているを消す
        let moneyInput = document.querySelector(`input[type="text"]`);
        let Input = document.getElementById('moneyInput');
        Input.addEventListener(`focus`, function() {
           console.log('aaaaa');
           document.getElementById('moneyInput').value = ``;
        });


