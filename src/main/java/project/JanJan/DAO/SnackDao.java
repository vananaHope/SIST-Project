package project.JanJan.DAO;

public class SnackDao {
	private String snack_name;
	private String category_name;
	private int snack_price;
	private String snack_img;
	private String snack_des;
	
	public SnackDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SnackDao(String snack_name, String category_name, int snack_price, String snack_img, String snack_des) {
		super();
		this.snack_name = snack_name;
		this.category_name = category_name;
		this.snack_price = snack_price;
		this.snack_img = snack_img;
		this.snack_des = snack_des;
	}
	public String getSnack_name() {
		return snack_name;
	}
	public void setSnack_name(String snack_name) {
		this.snack_name = snack_name;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getSnack_price() {
		return snack_price;
	}
	public void setSnack_price(int snack_price) {
		this.snack_price = snack_price;
	}
	public String getSnack_img() {
		return snack_img;
	}
	public void setSnack_img(String snack_img) {
		this.snack_img = snack_img;
	}
	public String getSnack_des() {
		return snack_des;
	}
	public void setSnack_des(String snack_des) {
		this.snack_des = snack_des;
	}
	
	
	
}
