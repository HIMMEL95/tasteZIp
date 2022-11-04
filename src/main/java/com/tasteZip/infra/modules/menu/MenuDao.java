package com.tasteZip.infra.modules.menu;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDao {

    @Inject
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
    
    private static String namespace = "com.tasteZip.infra.modules.menu.MenuMapper";
    
    public List<Menu> selectList(MenuVo vo) { return sqlSession.selectList(namespace + ".selectList", vo); }
    public int selectOneCount(MenuVo vo) { return sqlSession.selectOne(namespace +".selectOneCount", vo); }
    
    public List<Menu> selectList2(MenuVo vo) { return sqlSession.selectList(namespace + ".selectList2", vo); }
    public int selectOneCount2(MenuVo vo) { return sqlSession.selectOne(namespace +".selectOneCount2", vo); }
    
    public List<Menu> setDiv(MenuVo vo) {return sqlSession.selectList(namespace + ".setDiv", vo); }
}
