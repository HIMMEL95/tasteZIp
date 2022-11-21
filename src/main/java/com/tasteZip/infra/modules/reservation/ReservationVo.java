package com.tasteZip.infra.modules.reservation;

import java.util.List;
import com.tasteZip.infra.common.base.BaseVo;

public class ReservationVo extends BaseVo {

	 private Integer shOption;
	 private String shValue;
	 private Integer shDelNy;
	
	 private String ifstSeq;
	 private String ifmmSeq;
	 private String ifrvSeq;
	 
	 private String shDateStart;
	 private String shDateEnd;
	 private Integer shOptionDate;
	 
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
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getIfrvSeq() {
		return ifrvSeq;
	}
	public void setIfrvSeq(String ifrvSeq) {
		this.ifrvSeq = ifrvSeq;
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

		// 리스트 체크박스 선택
		 private List<ReservationVo> seqVoList;

		public List<ReservationVo> getSeqVoList() {
			return seqVoList;
		}

		public void setSeqVoList(List<ReservationVo> seqVoList) {
			this.seqVoList = seqVoList;
		}
	 
}
