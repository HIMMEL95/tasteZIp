package com.tasteZip.infra.modules.menu;

import com.tasteZip.infra.common.base.BaseVo;

public class MenuVo extends BaseVo {
    
    private String ifmnSeq;
    private Integer shOption;
    private String shValue;
    private Integer shDelNy;
    private Integer shDate;
    private String startDate;
    private String endDate;
    
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
}
