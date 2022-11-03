package com.tasteZip.infra.modules.mypage;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.tasteZip.infra.modules.mypage.MypageMapper";
	
	public List<Mypage> bucketList(MypageVo vo){ return sqlSession.selectList(namespace + ".bucketList", vo); }
}
