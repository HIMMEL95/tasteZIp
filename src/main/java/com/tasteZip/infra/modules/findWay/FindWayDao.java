package com.tasteZip.infra.modules.findWay;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FindWayDao {
	
	@Inject
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	private static String namespace = "com.tasteZip.infra.modules.findWay.FindWayMapper";
	    
    public List<FindWay> selectList(FindWayVo vo) { return sqlSession.selectList(namespace + ".selectList", vo); }
    public List<FindWay> selectList(FindWay dto) { return sqlSession.selectList(namespace + ".selectList", dto); }
    public FindWay selectOne(FindWayVo vo) { return sqlSession.selectOne(namespace + ".selectOne", vo); }
    public FindWay selectOne(FindWay dto) { return sqlSession.selectOne(namespace + ".selectOne", dto); }


}
