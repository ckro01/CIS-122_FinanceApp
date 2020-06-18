package account;

public class AccountProcessor {
//Fairly self explanatory, processor for the class "Account"
	public double getAmountToSave(double income) {
		return 0.2 * income;
	}

	public PieChartData preparePieChartData(Account account) {

		double savings = getAmountToSave(account.getIncome());

		double total = account.getRent() + account.getcFood() + account.getcEnt() +
				account.getcOther() + savings;

		double rentPercentage = (account.getRent() / total)  * 100;
		double foodExpensePercentage = (account.getcFood() / 100) * 100;
		double entertainmentPercentage = (account.getcEnt() / 100) * 100;
		double otherExpensePercentage = (account.getcOther() / 100) * 100;
		double savingsPercentage = (savings / 100) * 100;

		PieChartData chartData = new PieChartData(rentPercentage, foodExpensePercentage,
				entertainmentPercentage, otherExpensePercentage, savingsPercentage);


		return chartData;

	}
}