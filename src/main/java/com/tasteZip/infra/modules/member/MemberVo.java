package com.tasteZip.infra.modules.member;

import com.tasteZip.infra.common.base.BaseVo;

public class MemberVo extends BaseVo{
    
    private Integer shOption;
    private String shValue;
    private Integer shDelNy;
    private Integer shDate;
    private String startDate;
    private String endDate; 
    private String ifmmSeq;
    
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
    public String getStartDate() {
        return startDate;
    }
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }
    public String getEndDate() {
        return endDate;
    }
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
    public String getIfmmSeq() {
        return ifmmSeq;
    }
    public void setIfmmSeq(String ifmmSeq) {
        this.ifmmSeq = ifmmSeq;
    }

}
