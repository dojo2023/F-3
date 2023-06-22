package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Friends;

public class FriendsDAO {

	public List<Friends> select() {
		Connection conn = null;
		List<Friends> cardList = new ArrayList<Friends>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/DB/nomikaiDB", "sa", "");

			// SQL文を準備する
			//String sql = "select NUMBER, NAME, ADDRESS from BC WHERE NUMBER LIKE ? AND NAME LIKE ? AND ADDRESS LIKE ? ORDER BY NUMBER";
			String sql = "select * from friends";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Friends card = new Friends(
				rs.getInt("NUMBER"),
				rs.getString("NAME"),
				rs.getInt("VIVITTIME"),
				rs.getString("AVATAR")
				);
				cardList.add(card);
			}

		}
		catch (SQLException e) {
			e.printStackTrace();
			cardList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			cardList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					cardList = null;
				}

	}
  }
		// 結果を返す
		return cardList;
 }
}