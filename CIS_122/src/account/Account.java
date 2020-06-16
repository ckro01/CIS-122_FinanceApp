package account;

public class Account {

	private String fName;
	private String lName;
	private String email;
	private String phoneNumber;
	private double income;
	private double rent;
	private boolean isEmployed;
	private double cFood;
	private double cEnt;
	private double cOther;

	public Account(String fName, String lName, String email, String phoneNumber, 
			double income, double rent, boolean isEmployed, double cFood, double cEnt,
			double cOther) {
		super();
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.income = income;
		this.rent = rent;
		this.isEmployed = isEmployed;
		this.cFood = cFood;
		this.cEnt = cEnt;
		this.cOther = cOther;
	}

	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getName() {
		return fName + " " + lName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}
	public double getRent() {
		return rent;
	}
	public void setRent(double rent) {
		this.rent = rent;
	}
	public boolean isEmployed() {
		return isEmployed;
	}
	public void setEmployed(boolean isEmployed) {
		this.isEmployed = isEmployed;
	}
	public double getcFood() {
		return cFood;
	}
	public void setcFood(double cFood) {
		this.cFood = cFood;
	}
	public double getcEnt() {
		return cEnt;
	}
	public void setcEnt(double cEnt) {
		this.cEnt = cEnt;
	}
	public double getcOther() {
		return cOther;
	}
	public void setcOther(double cOther) {
		this.cOther = cOther;
	}	


}