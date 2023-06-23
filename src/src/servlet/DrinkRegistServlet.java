package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DrinkDAO;
import dao.FriendsDAO;
import model.Drink;
import model.Friends;

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
		// friendsテーブルのすべてのデータを取得 (実際に使用するのはname列のみ)
		// チェックボックスに名前を表示するため
		FriendsDAO fDao = new FriendsDAO();
		List<Friends> cardList = fDao.select();

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRegist.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータの受け取り
		request.setCharacterEncoding("UTF-8");
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
