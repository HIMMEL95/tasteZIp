package com.tasteZip.infra.modules.menu;

import org.springframework.web.multipart.MultipartFile;

import com.tasteZip.infra.common.base.Base;

public class Menu extends Base {
    
    private String ifmnSeq;
    private String ifmnName;
    private String ifmnPrice;
    private String ifmnInfo;
    private String ifmnDiscount;
    private Integer ifmnDelNy;
    private Integer ifmnSet_div;
    private String ifmnCreatedAt;
    private String ifmnModifiedAt;
    private String ifstSeq;
    
    /* image upload s */
    private MultipartFile[] menuImage;
    private Integer[] process;
    private String[] pathFile;
    private String[] fileSeq;
    
    public String getIfmnSeq() {
        return ifmnSeq;
    }
    public void setIfmnSeq(String ifmnSeq) {
        this.ifmnSeq = ifmnSeq;
    }
    public String getIfmnName() {
        return ifmnName;
    }
    public void setIfmnName(String ifmnName) {
        this.ifmnName = ifmnName;
    }
    public String getIfmnPrice() {
        return ifmnPrice;
    }
    public void setIfmnPrice(String ifmnPrice) {
        this.ifmnPrice = ifmnPrice;
    }
    public String getIfmnInfo() {
        return ifmnInfo;
    }
    public void setIfmnInfo(String ifmnInfo) {
        this.ifmnInfo = ifmnInfo;
    }
    public String getIfmnDiscount() {
        return ifmnDiscount;
    }
    public void setIfmnDiscount(String ifmnDiscount) {
        this.ifmnDiscount = ifmnDiscount;
    }
    public Integer getIfmnDelNy() {
        return ifmnDelNy;
    }
    public void setIfmnDelNy(Integer ifmnDelNy) {
        this.ifmnDelNy = ifmnDelNy;
    }
    public Integer getIfmnSet_div() {
        return ifmnSet_div;
    }
    public void setIfmnSet_div(Integer ifmnSet_div) {
        this.ifmnSet_div = ifmnSet_div;
    }
    public String getIfmnCreatedAt() {
        return ifmnCreatedAt;
    }
    public void setIfmnCreatedAt(String ifmnCreatedAt) {
        this.ifmnCreatedAt = ifmnCreatedAt;
    }
    public String getIfmnModifiedAt() {
        return ifmnModifiedAt;
    }
    public void setIfmnModifiedAt(String ifmnModifiedAt) {
        this.ifmnModifiedAt = ifmnModifiedAt;
    }
    public String getIfstSeq() {
        return ifstSeq;
    }
    public void setIfstSeq(String ifstSeq) {
        this.ifstSeq = ifstSeq;
    }
	public MultipartFile[] getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(MultipartFile[] menuImage) {
		this.menuImage = menuImage;
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
    
}
