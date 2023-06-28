package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDAO {
	// ログインできるならtrueを返す
	public boolean isLoginOK(String id,String pw) {
		Connection conn = null;
		boolean loginResult = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/DB/nomikaiDB", "sa", "");

			// SELECT文を準備する
			// ? は値を差し込む場所
			String sql = "select userpw from USERINFO where userid = ?";
			// SQLインジェクションを防ぐ
			PreparedStatement pStmt = conn.prepareStatement(sql);
			// ここで？に差し込む
			pStmt.setString(1,id);
			//pStmt.setString(2,pw);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();
			//if (rs.getInt("count(*)") == 1) {
			//	loginResult = true;
			//}
			String data = rs.getString("userpw");
			//System.out.println("pw-1:" + pw + "pw-2:" + data);

			if( rs.getString("userpw") != null ) {
				if ( pw.equals(rs.getString("userpw")) ) {
					loginResult = true;
				}
			}

		}
		catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}

		// 結果を返す
		return loginResult;
	}

	public boolean insertSinki(User newinfo) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/DB/nomikaiDB", "sa", "");

			// SQL文を準備する
			String sql = "insert into USERINFO (userid,userpw,max,age,gender)values (?,?,?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, newinfo.getUserid());
			pStmt.setString(2, newinfo.getUserpw());
			pStmt.setInt(3, newinfo.getMax());
			pStmt.setInt(4, newinfo.getAge());
			pStmt.setString(5, newinfo.getGender());
			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}



	public boolean updateEdit(User userinfo) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/DB/nomikaiDB", "sa", "");

			// SQL文を準備する
			String sql = "update USERINFO set userpw = ?, max = ?, age = ?, gender = ? where number = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

			pStmt.setString(1, userinfo.getUserpw());
			pStmt.setInt(2, userinfo.getMax());
			pStmt.setInt(3, userinfo.getAge());
			pStmt.setString(4, userinfo.getGender());
			pStmt.setInt(5, userinfo.getNumber());



			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}


}
