package com.tasteZip.infra.modules.order;

import com.tasteZip.infra.common.base.BaseVo;

public class OrderVo extends BaseVo{
	
	private String iforSeq;
	private Integer shOption;
	private String shValue;
	private Integer iforDelNy;
	private Integer shUpdt;
	
	
	public String getIforSeq() {
		return iforSeq;
	}
	public void setIforSeq(String iforSeq) {
		this.iforSeq = iforSeq;
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
	public Integer getIforDelNy() {
		return iforDelNy;
	}
	public void setIforDelNy(Integer iforDelNy) {
		this.iforDelNy = iforDelNy;
	}
	public Integer getShUpdt() {
		return shUpdt;
	}
	public void setShUpdt(Integer shUpdt) {
		this.shUpdt = shUpdt;
	}
	
	

}
