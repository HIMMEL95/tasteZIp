package com.tasteZip.infra.modules.store;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface StoreService {
    
    // main
    public List<Store> selectList(StoreVo vo) throws Exception;
    public List<Store> storeList(StoreVo vo) throws Exception;
    public Store storeMain(StoreVo vo) throws Exception;
    public int selectOneCount(StoreVo vo) throws Exception;
    
    //xdmin
    public List<Store> xdminSelectList(StoreVo vo) throws Exception;
    public int xdminSelectOneCount(StoreVo vo) throws Exception;
    public Store xdminSelectOne(StoreVo vo) throws Exception;
    public List<Store> openingList(StoreVo vo) throws Exception;
    public List<Store> day(Store dto) throws Exception;
    public List<Store> opening(Store dto) throws Exception;
    
    public int sDelete(StoreVo vo) throws Exception;
    public int rtDelete(StoreVo vo) throws Exception;
    public int uelete(Store dto) throws Exception;
    
    public int insert(Store dto) throws Exception;
    public int update(Store dto) throws Exception;
    public int runningInsert(Store dto) throws Exception;
    public int runningUpdate(Store dto) throws Exception;
    
    /* image upload s */
    public void uploadFiles(MultipartFile[] multipartFiles, Store dto, String tableName, int type) throws Exception;
    public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Store dto, String tableName) throws Exception;
    public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Store dto, String tableName) throws Exception;
    /* image upload e */
}
