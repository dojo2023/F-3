package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.DrinkDAO;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/updateData")
public class updateData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    String number = request.getParameter("number");
	    String eat = request.getParameter("eat");
	    String drink = request.getParameter("drink");
	    String account = request.getParameter("account");

	    System.out.println("number:" + number);
	    System.out.println("eat:" + eat);
	    System.out.println("drink:" + drink);
	    System.out.println("account:" + account);

	    // 非同期でUpdate処理するSQL文を記述する。
	    JSONObject json = new JSONObject();
	    try {
	        // データベースとの接続の確立
	        Class.forName("org.h2.Driver");
	        String url = "jdbc:h2:file:C:/dojo6/DB/nomikaiDB";
	        Connection con = DriverManager.getConnection(url, "sa", "");
	        // テーブルから全件抽出
	        String sql = "UPDATE NOMIINFO SET drink = ?, eat = ?, account = ? WHERE number = ?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setInt(1, Integer.parseInt(drink));
	        stmt.setInt(2, Integer.parseInt(eat));
	        stmt.setInt(3, Integer.parseInt(account));
	        stmt.setInt(4, Integer.parseInt(number));
	        stmt.executeUpdate();
	        // DBに対しQuery実行。rsに実行結果を蓄積
	        ResultSet rs = stmt.executeQuery();
	        // httpヘッダー送信の登録
	        response.setContentType("application/json");
	        response.setHeader("Cache-Control", "nocache");
	        response.setCharacterEncoding("utf-8");
	        // 送信データの登録
	        PrintWriter out = response.getWriter();
	        // １レコード単位でカンマ設置の判定用カウンター
	        int loop_cnt = 0;
	        // Queryの実行結果行数の取得のために定義
	        ResultSetMetaData rsmd = rs.getMetaData();
	        // JSON配列形式のケース開始ブラケット
	        out.println("[");
	        while (rs.next()) {
	            // 1レコードの出力項目をjsonオブジェクトへセット
	            json.put("number", rs.getInt("number"));
	            json.put("drink", rs.getInt("drink"));
	            json.put("eat", rs.getInt("eat"));
	            json.put("account", rs.getInt("account"));
	            // 1レコード分をまとめてネットストリームへ書き込む
	            out.print(json);
	            // 行数取得してレコード最終行のみカンマを外す判定処理
	            if (loop_cnt < rsmd.getColumnCount() - 1) {
	                out.println(",");
	            } else {
	                out.println("");
	            }

	            loop_cnt++;
	        }
	        // JSON配列形式のケース終了ブラケット
	        out.print("]");

	        // DB接続終了
	        rs.close();
	        stmt.close();
	        con.close();

	    } catch (ClassNotFoundException e) {
	        // TODO: handle exception
	    } catch (SQLException e) {
	        // TODO: handle exception
	    } catch (NullPointerException e) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRecord.jsp");
	        dispatcher.forward(request, response);
	    } catch (Throwable t) {
	        // t.printStackTrace();
	    }

	    // 下記重複？

	    // サーブレットのdoGetはvoidなのでSQLの戻り値は返せないので
	    // ネットワークストリームでstatus:false or status:trueをout.printlnで書き込む
	    // 受け取った非同期通信でstatusの値を抽出して成功、失敗を判定。

	    // httpヘッダー送信の登録
	    response.setContentType("text/html; charset=UTF-8");
	    response.setHeader("Cache-Control", "nocache");
	    response.setCharacterEncoding("utf-8");
	    // 送信データの登録
	    PrintWriter out = response.getWriter();

	    out.println("number:" + number);
	    out.println("eat:" + eat);
	    out.println("drink:" + drink);
	    out.println("account:" + account);

	    // RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRecord.jsp");
	    // dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String numberStr = request.getParameter("NUMBER");
		String drinkStr = request.getParameter("DRINK");
		String eatStr = request.getParameter("EAT");
		String accountStr = request.getParameter("ACCOUNT");

		Integer number = null;
		Integer drink = null;
		Integer eat = null;
		Integer account = null;

		if (numberStr != null) {
		    try {
		        number = Integer.parseInt(numberStr);
		    } catch (NumberFormatException e) {
		        // エラーハンドリング
		    }
		}

		if (drinkStr != null) {
		    try {
		        drink = Integer.parseInt(drinkStr);
		    } catch (NumberFormatException e) {
		        // エラーハンドリング
		    }
		}

		if (eatStr != null) {
		    try {
		        eat = Integer.parseInt(eatStr);
		    } catch (NumberFormatException e) {
		        // エラーハンドリング
		    }
		}

		if (accountStr != null) {
		    try {
		        account = Integer.parseInt(accountStr);
		    } catch (NumberFormatException e) {
		        // エラーハンドリング
		    }
		}

		DrinkDAO dDao = new DrinkDAO();



		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRecord.jsp");
		dispatcher.forward(request, response);
	}

}
