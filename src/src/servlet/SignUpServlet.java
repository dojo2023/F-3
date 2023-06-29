package servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 新規登録ページにフォワードする
		System.out.println("doGet");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signUp.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String newid = request.getParameter("newID");
		String newpw = request.getParameter("newPW");
		int newmax = Integer.parseInt(request.getParameter("newMax"));
		int newage = Integer.parseInt(request.getParameter("newAge")) ;
		String gender = request.getParameter("gender");
		String newgo1 = "";
		//String go = getParameter("****");
		//goはDBからもってきたハッシュ化されたpw比較するpwになります。

		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] result = md5.digest(newpw.getBytes());
			int[] i = new int[result.length];
			StringBuffer sb = new StringBuffer();
			for (int j = 0; j < result.length; j++) {
				i[j] = result[j] & 0xff;
				if (i[j] <= 15) {
					sb.append("0");
				}
				sb.append(Integer.toHexString(i[j]));
			}
			newgo1 = sb.toString(); // これをサーバに渡す
		} catch (NoSuchAlgorithmException x) {
			System.out.println("error with md5");
		}
		System.out.println("newgo1:" + newgo1);


        // データベースに登録する
        UserDAO dao = new UserDAO();
        boolean result = dao.insertSinki(new User(newid, newgo1, newmax, newage, gender));

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);

	}

}
