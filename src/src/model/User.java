package model;
import java.io.Serializable;
public class User implements Serializable {
  private String userID;
  private String userPW;
  private int max;
  private int age;
  private String gender;

public User(String userID, String userPW, int max, int age, String gender) {
	super();
	this.userID = userID;
	this.userPW = userPW;
	this.max = max;
	this.age = age;
	this.gender = gender;
}

public User() {
	super();
	this.userID = "";
	this.userPW = "";
	this.max = 0;
	this.age = 0;
	this.gender = "";
}

public String getUserID() {
	return userID;
}

public void setUserID(String userID) {
	this.userID = userID;
}

public String getUserPW() {
	return userPW;
}

public void setUserPW(String userPW) {
	this.userPW = userPW;
}

public int getMax() {
	return max;
}

public void setMax(int max) {
	this.max = max;
}

public int getAge() {
	return age;
}

public void setAge(int age) {
	this.age = age;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

}