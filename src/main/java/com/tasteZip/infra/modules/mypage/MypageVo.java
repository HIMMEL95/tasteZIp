package com.tasteZip.infra.modules.mypage;

import com.tasteZip.infra.common.base.BaseVo;

public class MypageVo extends BaseVo {
	
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	
	private String ifstSeq;
	private String ifmnSeq;
	private String ifmmSeq;
	private String ifmmCreatedAt;
	
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
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getIfmmCreatedAt() {
		return ifmmCreatedAt;
	}
	public void setIfmmCreatedAt(String ifmmCreatedAt) {
		this.ifmmCreatedAt = ifmmCreatedAt;
	}
	
}
