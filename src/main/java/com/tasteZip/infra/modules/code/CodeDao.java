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

    
    // list
    public List<Code> selectList(CodeVo vo){ 
    	return sqlSession.selectList(namespace + ".selectList", vo); 
    	}
    
    
    //selectone
    public Code selectOne(CodeVo vo) {
		Code result = sqlSession.selectOne(namespace + ".selectOne", vo);
		System.out.println("dao result: " + result);
		return result;
	}
    
    
    //selectone COUNT
    public int selectOneCount(CodeVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo);}
    
    
    // insert
    public int insert(Code dto) {
		int result = sqlSession.insert(namespace + ".insert", dto);
		System.out.println("dao insert: " + result);
		return result;
	}
    
    
    //update
    public int update(Code dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
    
    
    //uelete Form
    public int uelete(Code dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	
	
    // uele List 
    public int ueleteList(String ifccSeq) {
		return sqlSession.update(namespace + ".uelete", ifccSeq);
	}
    
    
    //delete
    public int delete(CodeVo vo) {
		return sqlSession.delete(namespace + ".delete", vo);
	}
}

