package com.tasteZip.infra.modules.member;

import org.springframework.web.multipart.MultipartFile;

import com.tasteZip.infra.common.base.Base;

public class Member extends Base{

    private String ifmmSeq;
    private String ifmmId;
    private String ifmmName;
    private String ifmmPwd;
    private String ifmmDob;
    private Integer ifmmGender;
    private String ifmmEmail;
    private String ifmmRadioOperator;
    private String ifmmPhone;
    private String ifmmZipCode;
    private String ifmmAddress;
    private String ifmmDetailAddress;
    private String ifmmExtraAddress;
    private Integer ifmmUserDiv;
    private Integer ifmmSnsDiv;
    private Integer ifmmEmailCheck;
    private String ifmmSnsImg;
    private String ifmmCreatedAt;
    private String ifmmModifiedAt;
    private Integer ifmmDelNy;
    
    /* image upload s */
    private MultipartFile[] profileImage;
    private Integer[] process;
    private String[] pathFile;
    private String[] fileSeq;
    
    public MultipartFile[] getProfileImage() {
        return profileImage;
    }
    public void setProfileImage(MultipartFile[] profileImage) {
        this.profileImage = profileImage;
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
    public String getIfmmName() {
        return ifmmName;
    }
    public void setIfmmName(String ifmmName) {
        this.ifmmName = ifmmName;
    }
    public String getIfmmPwd() {
        return ifmmPwd;
    }
    public void setIfmmPwd(String ifmmPwd) {
        this.ifmmPwd = ifmmPwd;
    }
    public String getIfmmDob() {
        return ifmmDob;
    }
    public void setIfmmDob(String ifmmDob) {
        this.ifmmDob = ifmmDob;
    }
    public Integer getIfmmGender() {
        return ifmmGender;
    }
    public void setIfmmGender(Integer ifmmGender) {
        this.ifmmGender = ifmmGender;
    }
    public String getIfmmEmail() {
        return ifmmEmail;
    }
    public void setIfmmEmail(String ifmmEmail) {
        this.ifmmEmail = ifmmEmail;
    }
    public String getIfmmRadioOperator() {
        return ifmmRadioOperator;
    }
    public void setIfmmRadioOperator(String ifmmRadioOperator) {
        this.ifmmRadioOperator = ifmmRadioOperator;
    }
    public String getIfmmPhone() {
        return ifmmPhone;
    }
    public void setIfmmPhone(String ifmmPhone) {
        this.ifmmPhone = ifmmPhone;
    }
    public String getIfmmZipCode() {
        return ifmmZipCode;
    }
    public void setIfmmZipCode(String ifmmZipCode) {
        this.ifmmZipCode = ifmmZipCode;
    }
    public String getIfmmAddress() {
        return ifmmAddress;
    }
    public void setIfmmAddress(String ifmmAddress) {
        this.ifmmAddress = ifmmAddress;
    }
    public String getIfmmDetailAddress() {
        return ifmmDetailAddress;
    }
    public void setIfmmDetailAddress(String ifmmDetailAddress) {
        this.ifmmDetailAddress = ifmmDetailAddress;
    }
    public String getIfmmExtraAddress() {
        return ifmmExtraAddress;
    }
    public void setIfmmExtraAddress(String ifmmExtraAddress) {
        this.ifmmExtraAddress = ifmmExtraAddress;
    }
    public Integer getIfmmUserDiv() {
        return ifmmUserDiv;
    }
    public void setIfmmUserDiv(Integer ifmmUserDiv) {
        this.ifmmUserDiv = ifmmUserDiv;
    }
    public Integer getIfmmSnsDiv() {
        return ifmmSnsDiv;
    }
    public void setIfmmSnsDiv(Integer ifmmSnsDiv) {
        this.ifmmSnsDiv = ifmmSnsDiv;
    }
    public Integer getIfmmEmailCheck() {
        return ifmmEmailCheck;
    }
    public void setIfmmEmailCheck(Integer ifmmEmailCheck) {
        this.ifmmEmailCheck = ifmmEmailCheck;
    }
    public String getIfmmSnsImg() {
        return ifmmSnsImg;
    }
    public void setIfmmSnsImg(String ifmmSnsImg) {
        this.ifmmSnsImg = ifmmSnsImg;
    }
    public String getIfmmCreatedAt() {
        return ifmmCreatedAt;
    }
    public void setIfmmCreatedAt(String ifmmCreatedAt) {
        this.ifmmCreatedAt = ifmmCreatedAt;
    }
    public String getIfmmModifiedAt() {
        return ifmmModifiedAt;
    }
    public void setIfmmModifiedAt(String ifmmModifiedAt) {
        this.ifmmModifiedAt = ifmmModifiedAt;
    }
    public Integer getIfmmDelNy() {
        return ifmmDelNy;
    }
    public void setIfmmDelNy(Integer ifmmDelNy) {
        this.ifmmDelNy = ifmmDelNy;
    }
}
