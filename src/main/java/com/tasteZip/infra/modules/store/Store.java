package com.tasteZip.infra.modules.store;

import org.springframework.web.multipart.MultipartFile;

import com.tasteZip.infra.common.base.Base;

public class Store extends Base {

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
    
    //running time dto s
    private String ifrtSeq;
    private Integer ifrtDay;
    private String ifrtStartTime;
    private String ifrtEndTime;
    private Integer ifrtOpening;

    private Integer[] ifrtDayArray;
    private String[] ifrtStartTimeArray;
    private String[] ifrtEndTimeArray;
    private Integer[] ifrtOpeningArray;
    //running time dto e
    
    /* image upload s */
    private MultipartFile[] storeImage;
    private Integer[] process;
    private String[] pathFile;
    private String[] fileSeq;
    
    // menu
    private String ifmnSeq;
    private String ifmnPrice;
    private String ifmnName;
    private String ifmnInfo;
    
    
    public MultipartFile[] getStoreImage() {
        return storeImage;
    }
    public void setStoreImage(MultipartFile[] storeImage) {
        this.storeImage = storeImage;
    }
    public Integer[] getProcess() {
        return process;
    }
    public void setProcess(Integer[] process) {
        this.process = process;
    }
    public String[] getPathFile() {
        return pathFile;
    }
    public void setPathFile(String[] pathFile) {
        this.pathFile = pathFile;
    }
    public String[] getFileSeq() {
        return fileSeq;
    }
    public void setFileSeq(String[] fileSeq) {
        this.fileSeq = fileSeq;
    }
    /* image upload e */

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
    public Integer[] getIfrtDayArray() {
        return ifrtDayArray;
    }
    public void setIfrtDayArray(Integer[] ifrtDayArray) {
        this.ifrtDayArray = ifrtDayArray;
    }
    public String[] getIfrtStartTimeArray() {
        return ifrtStartTimeArray;
    }
    public void setIfrtStartTimeArray(String[] ifrtStartTimeArray) {
        this.ifrtStartTimeArray = ifrtStartTimeArray;
    }
    public String[] getIfrtEndTimeArray() {
        return ifrtEndTimeArray;
    }
    public void setIfrtEndTimeArray(String[] ifrtEndTimeArray) {
        this.ifrtEndTimeArray = ifrtEndTimeArray;
    }
    public Integer[] getIfrtOpeningArray() {
        return ifrtOpeningArray;
    }
    public void setIfrtOpeningArray(Integer[] ifrtOpeningArray) {
        this.ifrtOpeningArray = ifrtOpeningArray;
    }
	public String getIfmnSeq() {
		return ifmnSeq;
	}
	public void setIfmnSeq(String ifmnSeq) {
		this.ifmnSeq = ifmnSeq;
	}
	public String getIfmnPrice() {
		return ifmnPrice;
	}
	public void setIfmnPrice(String ifmnPrice) {
		this.ifmnPrice = ifmnPrice;
	}
	public String getIfmnName() {
		return ifmnName;
	}
	public void setIfmnName(String ifmnName) {
		this.ifmnName = ifmnName;
	}
	public String getIfmnInfo() {
		return ifmnInfo;
	}
	public void setIfmnInfo(String ifmnInfo) {
		this.ifmnInfo = ifmnInfo;
	}
    
}
