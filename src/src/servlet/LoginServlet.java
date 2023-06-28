package servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String go1 = "";
		//String go = getParameter("****");
		//goはDBからもってきたハッシュ化されたpw比較するpwになります。

		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] result = md5.digest(pw.getBytes());
			int[] i = new int[result.length];
			StringBuffer sb = new StringBuffer();
			for (int j = 0; j < result.length; j++) {
				i[j] = result[j] & 0xff;
				if (i[j] <= 15) {
					sb.append("0");
				}
				sb.append(Integer.toHexString(i[j]));
			}
			go1 = sb.toString(); // これをサーバに渡す
		} catch (NoSuchAlgorithmException x) {
			System.out.println("error with md5");
		}
		System.out.println("go1:" + go1);

		// ログイン処理を行う
		UserDAO iDao = new UserDAO();
		if (iDao.isLoginOK(id, go1)) { // ログイン成功
			// セッションスコープにIDを格納する
			//HttpSession session = request.getSession();
			//session.setAttribute("id",id);

			// 全てのページからIDを参照するため、アプリケーションスコープに格納
			ServletContext application = this.getServletContext();
			application.setAttribute("id", id);

			// メニューサーブレットにリダイレクトする
			response.sendRedirect("/nomikai/MenuServlet");
		} else { // ログイン失敗
			// リクエストスコープに、タイトル、メッセージ、戻り値を格納する
			request.setAttribute("result", "ログインエラーが発生しました。");

			// 結果ページにフォワードする?
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
			dispatcher.forward(request, response);
		}
	}
}