package com.tasteZip.infra.modules.store;

import java.util.List;

public interface StoreService {
    
    // main
    public List<Store> selectList(StoreVo vo) throws Exception;
    public List<Store> storeList(StoreVo vo) throws Exception;
    public List<Store> mainStoreList(StoreVo vo) throws Exception;
    public List<Store> menuList(StoreVo vo) throws Exception;
    public Store storeMain(StoreVo vo) throws Exception;
    public int selectOneCount(StoreVo vo) throws Exception;
    
    //xdmin
    public List<Store> xdminSelectList(StoreVo vo) throws Exception;
    public List<Store> selectListLimit5(StoreVo svo) throws Exception;
    public int xdminSelectOneCount(StoreVo svo) throws Exception;
    public Store xdminSelectOne(StoreVo vo) throws Exception;
    public List<Store> openingList(StoreVo vo) throws Exception;
    public List<Store> day(Store dto) throws Exception;
    public List<Store> opening(Store dto) throws Exception;
    
    public int sDelete(StoreVo vo) throws Exception;
    public int rtDelete(StoreVo vo) throws Exception;
    public int uelete(Store dto) throws Exception;
    
    public int insert(Store dto) throws Exception;
    public int insertUploaded(Store dto) throws Exception;
    public int update(Store dto) throws Exception;
    
    //favorite 
    public int insertFv(Store dto) throws Exception;
    public int updateFv(Store dto) throws Exception;
    public Store storeSelectOne(StoreVo vo) throws Exception;
    
    public int runningInsert(Store dto) throws Exception;
    public int runningUpdate(Store dto) throws Exception;
    
    public List<Store> selectImg(StoreVo vo) throws Exception;
}
