package com.yg.dto;

public class ProductBean {
	
	
	@Override
	public String toString() {
		return "ProductBean [code=" + code + ", name=" + name + ", price=" + price + ", image=" + image + ", type="
				+ type + ", unit=" + unit + ", origin=" + origin + ", info1=" + info1 + ", info2=" + info2
				+ ", eximage=" + eximage + ", extitle1=" + extitle1 + ", extitle2=" + extitle2 + ", exdetail="
				+ exdetail + ", point=" + point + ", picktitle=" + picktitle + ", picksub=" + picksub + ", tipimage="
				+ tipimage + ", tiptitle1=" + tiptitle1 + ", tipsub1=" + tipsub1 + ", tiptitle2=" + tiptitle2
				+ ", tipsub2=" + tipsub2 + "]";
	}
	
	private String code;
	private String name;
	private int price;
	private String image;
	private String type;
	private String unit;
	private String origin;
	private String info1;
	private String info2;
	private String eximage;
	private String extitle1;
	private String extitle2;
	private String exdetail;
	private String point;
	private String picktitle;
	private String picksub;
	private String tipimage;
	private String tiptitle1;
	private String tipsub1;
	private String tiptitle2;
	private String tipsub2;
	
	
	public ProductBean() {	}
	public ProductBean(String code, String name, int pirce, String image) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.image = image;
	}
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEximage() {
		return eximage;
	}
	public void setEximage(String eximage) {
		this.eximage = eximage;
	}
	public String getExtitle1() {
		return extitle1;
	}
	public void setExtitle1(String extitle1) {
		this.extitle1 = extitle1;
	}
	public String getExtitle2() {
		return extitle2;
	}
	public void setExtitle2(String extitle2) {
		this.extitle2 = extitle2;
	}
	public String getExdetail() {
		return exdetail;
	}
	public void setExdetail(String exdetail) {
		this.exdetail = exdetail;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getInfo1() {
		return info1;
	}
	public void setInfo1(String info1) {
		this.info1 = info1;
	}
	public String getInfo2() {
		return info2;
	}
	public void setInfo2(String info2) {
		this.info2 = info2;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getPicktitle() {
		return picktitle;
	}
	public void setPicktitle(String picktitle) {
		this.picktitle = picktitle;
	}
	public String getPicksub() {
		return picksub;
	}
	public void setPicksub(String picksub) {
		this.picksub = picksub;
	}
	public String getTipimage() {
		return tipimage;
	}
	public void setTipimage(String tipimage) {
		this.tipimage = tipimage;
	}
	public String getTiptitle1() {
		return tiptitle1;
	}
	public void setTiptitle1(String tiptitle1) {
		this.tiptitle1 = tiptitle1;
	}
	public String getTipsub1() {
		return tipsub1;
	}
	public void setTipsub1(String tipsub1) {
		this.tipsub1 = tipsub1;
	}
	public String getTiptitle2() {
		return tiptitle2;
	}
	public void setTiptitle2(String tiptitle2) {
		this.tiptitle2 = tiptitle2;
	}
	public String getTipsub2() {
		return tipsub2;
	}
	public void setTipsub2(String tipsub2) {
		this.tipsub2 = tipsub2;
	}
	
}
