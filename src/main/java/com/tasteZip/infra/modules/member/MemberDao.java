package com.tasteZip.infra.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

    @Inject
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
    
    private static String namespace = "com.tasteZip.infra.modules.member.MemberMapper";
    
    //ifmmMember
    public List<Member> selecList(MemberVo vo) { return sqlSession.selectList(namespace + ".selectList", vo); }
    public List<Member> selectListLimit5(MemberVo vo) { return sqlSession.selectList(namespace + ".selectListLimit5", vo); }
    public int selectOneCount(MemberVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
    public int uelete(Member dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(MemberVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
    
	// login
    public Member loginCheck(Member dto) { return sqlSession.selectOne(namespace + ".loginCheck", dto); }
    public Member snsLoginCheck(Member dto) { return sqlSession.selectOne(namespace + ".snsLoginCheck", dto); }
    public Member xdminLoginCheck(Member dto) { return sqlSession.selectOne(namespace + "xdminLoginCheck", dto); }

    /* insert & update */
    public int memberInst(Member dto) { return sqlSession.insert(namespace + ".userInsert", dto); }
    public int memberUpdt(Member dto) { return sqlSession.update(namespace + ".userUpdate", dto); }
    public int mypageUpdt(Member dto) { return sqlSession.update(namespace + ".mypageUpdt", dto); }
    
    /* code list */
    public List<Member> codeGender(Member dto) { return sqlSession.selectList(namespace + ".codeGender", dto); }
    public List<Member> codeRadio(Member dto) { return sqlSession.selectList(namespace + ".codeRadio", dto); }

	/* selectOne */
    public Member selectOne(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
    /* image select */
    public Member selectImg(MemberVo vo) { return sqlSession.selectOne(namespace + ".selectImg", vo); }
    
    /* image upload s */
    public int insertUploaded(Member dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
    public int ueleteUploaded(Member dto) { return sqlSession.insert("Base" + ".ueleteUploaded", dto); }
    public int deleteUploaded(Member dto) { return sqlSession.insert("Base" + ".deleteUploaded", dto); }
    /* image upload e */
    
    /* sns insert s */
    public int snsInst(Member dto) {return sqlSession.insert(namespace + ".snsInst", dto); }
    /* sns insert e */
    
 // 아이디 중복체크
 	public int idCheck(Member dto) {
 		return sqlSession.selectOne(namespace + ".idCheck", dto);
 	}
 	
 	/* findId & pwd */
	public Member findId(Member dto) {
	    return sqlSession.selectOne(namespace + ".findId", dto);
    }
	public int findPwd(Member dto) {
        return sqlSession.selectOne(namespace + ".findPwd", dto);
	}
    public int changePwd(Member dto) {
         return sqlSession.update(namespace + ".changePwd", dto);
    }
}
