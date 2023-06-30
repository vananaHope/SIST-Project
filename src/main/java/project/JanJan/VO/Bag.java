package project.JanJan.VO;

public class Bag {
	private String cartNum;
	private int cnt;
	private int totalPrice;
	private String snackName;
	private String alcoholName;
	private String memId;
	
	public Bag() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Bag(int cnt, int totalPrice, String snackName, String alcoholName, String memId) {
		super();
		this.cnt = cnt;
		this.totalPrice = totalPrice;
		this.snackName = snackName;
		this.alcoholName = alcoholName;
		this.memId = memId;
	}

	public Bag(String snackName, String memId, int cnt, int totalPrice) {
		super();
		this.cnt = cnt;
		this.totalPrice = totalPrice;
		this.alcoholName = snackName;
		this.memId = memId;
	}
	
	
	public Bag(int cnt, int totalPrice, String alcoholName, String memId) {
		super();
		this.cnt = cnt;
		this.totalPrice = totalPrice;
		this.alcoholName = alcoholName;
		this.memId = memId;
	}

	public Bag(String cartNum, int cnt, int totalPrice, String snackName, String alcoholName, String memId) {
		super();
		this.cartNum = cartNum;
		this.cnt = cnt;
		this.totalPrice = totalPrice;
		this.snackName = snackName;
		this.alcoholName = alcoholName;
		this.memId = memId;
	}
	public Bag(int cnt, int totalPrice, String alcoholName) {
		super();
		this.cnt = cnt;
		this.totalPrice = totalPrice;
		this.alcoholName = alcoholName;
	}
	public String getCartNum() {
		return cartNum;
	}
	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getSnackName() {
		return snackName;
	}
	public void setSnackName(String snackName) {
		this.snackName = snackName;
	}
	public String getAlcoholName() {
		return alcoholName;
	}
	public void setAlcoholName(String alcoholName) {
		this.alcoholName = alcoholName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
}