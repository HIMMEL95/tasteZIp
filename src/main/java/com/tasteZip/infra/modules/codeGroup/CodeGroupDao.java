package com.tasteZip.infra.modules.codeGroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CodeGroupDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.tasteZip.infra.modules.codeGroup.CodeGroupMapper";
	
	// selectList
	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }

	// selectOne Count
	public int selectOneCount(CodeGroupVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo);}
	
	//insert
	public int insert(CodeGroup dto) {
		int result = sqlSession.insert(namespace + ".insert", dto);
		System.out.println("dao insert: " + result);
		return result;
	}
	
	public CodeGroup selectOne(CodeGroupVo vo) {
		CodeGroup result = sqlSession.selectOne(namespace + ".selectOne", vo);
		System.out.println("dao result: " + result);
		return result;
	}
	
	public int update(CodeGroup dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	
	public int uelete(CodeGroup dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	
	//list uelete
	public int ueleteList(String ifcgSeq) {
		return sqlSession.update(namespace + ".ueleteList", ifcgSeq);
	}
	
	
	public int delete(CodeGroupVo vo) {
		return sqlSession.delete(namespace + ".delete", vo);
	}
	
}
