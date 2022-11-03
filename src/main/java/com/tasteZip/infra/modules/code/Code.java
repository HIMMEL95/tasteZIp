package com.tasteZip.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import com.tasteZip.infra.common.base.Base;
import com.tasteZip.infra.modules.code.Code;

public class Code extends Base{
    
    private String ifccSeq;
    private String ifccAnother;
    private String ifccName;
    private String ifccNameEng;
    private String ifccUseNy;
    private String ifccOrder;
    private String ifccExplanation;
    private String ifccDelNy;
    private String ifccReferenceV1;
    private String ifccReferenceV2;
    private String ifccReferenceV3;
    private String ifccReferenceI1;
    private String ifccReferenceI2;
    private String ifccReferenceI3;
    private String ifccCreatedAt;
    private String ifccModifiedAt;
    private String ifcgSeq;
    
    //  for cache
    public static List<Code> cachedCodeArrayList = new ArrayList<Code>();
    
    public String getIfccSeq() {
        return ifccSeq;
    }
    public void setIfccseq(String ifccSeq) {
        this.ifccSeq = ifccSeq;
    }
    public String getIfccAnother() {
        return ifccAnother;
    }
    public void setIfccAnother(String ifccAnother) {
        this.ifccAnother = ifccAnother;
    }
    public String getIfccName() {
        return ifccName;
    }
    public void setIfccName(String ifccName) {
        this.ifccName = ifccName;
    }
    public String getIfccNameEng() {
        return ifccNameEng;
    }
    public void setIfccNameEng(String ifccNameEng) {
        this.ifccNameEng = ifccNameEng;
    }
    public String getIfccUseNy() {
        return ifccUseNy;
    }
    public void setIfccUseNy(String ifccUseNy) {
        this.ifccUseNy = ifccUseNy;
    }
    public String getIfccOrder() {
        return ifccOrder;
    }
    public void setIfccOrder(String ifccOrder) {
        this.ifccOrder = ifccOrder;
    }
    public String getIfccExplanation() {
        return ifccExplanation;
    }
    public void setIfccExplanation(String ifccExplanation) {
        this.ifccExplanation = ifccExplanation;
    }
    public String getIfccDelNy() {
        return ifccDelNy;
    }
    public void setIfccDelNy(String ifccDelNy) {
        this.ifccDelNy = ifccDelNy;
    }
    public String getIfccReferenceV1() {
        return ifccReferenceV1;
    }
    public void setIfccReferenceV1(String ifccReferenceV1) {
        this.ifccReferenceV1 = ifccReferenceV1;
    }
    public String getIfccReferenceV2() {
        return ifccReferenceV2;
    }
    public void setIfccReferenceV2(String ifccReferenceV2) {
        this.ifccReferenceV2 = ifccReferenceV2;
    }
    public String getIfccReferenceV3() {
        return ifccReferenceV3;
    }
    public void setIfccReferenceV3(String ifccReferenceV3) {
        this.ifccReferenceV3 = ifccReferenceV3;
    }
    public String getIfccReferenceI1() {
        return ifccReferenceI1;
    }
    public void setIfccReferenceI1(String ifccReferenceI1) {
        this.ifccReferenceI1 = ifccReferenceI1;
    }
    public String getIfccReferenceI2() {
        return ifccReferenceI2;
    }
    public void setIfccReferenceI2(String ifccReferenceI2) {
        this.ifccReferenceI2 = ifccReferenceI2;
    }
    public String getIfccReferenceI3() {
        return ifccReferenceI3;
    }
    public void setIfccReferenceI3(String ifccReferenceI3) {
        this.ifccReferenceI3 = ifccReferenceI3;
    }
    public String getIfccCreatedAt() {
        return ifccCreatedAt;
    }
    public void setIfccCreatedAt(String ifccCreatedAt) {
        this.ifccCreatedAt = ifccCreatedAt;
    }
    public String getIfccModifiedAt() {
        return ifccModifiedAt;
    }
    public void setIfccModifiedAt(String ifccModifiedAt) {
        this.ifccModifiedAt = ifccModifiedAt;
    }
    public String getIfcgSeq() {
        return ifcgSeq;
    }
    public void setIfcdSeq(String ifcgSeq) {
        this.ifcgSeq = ifcgSeq;
    }
}
