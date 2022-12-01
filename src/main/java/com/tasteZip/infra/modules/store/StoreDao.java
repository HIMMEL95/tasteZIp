package com.tasteZip.infra.modules.store;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao {

    @Inject
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
    
    private static String namespace = "com.tasteZip.infra.modules.store.StoreMapper";
    
    public List<Store> selectList(StoreVo vo) { return sqlSession.selectList(namespace + ".selectList", vo); }
    public List<Store> storeList(StoreVo vo) { return sqlSession.selectList(namespace + ".storeList", vo); }
    public List<Store> mainStoreList(StoreVo vo) { return sqlSession.selectList(namespace + ".mainStoreList", vo); }
    public List<Store> menuList(StoreVo vo) { return sqlSession.selectList(namespace + ".menuList", vo); }
    public int selectOneCount(StoreVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
    
    //xdmin 
    public List<Store> xdminSelectList(StoreVo vo) { return sqlSession.selectList(namespace + ".xdminSelectList", vo); }
    public List<Store> selectListLimit5(StoreVo vo) { return sqlSession.selectList(namespace + ".selectListLimit5", vo); }
    public int xdminSelectOneCount(StoreVo vo) { return sqlSession.selectOne(namespace + ".xdminSelectOneCount", vo); }
    public Store xdminSelectOne(StoreVo vo) { return sqlSession.selectOne(namespace + ".xdminSelectOne", vo); }
    public Store storeMain(StoreVo vo) { return sqlSession.selectOne(namespace + ".storeMain", vo); }
    public List<Store> openingList(StoreVo vo) { return sqlSession.selectList(namespace + ".openingList", vo); }
    public List<Store> day(Store dto) { return sqlSession.selectList(namespace + ".day", dto); }
    public List<Store> opening(Store dto) { return sqlSession.selectList(namespace + ".opening", dto); }
    
    
    public int sDelete(StoreVo vo) { return sqlSession.delete(namespace + ".sDelete", vo); }
    public int rtDelete(StoreVo vo) { return sqlSession.delete(namespace + ".rtDelete", vo); }
    public int uelete(Store dto) { return sqlSession.update(namespace + ".uelete", dto); }
    
    public int insert(Store dto) { return sqlSession.insert(namespace + ".insert", dto); }
    public int update(Store dto) { return sqlSession.update(namespace + ".update", dto); }
    public int runningInsert(Store dto) { return sqlSession.insert(namespace + ".runningInsert", dto); }
    public int runningUpdate(Store dto) { return sqlSession.update(namespace + ".runningUpdate", dto); }

    /* image upload s */
    public int insertUploaded(Store dto) { return sqlSession.insert(namespace + ".insertUploaded", dto); }
    /* image upload e */
    
    /* image select */
    public List<Store> selectImg(StoreVo vo) { return sqlSession.selectList(namespace + ".selectImg", vo); }
    
}
