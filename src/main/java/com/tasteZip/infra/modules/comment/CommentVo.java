package com.tasteZip.infra.modules.comment;

import com.tasteZip.infra.common.base.BaseVo;

public class CommentVo extends BaseVo{

		private String ifcmSeq;
		private Integer shOption;
		private String shValue;
		private Integer ifcmDelNy;
		private Integer shUpdt;
		
		
		public String getIfcmSeq() {
			return ifcmSeq;
		}
		public void setIfcmSeq(String ifcmSeq) {
			this.ifcmSeq = ifcmSeq;
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
		public Integer getIfcmDelNy() {
			return ifcmDelNy;
		}
		public void setIfcmDelNy(Integer ifcmDelNy) {
			this.ifcmDelNy = ifcmDelNy;
		}
		public Integer getShUpdt() {
			return shUpdt;
		}
		public void setShUpdt(Integer shUpdt) {
			this.shUpdt = shUpdt;
		}
}
