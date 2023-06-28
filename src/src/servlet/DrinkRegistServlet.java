package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class drinkRegistServlet
 */
@WebServlet("/DrinkRegistServlet")
public class DrinkRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String json_enable = request.getParameter("jsonget");
			String name = request.getParameter("name");
			String img = request.getParameter("img");
			String drink = request.getParameter("drink");
			String eat = request.getParameter("eat");
			String money = request.getParameter("money");
			String userID = request.getParameter("userID");

			String secret_code = "dsfhjv4we8r321Hgscv";
			System.out.println("data1:" + json_enable);
			System.out.println("data2:" + secret_code);
			System.out.println("name:" + name);
			System.out.println("img:" + img);
			System.out.println("eat:" + eat);
			System.out.println("drink:" + drink);
			System.out.println("money:" + money);
			System.out.println("userID:" + userID);

			json_enable.equals(secret_code);
			if (!(json_enable.equals(secret_code))) {
				throw new RuntimeException("Not Match SecretCode.!!");
			}

			// nameとimgに値がセットされていれば友達新規登録処理を行う
			if ((name != null) && (img != null)) {
				Class.forName("org.h2.Driver");
				String url = "jdbc:h2:file:C:/dojo6/DB/nomikaiDB";
				Connection con = DriverManager.getConnection(url, "sa", "");
				String sql = "insert into friends (name, visitTimes, avator) values('" + name + "', 1, '" + img + "')";
				System.out.println("friendInsertSQL : " + sql);
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.executeUpdate();
			}

			// drink, eat, moneyに値がセットされていれば飲み会データ登録処理を行う
			if ((drink != null) || (eat != null) || (money != null)) {
				System.out.println("call is nomikaiDataInsert");
				Class.forName("org.h2.Driver");
				String url = "jdbc:h2:file:C:/dojo6/DB/nomikaiDB";
				Connection con = DriverManager.getConnection(url, "sa", "");
				// 現在ログインしているユーザを識別したい
				String sql = "insert into nomiInfo (drink, eat, account, age, gender, registData) "
						+ "values(" + drink + ", " + eat + ", " + money + ", "
						+ "select age from userInfo where userID like '" + userID // IDから年齢を取得
						+ "', select gender from userInfo where userID like '" + userID // IDから性別を取得
						+ "', CURDATE())";
				System.out.println("nomikaiInsertSQL : " + sql);
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.executeUpdate();
			}

			// 非同期で名前を取得
			JSONObject json = new JSONObject();
			try {
				//			System.out.println("aaaaa");
				Class.forName("org.h2.Driver");
				String url = "jdbc:h2:file:C:/dojo6/DB/nomikaiDB";
				Connection con = DriverManager.getConnection(url, "sa", "");
				// テーブルから全データを抽出
				String sql, sql2;
				sql = "select * from friends";
				sql2 = "select count(*) as sum from friends";
				System.out.println(sql);
				System.out.println(sql2);
				PreparedStatement stmt = con.prepareStatement(sql);
				PreparedStatement stmt2 = con.prepareStatement(sql2);
				ResultSet rs = stmt.executeQuery();
				ResultSet rs2 = stmt2.executeQuery();
				response.setContentType("application/json");
				response.setHeader("Cache-Control", "nocache");
				response.setCharacterEncoding("utf-8");
				//送信データの登録
				PrintWriter out = response.getWriter();
				//１レコード単位でカンマ設置の判定用カウンター
				int loop_cnt = 0;
				//Queryの実行結果行数の取得のために定義
				//ResultSetMetaData rsmd = rs.getMetaData();
				rs2.last();
				int num = rs2.getInt("sum");
				//System.out.println(rsmd.getColumnCount());
				//JSON配列形式のケース開始ブラケット
				out.println("[");
				while (rs.next()) {
					//1レコードの出力項目をjsonオブジェクトへセット
					json.put("name", rs.getString("name"));
					json.put("avator", rs.getString("avator"));
					//1レコード分をまとめてネットストリームへ書き込む
					out.print(json);
					//行数取得してレコード最終行のみカンマを外す判定処理
					if (loop_cnt < num - 1) {
						out.println(",");
					} else {
						out.println("");
					}
					loop_cnt++;
				}
				//JSON配列形式のケース終了ブラケット
				out.print("]");
				//DB接続終了
				rs.close();
				stmt.close();
				con.close();
				System.out.println("conection end");
			} catch (ClassNotFoundException e) {
				// TODO: handle exception
			} catch (SQLException e) {
				// TODO: handle exception
			}
		} catch (NullPointerException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRegist.jsp");
			dispatcher.forward(request, response);
		} catch (Throwable t) {
			t.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
