package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Drink;


public class DrinkDAO {
	public List<Drink> select(Drink param) {
		Connection conn = null;
		List<Drink> cardList = new ArrayList<Drink>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/DB/nomikaiDB", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM Drink WHERE NUMBER LIKE ? AND DRINK LIKE ? AND EAT LIKE ? AND ACCOUNT LIKE ? AND AGE LIKE ? AND GENDER LIKE ? AND REGISTDATE LIKE ? ORDER BY NUMBER";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getNumber() != 0) {
				pStmt.setString(1, "%" + param.getNumber() + "%");
			} else {
				pStmt.setString(1, "%");
			}
			if (param.getDrink() != 0) {
				pStmt.setString(2, "%" + param.getDrink() + "%");
			} else {
				pStmt.setString(2, "%");
			}
			if (param.getEat() != 0) {
				pStmt.setString(3, "%" + param.getEat() + "%");
				} else {
					pStmt.setString(3, "%");
			}
			if (param.getAccount() != 0) {
				pStmt.setString(4, "%" + param.getAccount() + "%");
			} else {
				pStmt.setString(4, "%");
			}
			if (param.getAge() != 0) {
				pStmt.setString(5, "%" + param.getAge() + "%");
			} else {
				pStmt.setString(5, "%");
			}
			if (param.getGender() != null) {
				pStmt.setString(6, "%" + param.getGender() + "%");
			} else {
				pStmt.setString(6, "%");
			}
			if (param.getRegistData() != null) {
				pStmt.setString(7, "%" + param.getRegistData() + "%");
			} else {
				pStmt.setString(7, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Drink drink = new Drink(
						rs.getInt("NUMBER"),
						rs.getInt("DRINK"),
						rs.getInt("EAT"),
						rs.getInt("ACCOUNT"),
						rs.getInt("AGE"), // int型に修正
						rs.getString("GENDER"),
						rs.getDate("REGISTDATA") // date型に修正
				);
				cardList.add(drink);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			cardList = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			cardList = null;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					cardList = null;
				}
			}
		}

		// 結果を返す
		return cardList;
	}

	// 引数cardで指定されたレコードを登録し、成功したらtrueを返す
	public boolean insert(Drink card,String Userid) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する
			String sql = "INSERT INTO nomiInfo (drink, eat, account, age, gender, registdata)\r\n"
					+ "VALUES (?, ?, ?, (SELECT age FROM userInfo WHERE userID LIKE ?), (SELECT gender FROM userInfo WHERE userID LIKE ?), CURDATE());\r\n"
					+ "";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getDrink() != 0) {
				pStmt.setInt(1, card.getDrink());
			} else {
				pStmt.setInt(1, 0);
			}

			if (card.getEat() != 0) {
				pStmt.setInt(2, card.getEat());
			} else {
				pStmt.setInt(2, 0);
			}
			if (card.getAccount() != 0) {
				pStmt.setInt(3, card.getAccount());
			} else {
				pStmt.setInt(3, 0);
			}
			if (!(Userid.equals(null))) {
				pStmt.setString(4, Userid);
			} else {
				pStmt.setString(4, null);
			}
			if (!(Userid.equals(null))) {
				pStmt.setString(5, Userid);
			} else {
				pStmt.setString(5, null);
			}
			// SQL文を実行する
			int rowCount = pStmt.executeUpdate();
			if (rowCount == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}

	// 引数cardで指定されたレコードを更新し、成功したらtrueを返す
	public boolean update(Drink card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/DB/nomikaiDB", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE Drink SET DRINK=?, EAT=?, ACCOUNT=?, AGE=?, GENDER=?, REGISTDATE=? WHERE NUMBER=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getNumber() != 0) {
				pStmt.setInt(1, card.getNumber());
			} else {
				pStmt.setInt(1, 0);
			}

			if (card.getDrink() != 0) {
				pStmt.setInt(2, card.getDrink());
			} else {
				pStmt.setInt(2, 0);
			}

			if (card.getEat() != 0) {
				pStmt.setInt(3, card.getEat());
			} else {
				pStmt.setInt(3, 0);
			}
			if (card.getAccount() != 0) {
				pStmt.setInt(4, card.getAccount());
			} else {
				pStmt.setInt(4, 0);
			}
			if (card.getAge() != 0) {
				pStmt.setInt(5, card.getAge());
			} else {
				pStmt.setInt(5, 0);
			}
			if (card.getGender() != null && !card.getGender().equals("")) {
				pStmt.setString(6, card.getGender());
			} else {
				pStmt.setString(6, null);
			}
			if (card.getRegistData() != null) {
				Date sqlNow = new Date(System.currentTimeMillis());
				pStmt.setDate(7, sqlNow); // date型に修正
			} else {
				pStmt.setDate(7, null); // date型に修正
			}
			// SQL文を実行する
			int rowCount = pStmt.executeUpdate();
			if (rowCount == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}

	// 引数numberで指定されたレコードを削除し、成功したらtrueを返す
	public boolean delete(String number) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/DB/nomikaiDB", "sa", "");

			// SQL文を準備する
			String sql = "DELETE FROM Drink WHERE NUMBER=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (number != null && !number.equals("")) {
				pStmt.setString(1, number);
			} else {
				pStmt.setString(1, null);
			}

			// SQL文を実行する
			int rowCount = pStmt.executeUpdate();
			if (rowCount == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}
}