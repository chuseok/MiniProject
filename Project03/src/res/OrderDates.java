package res;

import java.util.Date;

public class OrderDates {
	String orderMonth;
	Date orderDate;
	String sex;
	int age;
	int resCount;
	
	public OrderDates(Date orderDate, int resCount) {
		this.orderDate = orderDate;
		this.resCount = resCount;
	}	
	
	public OrderDates(Date orderDate) {
		this.orderDate = orderDate;
	}
	public OrderDates(String orderMonth, int resCount) {
		this.orderMonth = orderMonth;
		this.resCount = resCount;
	}
	public OrderDates(String orderMonth) {
		this.orderMonth = orderMonth;
	}	
	
	public String getOrderMonth() {
		return orderMonth;
	}

	public void setOrderMonth(String orderMonth) {
		this.orderMonth = orderMonth;
	}

	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getResCount() {
		return resCount;
	}
	public void setResCount(int resCount) {
		this.resCount = resCount;
	}
	
	
	
}
