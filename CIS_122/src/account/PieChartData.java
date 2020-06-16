package account;

public class PieChartData {

	private double rent;
	private double cFood;
	private double cEnt;
	private double cOther;
	private double savings;


	public PieChartData(double rent, double cFood, double cEnt, double cOther, double savings) {
		super();
		this.rent = rent;
		this.cFood = cFood;
		this.cEnt = cEnt;
		this.cOther = cOther;
		this.savings = savings;
	}

	public double getRent() {
		return rent;
	}
	public void setRent(double rent) {
		this.rent = rent;
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
	public double getSavings() {
		return savings;
	}
	public void setSavings(double savings) {
		this.savings = savings;
	}


}