package com.tasteZip.infra.modules.store;

import java.util.List;

public interface StoreService {
    
    // main
    public List<Store> selectList(StoreVo vo) throws Exception;
    public int selectOneCount(StoreVo vo) throws Exception;
    
    //xdmin
    public List<Store> xdminSelectList(StoreVo vo) throws Exception;
    public int xdminSelectOneCount(StoreVo vo) throws Exception;
    public Store xdminSelectOne(StoreVo vo) throws Exception;
    public List<Store> openingList(Store dto) throws Exception;
    public List<Store> day(Store dto) throws Exception;
    public List<Store> opening(Store dto) throws Exception;
    
    public int delete(StoreVo vo) throws Exception;
    public int uelete(Store dto) throws Exception;
    
    public int insert(Store dto) throws Exception;
    public int update(Store dto) throws Exception;
    public int runningInsert(Store dto) throws Exception;
    public int runningUpdate(Store dto) throws Exception;
}
