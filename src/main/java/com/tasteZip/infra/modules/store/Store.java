package com.tasteZip.infra.modules.store;

public class Store {

    private String ifstSeq;
    private String ifstName;
    private String ifstPhone;
    private String ifstZipCode;
    private String ifstAddress;
    private String ifstAddressDetail;
    private String ifstAddressExtra;
    private String ifstInfo;
    private String ifstDirections;
    private Integer ifstOrderNy;
    private Integer ifstDelNy;
    private String ifstCreatedAt;
    private String ifstModifiedAt;
    
    private String ifrtSeq;
    private Integer ifrtDay;
    private String ifrtStartTime;
    private String ifrtEndTime;
    private Integer ifrtOpening;
    
    // store dto
    public String getIfstSeq() {
        return ifstSeq;
    }
    public void setIfstSeq(String ifstSeq) {
        this.ifstSeq = ifstSeq;
    }
    public String getIfstName() {
        return ifstName;
    }
    public void setIfstName(String ifstName) {
        this.ifstName = ifstName;
    }
    public String getIfstPhone() {
        return ifstPhone;
    }
    public void setIfstPhone(String ifstPhone) {
        this.ifstPhone = ifstPhone;
    }
    public String getIfstZipCode() {
        return ifstZipCode;
    }
    public void setIfstZipCode(String ifstZipCode) {
        this.ifstZipCode = ifstZipCode;
    }
    public String getIfstAddress() {
        return ifstAddress;
    }
    public void setIfstAddress(String ifstAddress) {
        this.ifstAddress = ifstAddress;
    }
    public String getIfstAddressDetail() {
        return ifstAddressDetail;
    }
    public void setIfstAddressDetail(String ifstAddressDetail) {
        this.ifstAddressDetail = ifstAddressDetail;
    }
    public String getIfstAddressExtra() {
        return ifstAddressExtra;
    }
    public void setIfstAddressExtra(String ifstAddressExtra) {
        this.ifstAddressExtra = ifstAddressExtra;
    }
    public String getIfstInfo() {
        return ifstInfo;
    }
    public void setIfstInfo(String ifstInfo) {
        this.ifstInfo = ifstInfo;
    }
    public String getIfstDirections() {
        return ifstDirections;
    }
    public void setIfstDirections(String ifstDirections) {
        this.ifstDirections = ifstDirections;
    }
    public Integer getIfstOrderNy() {
        return ifstOrderNy;
    }
    public void setIfstOrderNy(Integer ifstOrderNy) {
        this.ifstOrderNy = ifstOrderNy;
    }
    public Integer getIfstDelNy() {
        return ifstDelNy;
    }
    public void setIfstDelNy(Integer ifstDelNy) {
        this.ifstDelNy = ifstDelNy;
    }
    public String getIfstCreatedAt() {
        return ifstCreatedAt;
    }
    public void setIfstCreatedAt(String ifstCreatedAt) {
        this.ifstCreatedAt = ifstCreatedAt;
    }
    public String getIfstModifiedAt() {
        return ifstModifiedAt;
    }
    public void setIfstModifiedAt(String ifstModifiedAt) {
        this.ifstModifiedAt = ifstModifiedAt;
    }
    
    // runningTime dto
    public String getIfrtSeq() {
        return ifrtSeq;
    }
    public void setIfrtSeq(String ifrtSeq) {
        this.ifrtSeq = ifrtSeq;
    }
    public Integer getIfrtDay() {
        return ifrtDay;
    }
    public void setIfrtDay(Integer ifrtDay) {
        this.ifrtDay = ifrtDay;
    }
    public String getIfrtStartTime() {
        return ifrtStartTime;
    }
    public void setIfrtStartTime(String ifrtStartTime) {
        this.ifrtStartTime = ifrtStartTime;
    }
    public String getIfrtEndTime() {
        return ifrtEndTime;
    }
    public void setIfrtEndTime(String ifrtEndTime) {
        this.ifrtEndTime = ifrtEndTime;
    }
    public Integer getIfrtOpening() {
        return ifrtOpening;
    }
    public void setIfrtOpening(Integer ifrtOpening) {
        this.ifrtOpening = ifrtOpening;
    }
}
