package com.tasteZip.infra.modules.order;

public class Order {
	
	public String ifbySeq;
	public String ifmnSeq;
	public Integer ifbyCount;
	public Integer ifbyPrice;
	public Integer ifbyPay;
	public Integer ifbyDelNy;
	public String ifbyCreatedAt;
	public String iforSeq;

	public String getIfbySeq() {
        return ifbySeq;
    }
    public void setIfbySeq(String ifbySeq) {
        this.ifbySeq = ifbySeq;
    }
    public String getIfmnSeq() {
        return ifmnSeq;
    }
    public void setIfmnSeq(String ifmnSeq) {
        this.ifmnSeq = ifmnSeq;
    }
    public Integer getIfbyCount() {
        return ifbyCount;
    }
    public void setIfbyCount(Integer ifbyCount) {
        this.ifbyCount = ifbyCount;
    }
    public Integer getIfbyPrice() {
        return ifbyPrice;
    }
    public void setIfbyPrice(Integer ifbyPrice) {
        this.ifbyPrice = ifbyPrice;
    }
    public Integer getIfbyPay() {
        return ifbyPay;
    }
    public void setIfbyPay(Integer ifbyPay) {
        this.ifbyPay = ifbyPay;
    }
    public Integer getIfbyDelNy() {
        return ifbyDelNy;
    }
    public void setIfbyDelNy(Integer ifbyDelNy) {
        this.ifbyDelNy = ifbyDelNy;
    }
    public String getIfbyCreatedAt() {
        return ifbyCreatedAt;
    }
    public void setIfbyCreatedAt(String ifbyCreatedAt) {
        this.ifbyCreatedAt = ifbyCreatedAt;
    }
    public String getIforSeq() {
        return iforSeq;
    }
    public void setIforSeq(String iforSeq) {
        this.iforSeq = iforSeq;
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
	public Integer totalPrice;
	public Integer totalCount;

	public Integer getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }
    public Integer getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }
    public String getIfmnName() {
		return ifmnName;
	}
	public void setIfmnName(String ifmnName) {
		this.ifmnName = ifmnName;
	}
	
// ------- join menu e ----------
		
    /* order s */
	public String iforName;
	public String iforPrice;
	public Integer iforCount;
	public String iforCreatedAt;

    public String getIforName() {
        return iforName;
    }
    public void setIforName(String iforName) {
        this.iforName = iforName;
    }
    public String getIforPrice() {
        return iforPrice;
    }
    public void setIforPrice(String iforPrice) {
        this.iforPrice = iforPrice;
    }
    public Integer getIforCount() {
        return iforCount;
    }
    public void setIforCount(Integer iforCount) {
        this.iforCount = iforCount;
    }
    public String getIforCreatedAt() {
        return iforCreatedAt;
    }
    public void setIforCreatedAt(String iforCreatedAt) {
        this.iforCreatedAt = iforCreatedAt;
    }
    /* order e */
    
    public String path;
    public String uuidName;

    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public String getUuidName() {
        return uuidName;
    }
    public void setUuidName(String uuidName) {
        this.uuidName = uuidName;
    }
	
}
