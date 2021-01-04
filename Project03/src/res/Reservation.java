package res;

import java.util.Date;

public class Reservation {
	int orderId;
	int tableNo;
	int custId;
	Date resDate;
	String resTime;
	Date orderDate;
	String progress;
	int headCount;
	String msg;
	
	public Reservation(int orderId, int tableNo, int custId, Date resDate, String resTime, Date orderDate, String progress,
			int headCount, String msg) {
		this.orderId = orderId;
		this.tableNo = tableNo;
		this.custId = custId;
		this.resDate = resDate;
		this.resTime = resTime;
		this.orderDate = orderDate;
		this.progress = progress;
		this.headCount = headCount;
		this.msg = msg;
	}
	public Reservation(Date orderDate, int headCount, String msg) {
		this.orderDate = orderDate;
		this.headCount = headCount;
		this.msg = msg;
	}
	public Reservation() {}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public int getHeadCount() {
		return headCount;
	}

	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getResTime() {
		return resTime;
	}
	public void setResTime(String resTime) {
		this.resTime = resTime;
	}
	
	
	
}
