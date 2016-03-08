package sigma.carimi.model;

public class expenditureDTO{

	private int seq;
	private String id;
	private String wdate;
	private String moneytype;
	private int price;
	private String shopname;
	private String bcategory;
	private String scategory;
	private String wdates;
	
	public expenditureDTO(){}

	public expenditureDTO(String id){
		super();
		this.id = id;
	}

	public expenditureDTO(int seq, String id, String wdate, String moneytype, String bcategory, String scategory, String shopname, int price) {
		super();
		this.seq = seq;
		this.id = id;
		this.wdate = wdate;
		this.moneytype = moneytype;
		this.price = price;
		this.shopname = shopname;
		this.bcategory = bcategory;
		this.scategory = scategory;
	}
	
	public expenditureDTO(String id, String wdate, String moneytype, int price, String shopname, String bcategory, String scategory) {
		super();
		this.id = id;
		this.wdate = wdate;
		this.moneytype = moneytype;
		this.bcategory = bcategory;
		this.scategory = scategory;
		this.shopname = shopname;
		this.price = price;

	}
	
	public expenditureDTO(String id, String wdate, String moneytype, String bcategory, String scategory, String shopname, int price) {
		super();
		this.id = id;
		this.wdate = wdate;
		this.moneytype = moneytype;
		this.bcategory = bcategory;
		this.scategory = scategory;
		this.shopname = shopname;
		this.price = price;

	}

	public expenditureDTO(int seq, String id, String wdate, String moneytype, int price, String shopname, String bcategory,
			String scategory) {
		super();
		this.seq = seq;
		this.id = id;
		this.wdate = wdate;
		this.moneytype = moneytype;
		this.price = price;
		this.shopname = shopname;
		this.bcategory = bcategory;
		this.scategory = scategory;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getMoneytype() {
		return moneytype;
	}

	public void setMoneytype(String moneytype) {
		this.moneytype = moneytype;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getBcategory() {
		return bcategory;
	}

	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}

	public String getScategory() {
		return scategory;
	}

	public void setScategory(String scategory) {
		this.scategory = scategory;
	}

	public String getWdates() {
		return wdates;
	}

	public void setWdates(String wdates) {
		this.wdates = wdates;
	}

	@Override
	public String toString() {
		return "expenditureDTO [seq=" + seq + ", id=" + id + ", wdate=" + wdate + ", moneytype=" + moneytype
				+ ", price=" + price + ", shopname=" + shopname + ", bcategory=" + bcategory + ", scategory="
				+ scategory + ", wdates=" + wdates + "]";
	}

	
}