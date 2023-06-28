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
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import dao.DrinkDAO;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/DrinkServlet")
public class DrinkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String json_enable = request.getParameter("jsonget");
			String number=request.getParameter("number");
			String eat= request.getParameter("eat");
			String drink= request.getParameter("drink");
			String account= request.getParameter("account");
			String secret_code= "dsfhjv4we8r321Hgscv";

			System.out.println("data1:"+json_enable);
			System.out.println("data2:"+secret_code);
			json_enable.equals(secret_code);
			if( !(json_enable.equals(secret_code)) ){
				throw new RuntimeException("Not Match SecretCode.!!");
			}
		JSONObject json = new JSONObject();
		try {
			// データベースとの接続の確立
			Class.forName("org.h2.Driver");
			String url = "jdbc:h2:file:C:/dojo6/DB/nomikaiDB";
			Connection con = DriverManager.getConnection(url, "sa", "");
			//テーブルから全件抽出
			String sql= "SELECT * from NOMIINFO";
			PreparedStatement stmt = con.prepareStatement(sql);
			//DBに対しQuery実行。rsに実行結果を蓄積
			ResultSet rs = stmt.executeQuery();
		    //httpヘッダー送信の登録
			response.setContentType("application/json");
			response.setHeader("Cache-Control", "nocache");
			response.setCharacterEncoding("utf-8");
		    //送信データの登録
			PrintWriter out = response.getWriter();
			//１レコード単位でカンマ設置の判定用カウンター
			int loop_cnt=0;
			//Queryの実行結果行数の取得のために定義
			ResultSetMetaData rsmd = rs.getMetaData();
			//JSON配列形式のケース開始ブラケット
			out.println("[");
			while (rs.next()) {
				//1レコードの出力項目をjsonオブジェクトへセット
				json.put("number",rs.getInt("number"));
				json.put("drink",rs.getInt("drink"));
				json.put("eat",rs.getInt("eat"));
				json.put("account",rs.getInt("account"));
				//1レコード分をまとめてネットストリームへ書き込む
				out.print(json);
				//行数取得してレコード最終行のみカンマを外す判定処理
				if( loop_cnt < rsmd.getColumnCount()-1) {
					out.println(",");
				}else {
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


		} catch (ClassNotFoundException e) {
			// TODO: handle exception
		} catch (SQLException e) {
			// TODO: handle exception
		}
	} catch(NullPointerException e){
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRecord.jsp");
		dispatcher.forward(request, response);
	}//catch(Throwable t) {
		//t.printStackTrace();
	//}
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/nomikai/jsp/drinkRecord.jsp");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		Integer number = Integer.parseInt(request.getParameter("NUMBER"));
		Integer drink = Integer.parseInt(request.getParameter("DRINK"));
		Integer eat = Integer.parseInt(request.getParameter("EAT"));
		Integer account = Integer.parseInt(request.getParameter("ACCOUNT"));
		// 検索処理を行う
		DrinkDAO dDao = new DrinkDAO();

		// = dDao.select(new Drink(number, drink, eat, account));

		// 検索結果をリクエストスコープに格納する
		//request.setAttribute("cardList", cardList);

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRecord.jsp");
		dispatcher.forward(request, response);
	}
}

