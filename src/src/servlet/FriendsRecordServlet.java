package servlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FriendsDAO;
import model.Friends;
/**
 * Servlet implementation class FriendsRecordServlet
 */
@WebServlet("/FriendsRecordServlet")
public class FriendsRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int start=0;
	int flag=0;
	String start_ex=null;
	try {
	    start_ex  = request.getParameter("start");
	    if(start_ex == null) {
		   flag = 0;
	    }else {
	    	flag = 1;
	    }
	}catch(NullPointerException e) {
		System.out.println("null data appear.");
	}finally {
		if(flag == 0) start = 1;
		if(flag == 1) start = Integer.parseInt(start_ex);
	}
	FriendsDAO frienddata = new FriendsDAO();
	List<Friends> cardList = frienddata.select(start,10);
	request.setAttribute("cardList", cardList);
	request.setAttribute("next", cardList.size());
	request.setAttribute("start", start);
	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/FriendsRecord.jsp");
	// ログインページにフォワードする
	dispatcher.forward(request, response);
	}
}