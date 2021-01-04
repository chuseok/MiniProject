package res;

public class Review {
	private String rateMsg;
	private int rateStar;
	private String gender;
	private String age;
	
	public Review(){
		
	}
	public Review(String rateMsg, int rateStar, String gender, String age) {
		this.rateMsg = rateMsg;
		this.rateStar = rateStar;
		this.gender = gender;
		this.age = age;
	}
	public String getRateMsg() {
		return rateMsg;
	}
	public void setRateMsg(String rateMsg) {
		this.rateMsg = rateMsg;
	}
	public int getRateStar() {
		return rateStar;
	}
	public void setRateStar(int rateStar) {
		this.rateStar = rateStar;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	

	
	
}
