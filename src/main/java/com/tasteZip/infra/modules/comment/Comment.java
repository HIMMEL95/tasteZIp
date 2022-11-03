package com.tasteZip.infra.modules.comment;

public class Comment {
	
	public String ifcmSeq;
	public String ifmmSeq;
	public String ifcmComment;
	public String ifcmCreatedAt;
	public String ifcmModifiedAt;
	public Integer ifcmDelNy;
	public Integer ifcmGrade;
	public String ifstSeq;
	
// ------- join store s ----------
	public String ifstName;
	public String ifstAddress;
// ------- join store e ----------
	
	public Integer getIfcmGrade() {
		return ifcmGrade;
	}
	public void setIfcmGrade(Integer ifcmGrade) {
		this.ifcmGrade = ifcmGrade;
	}
	public String getIfstSeq() {
		return ifstSeq;
	}
	public void setIfstSeq(String ifstSeq) {
		this.ifstSeq = ifstSeq;
	}
	public String getIfcmSeq() {
		return ifcmSeq;
	}
	public void setIfcmSeq(String ifcmSeq) {
		this.ifcmSeq = ifcmSeq;
	}
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getIfcmComment() {
		return ifcmComment;
	}
	public void setIfcmComment(String ifcmComment) {
		this.ifcmComment = ifcmComment;
	}
	public String getIfcmCreatedAt() {
		return ifcmCreatedAt;
	}
	public void setIfcmCreatedAt(String ifcmCreatedAt) {
		this.ifcmCreatedAt = ifcmCreatedAt;
	}
	public String getIfcmModifiedAt() {
		return ifcmModifiedAt;
	}
	public void setIfcmModifiedAt(String ifcmModifiedAt) {
		this.ifcmModifiedAt = ifcmModifiedAt;
	}
	public Integer getIfcmDelNy() {
		return ifcmDelNy;
	}
	public void setIfcmDelNy(Integer ifcmDelNy) {
		this.ifcmDelNy = ifcmDelNy;
	}
	public String getIfstName() {
		return ifstName;
	}
	public void setIfstName(String ifstName) {
		this.ifstName = ifstName;
	}
	public String getIfstAddress() {
		return ifstAddress;
	}
	public void setIfstAddress(String ifstAddress) {
		this.ifstAddress = ifstAddress;
	}
	
	
	
}
