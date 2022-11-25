package com.tasteZip.infra.modules.store;

import com.tasteZip.infra.common.base.BaseVo;

public class StoreVo extends BaseVo {
    
    private Integer shOption;
    private String shValue;
    private Integer shDelNy;
    private Integer shOptionDate;
    private String shDateStart;
    private String shDateEnd;
    private String ifstSeq;
    private String ifmnSeq;
    private String seq;
    
   
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public Integer getShOption() {
        return shOption;
    }
    public void setShOption(Integer shOption) {
        this.shOption = shOption;
    }
    public String getShValue() {
        return shValue;
    }
    public void setShValue(String shValue) {
        this.shValue = shValue;
    }
    public Integer getShDelNy() {
        return shDelNy;
    }
    public void setShDelNy(Integer shDelNy) {
        this.shDelNy = shDelNy;
    }
    public Integer getShOptionDate() {
        return shOptionDate;
    }
    public void setShOptionDate(Integer shOptionDate) {
        this.shOptionDate = shOptionDate;
    }
    public String getShDateStart() {
        return shDateStart;
    }
    public void setShDateStart(String shDateStart) {
        this.shDateStart = shDateStart;
    }
    public String getShDateEnd() {
        return shDateEnd;
    }
    public void setShDateEnd(String shDateEnd) {
        this.shDateEnd = shDateEnd;
    }
    public String getIfstSeq() {
        return ifstSeq;
    }
    public void setIfstSeq(String ifstSeq) {
        this.ifstSeq = ifstSeq;
    }
	public String getIfmnSeq() {
		return ifmnSeq;
	}
	public void setIfmnSeq(String ifmnSeq) {
		this.ifmnSeq = ifmnSeq;
	}
    
}
