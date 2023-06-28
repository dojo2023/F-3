package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String changeid = request.getParameter("changeID");
		String changepw = request.getParameter("changePW");
		int changemax = Integer.parseInt(request.getParameter("changeMax"));
		int changeage = Integer.parseInt(request.getParameter("changeAge"));
		String gender = request.getParameter("gender");


		UserDAO dao = new UserDAO();
        boolean result = dao.updateEdit(new User(changeid, changepw, changemax, changeage, gender));
        if( result == true) {
        	request.setAttribute("result","登録が成功しました。");
        }else {
        	request.setAttribute("result","登録が失敗しました。");
        }
        request.setAttribute("alert","登録が成功しました。OK");
		RequestDispatcher dispXatcher = request.getRequestDispatcher("/WEB-INF/jsp/userEdit.jsp");
		// dispatcher.forward(request, response);
	}

}
