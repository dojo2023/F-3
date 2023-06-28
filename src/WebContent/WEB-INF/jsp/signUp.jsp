<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/nomikai/css/signUp.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="div_style">
        	<h1>新規登録</h1>
        </div>
    </header>

    <main>
    	<form method="POST" name="shinki" action="/nomikai/SignUpServlet">
			<table>
            	<tr style="white-space: nowrap">
                	<td class="td-style"><label class="label-style" >ID</label></td>
                	<td class="td-style"><input class="label-style2" type="text" id="newID" name="newID" placeholder="30文字以内"></td>
            	</tr>
            	<tr>
                	<td class="td-style"><label class="label-style">パスワード</label></td>
                	<td class="td-style"><input class="label-style2" type="password" id="newPW" name="newPW" placeholder="8文字以上"></td>
            	</tr>
				<tr>
                	<td class="td-style"><label class="label-style" >上限金額</label></td>
					<td class="td-style"><input class="label-style2" type="number" id="newMax" name="newMax" placeholder="平均：１万５千円"></td>
            	</tr>
            	<tr>
                	<td class="td-style"><label class="label-style" >年齢</label></td>
                	<td class="td-style"><input class="label-style2" type="number" min="20" id="newAge" name="newAge" placeholder="年齢" value="20"></td>
            	</tr>
            	<tr>
                	<td class="td-style"><label class="label-style" >性別</label></td>
                	<td class="td-style"><select name="gender" class="label-style2">
                        <option value="man">男性</option>
                        <option value="men">女性</option>
                        <option value="other">その他</option>
                    </select>
					</td>
            	</tr>
        	</table>
			<div>
            	<a href="/nomikai/LoginServlet">
                	<p class="img_style1"><img class="img_style1-1" src="/nomikai/img/object/bell2.png"></p>
                	<p class="p_style1">戻る</p>
            	</a>
        	</div>
        	<div>
              	<p class="img_style2"><img class="img_style2-1" src="/nomikai/img/object/tray.png"></p>
              	<button id="touroku" type="button" style= "background-color: transparent; border: none;" class="p_style2">登録</button>
        	</div>
        </form>
    </main>

    <script>
    // 指定したidをgetElementByIdで取得 letで宣言したtourokuに代入
      let touroku = document.getElementById('touroku');
      //let btn = documentElementById("touroku");
    // clickされたときにどのように動作するかの処理
      touroku.addEventListener('click', function(){
    	  	let newID = document.getElementById('newID').value;
            let newPW = document.getElementById('newPW').value;
            let newMax = document.getElementById('newMax').value;
            let newAge = document.getElementById('newAge').value;


    		if (newID === '') {
    			alert('IDが未入力です。');
    		} else if (!newPW) {
        		alert('パスワードが未入力です。');
    		} else if (!newMax) {
        		alert('金額上限が未入力です。');
    		} else if (!newAge) {
        		alert('年齢が未入力です。');
    		} else {
    			alert('登録しました。');
    			document.shinki.method="POST";
    			document.shinki.submit();
    		}
      });
    </script>

</body>
</html>