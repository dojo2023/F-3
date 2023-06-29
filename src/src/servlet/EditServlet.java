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
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ログインページにフォワードする
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("id");



		ServletContext application = this.getServletContext();
		//application.setAttribute("cardList", cardList);

																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							request.setAttribute("id",id);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/edit.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		int changenumber = Integer.parseInt(request.getParameter("changeNumber"));
		//String changeid = request.getParameter("changeID");
		String changepw = request.getParameter("changePW");
		int changemax =	 Integer.parseInt(request.getParameter("changeMax"));
		int changeage = Integer.parseInt(request.getParameter("changeAge"));
		String gender = request.getParameter("gender");
		// if (changepw == null) {
          System.out.println("changemax:" + changemax);
          System.out.println("changeage:" + changeage);
          System.out.println("changenumber : " + changenumber);
          System.out.println("changepw : " + changepw);
          System.out.println("gender : " + gender);
		// }

          String changego1 = "";
  		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] result = md5.digest(changepw.getBytes());
			int[] i = new int[result.length];
			StringBuffer sb = new StringBuffer();
			for (int j = 0; j < result.length; j++) {
				i[j] = result[j] & 0xff;
				if (i[j] <= 15) {
					sb.append("0");
				}
				sb.append(Integer.toHexString(i[j]));
			}
			changego1 = sb.toString(); // これをサーバに渡す
  		} catch (NoSuchAlgorithmException x) {
					System.out.println("error with md5");
		}

		UserDAO dao = new UserDAO();
        boolean result = dao.updateEdit(new User(changenumber,changego1, changemax, changeage, gender));
        if(result == true) {
        	request.setAttribute("alert","更新が成功しました。");
        }else {
        	request.setAttribute("alert","更新が失敗しました。");
        }
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/menu.jsp");
		dispatcher.forward(request, response);
  }
}
