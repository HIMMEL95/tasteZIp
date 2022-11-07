package com.tasteZip.infra.modules.menu;

import com.tasteZip.infra.common.base.BaseVo;

public class MenuVo extends BaseVo {
    
    private String ifmnSeq;
    private Integer shOption;
    private String shValue;
    private Integer shDelNy;
    private Integer shDate;
    private Integer shUpdt;
	private String shDateStart;
	private String shDateEnd;
	private Integer shOptionDate;
    
    public String getIfmnSeq() {
        return ifmnSeq;
    }
    public void setIfmnSeq(String ifmnSeq) {
        this.ifmnSeq = ifmnSeq;
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
    public Integer getShDate() {
        return shDate;
    }
    public void setShDate(Integer shDate) {
        this.shDate = shDate;
    }
    public Integer getShUpdt() {
		return shUpdt;
	}
	public void setShUpdt(Integer shUpdt) {
		this.shUpdt = shUpdt;
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
	public Integer getShOptionDate() {
		return shOptionDate;
	}
	public void setShOptionDate(Integer shOptionDate) {
		this.shOptionDate = shOptionDate;
	}
	

}
