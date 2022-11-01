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
}
