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
    public int selectOneCount(StoreVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
    
    //xdmin 
    public List<Store> xdminSelectList(StoreVo vo) { return sqlSession.selectList(namespace + ".xdminSelectList", vo); }
    public int xdminSelectOneCount(StoreVo vo) { return sqlSession.selectOne(namespace + ".xdminSelectOneCount", vo); }
    public Store xdminSelectOne(StoreVo vo) { return sqlSession.selectOne(namespace + ".xdminSelectOne", vo); }
    
    public int delete(StoreVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
    public int uelete(Store dto) { return sqlSession.update(namespace + ".uelete", dto); }
    
    public int insert(Store dto) { return sqlSession.insert(namespace + ".insert", dto); }
    public int update(Store dto) { return sqlSession.update(namespace + ".update", dto); }
    
}
