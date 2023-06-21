package model;
import java.io.Serializable;
import java.util.Date;

public class Drink implements Serializable {
	private int number ;
	private int drink ;
	private int eat ;
	private int account ;
	private int age ;
	private String gender ;
	private Date registDate ;

	public Drink(int number, int drink, int eat, int account, int age, String gender, Date registDate) {
		this.number = number;
		this.drink = drink;
		this.eat = eat;
		this.account = account;
		this.age = age;
		this.gender = gender;
		this.registDate = registDate;
	}

	public Drink() {
		this.number = 0;
		this.drink = 0;
		this.eat = 0;
		this.account = 0;
		this.age = 0;
		this.gender = "";
		this.registDate = new Date();
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getDrink() {
		return drink;
	}

	public void setDrink(int drink) {
		this.drink = drink;
	}

	public int getEat() {
		return eat;
	}

	public void setEat(int eat) {
		this.eat = eat;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
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

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

}
