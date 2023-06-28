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

import dao.DrinkDAO;
import model.Drink;

/**
 * Servlet implementation class drinkRegistServlet
 */
@WebServlet("/DrinkRegistServlet_old")
public class DrinkRegistServlet_old extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String json_enable = request.getParameter("jsonget");
		if (json_enable.equals("abcde")) {
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
					System.out.println("while call");
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
				System.out.println("aaaaa");

			} catch (ClassNotFoundException e) {
				// TODO: handle exception
			} catch (SQLException e) {
				// TODO: handle exception
			}

		} else {

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRegist.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータの受け取り
		request.setCharacterEncoding("UTF-8");
		// 飲み会データ
		Integer drink = Integer.parseInt(request.getParameter("DRINK"));
		Integer eat = Integer.parseInt(request.getParameter("EAT"));
		Integer money = Integer.parseInt(request.getParameter("MONEY"));

		// 検索処理を行う
		DrinkDAO dDao = new DrinkDAO();
		// データが挿入できたかどうか
		boolean insertDataCheck = dDao.insert(new Drink(drink, eat, money));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("insertDataCheck", insertDataCheck);

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRegist.jsp");
		dispatcher.forward(request, response);

	}

}
