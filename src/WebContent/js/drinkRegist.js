/**
 *
 */

let drink = 0;
let eat = 0;
let drinkMob = 0;
let eatMob = 0;

function btnCount(i) {
            let btn = document.getElementById('btn' + i);
            console.log('abcde');

            if (i === 1) {
                drink = cntUp(drink);
                document.getElementById('drink').textContent = drink;
                drinkMob = cntUp(drinkMob);
                document.getElementById('drinkMobile').textContent = drinkMob;
            }
            else {
                eat = cntUp(eat);
                document.getElementById('eat').textContent = eat;
                eatMob = cntUp(eatMob);
                document.getElementById('eatMobile').textContent = eatMob;
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
                document.getElementById('drink').textContent = `0`;
                drink = 0;
                document.getElementById('drinkMobile').textContent = `0`;
                drinkMob = 0;
            }
            else if (i === 2) {
                document.getElementById('eat').textContent = `0`;
                eat = 0;
                document.getElementById('eatMobile').textContent = `0`;
                eatMob = 0;
            }
            else {
                document.getElementById('mony').value = ``;
                document.getElementById('monyInput').value = ``;
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
        var mySwiper = new Swiper('.swiper-container', {
            loop: true,
            slidesPerView: 4,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            },
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
                clickable: true
            }
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