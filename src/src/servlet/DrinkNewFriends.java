package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DrinkNewFriends
 */
@WebServlet("/DrinkNewFriends")
public class DrinkNewFriends extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		// 新規友達登録データ
		String name = request.getParameter("NAME"); // 名前
		Integer imgSelectNum = Integer.parseInt(request.getParameter("EAT")); // 画像の番号
		String imgSelectString = "/nomikai/img/icon/icon" + imgSelectNum + ".png"; // 画像パス

	}

}
