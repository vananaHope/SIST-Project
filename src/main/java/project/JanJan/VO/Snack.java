package project.JanJan.VO;

public class Snack {
	private String snackName;
	private String category;
	private int price;
	private String snackImg;
	private String snackDet;
	
	public Snack() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Snack(String snackName, String category, int price, String snackImg, String snackDet) {
		super();
		this.snackName = snackName;
		this.category = category;
		this.price = price;
		this.snackImg = snackImg;
		this.snackDet = snackDet;
	}

	public String getSnackName() {
		return snackName;
	}

	public void setSnackName(String snackName) {
		this.snackName = snackName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSnackImg() {
		return snackImg;
	}

	public void setSnackImg(String snackImg) {
		this.snackImg = snackImg;
	}

	public String getSnackDet() {
		return snackDet;
	}

	public void setSnackDet(String snackDet) {
		this.snackDet = snackDet;
	}
	
	
	
}
