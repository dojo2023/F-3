package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*
import dao.DrinkDAO;
import model.Drink;
*/
/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/DrinkServlet")
public class DrinkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/nomikai/jsp/drinkRecord.jsp");
			return;
		}

		// 検索ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/nomikai/jsp/drinkRecord.jsp");
		dispatcher.forward(request, response);
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
		String number = request.getParameter("NUMBER");
		String drink = request.getParameter("DRINK");
		String eat = request.getParameter("EAT");
		String account = request.getParameter("ACCOUNT");
		String age = request.getParameter("AGE");
		String gender = request.getParameter("GENDER");
		String registDate = request.getParameter("REGISTDATE");
/*
		// 検索処理を行う
		DrinkDAO bDao = new DrinkDAO();
		List<Drink> cardList = bDao.select(new Drink(number, drink, eat, account, age, gender, registDate));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);
*/
		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/drinkRecord.jsp");
		dispatcher.forward(request, response);
	}
}

