package model;
import java.io.Serializable;
public class User implements Serializable {
  private int number;
  private String userid;
  private String userpw;
  private int max;
  private int age;
  private String gender;

public User(int number,String userid, String userpw, int max, int age, String gender) {
	super();
	this.number = number;
	this.userid = userid;
	this.userpw = userpw;
	this.max = max;
	this.age = age;
	this.gender = gender;
}

public User(String userid, String userpw, int max, int age, String gender) {
	super();
	this.userid = userid;
	this.userpw = userpw;
	this.max = max;
	this.age = age;
	this.gender = gender;
}

public User() {
	super();
	this.number = 0;
	this.userid = "";
	this.userpw = "";
	this.max = 0;
	this.age = 0;
	this.gender = "";
}

public int getNumber() {
	return number;
}

public void setNumber(int number) {
	this.number = number;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getUserpw() {
	return userpw;
}

public void setUserpw(String userpw) {
	this.userpw = userpw;
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