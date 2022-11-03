package com.tasteZip.infra.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao {

    @Inject
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
    private static String namespace = "com.tasteZip.infra.modules.code.CodeMapper";
    
    /* for cache */
    public List<Code> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList", null); }
}
