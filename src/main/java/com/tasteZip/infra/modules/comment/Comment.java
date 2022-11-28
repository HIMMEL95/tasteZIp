package com.tasteZip.infra.modules.comment;

import com.tasteZip.infra.common.base.Base;

public class Comment extends Base{
	
	public String ifcmSeq;
	public String ifcmComment; 
	public String ifcmCreatedAt;
	public String ifcmModifiedAt;
	public Integer ifcmDelNy;
	public Integer ifcmGrade; 
	
// ------- join member s ----------	
	public String ifmmSeq; 
	public String ifmmName; 
	public String ifmmId;
// ------- join member e ----------	
	
// ------- join store s ----------
	public String ifstSeq;
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
	public String getIfmmId() {
		return ifmmId;
	}
	public void setIfmmId(String ifmmId) {
		this.ifmmId = ifmmId;
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
	public String getIfmmName() {
		return ifmmName;
	}
	public void setIfmmName(String ifmmName) {
		this.ifmmName = ifmmName;
	}

}
