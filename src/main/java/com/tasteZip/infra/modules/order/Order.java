package com.tasteZip.infra.modules.order;

public class Order {
	
	public String iforSeq;
	public String ifmnSeq;
	public Integer iforCount;
	public String iforPrice;
	public Integer iforPay;
	public Integer iforDelNy;
	public String iforCreatedAt;
	
	public String getIforSeq() {
		return iforSeq;
	}
	public void setIforSeq(String iforSeq) {
		this.iforSeq = iforSeq;
	}
	public String getIfmnSeq() {
		return ifmnSeq;
	}
	public void setIfmnSeq(String ifmnSeq) {
		this.ifmnSeq = ifmnSeq;
	}
	public Integer getIforCount() {
		return iforCount;
	}
	public void setIforCount(Integer iforCount) {
		this.iforCount = iforCount;
	}
	public String getIforPrice() {
		return iforPrice;
	}
	public void setIforPrice(String iforPrice) {
		this.iforPrice = iforPrice;
	}
	public Integer getIforPay() {
		return iforPay;
	}
	public void setIforPay(Integer iforPay) {
		this.iforPay = iforPay;
	}
	public Integer getIforDelNy() {
		return iforDelNy;
	}
	public void setIforDelNy(Integer iforDelNy) {
		this.iforDelNy = iforDelNy;
	}
	public String getIforCreatedAt() {
		return iforCreatedAt;
	}
	public void setIforCreatedAt(String iforCreatedAt) {
		this.iforCreatedAt = iforCreatedAt;
	}
	
// ------- join store s ----------
	public String ifstSeq;
	public String ifstName;
	
	public String getIfstSeq() {
		return ifstSeq;
	}
	public void setIfstSeq(String ifstSeq) {
		this.ifstSeq = ifstSeq;
	}
	public String getIfstName() {
		return ifstName;
	}
	public void setIfstName(String ifstName) {
		this.ifstName = ifstName;
	}
// ------- join store e ----------
	
		
// ------- join member s ----------
	public String ifmmSeq;
	public String ifmmName;
	public String ifmmPhone;
	public String ifmmEmail;

	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getIfmmName() {
		return ifmmName;
	}
	public void setIfmmName(String ifmmName) {
		this.ifmmName = ifmmName;
	}
	public String getIfmmPhone() {
		return ifmmPhone;
	}
	public void setIfmmPhone(String ifmmPhone) {
		this.ifmmPhone = ifmmPhone;
	}
	public String getIfmmEmail() {
		return ifmmEmail;
	}
	public void setIfmmEmail(String ifmmEmail) {
		this.ifmmEmail = ifmmEmail;
	}
// ------- join member e ----------
	
// ------- join menu s ----------
	public String ifmnName;

	public String getIfmnName() {
		return ifmnName;
	}
	public void setIfmnName(String ifmnName) {
		this.ifmnName = ifmnName;
	}
	
// ------- join menu e ----------
		

	
}
