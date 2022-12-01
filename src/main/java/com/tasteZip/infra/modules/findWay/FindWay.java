package com.tasteZip.infra.modules.findWay;

import com.tasteZip.infra.common.base.Base;

public class FindWay extends Base { 
	
//	store
	
 	private String ifstSeq;
    private String ifstAddress;
    
    
	public String getIfstSeq() {
		return ifstSeq;
	}
	public void setIfstSeq(String ifstSeq) {
		this.ifstSeq = ifstSeq;
	}
	public String getIfstAddress() {
		return ifstAddress;
	}
	public void setIfstAddress(String ifstAddress) {
		this.ifstAddress = ifstAddress;
	}
}