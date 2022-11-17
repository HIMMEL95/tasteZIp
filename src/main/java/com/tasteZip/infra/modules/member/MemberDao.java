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
    public int selectOneCount(MemberVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }

    // login
    public Member loginCheck(Member dto) { return sqlSession.selectOne(namespace + ".loginCheck", dto); }
    public Member snsLoginCheck(Member dto) { return sqlSession.selectOne(namespace + ".snsLoginCheck", dto); }
    public Member xdminLoginCheck(Member dto) { return sqlSession.selectOne(namespace + "xdminLoginCheck", dto); }

    /* insert & update */
    public int memberInst(Member dto) { return sqlSession.insert(namespace + ".userInsert", dto); }
    public int memberUpdt(Member dto) { return sqlSession.update(namespace + ".userUpdate", dto); }
    
    /* code list */
    public List<Member> codeGender(Member dto) { return sqlSession.selectList(namespace + ".codeGender", dto); }
    public List<Member> codeRadio(Member dto) { return sqlSession.selectList(namespace + ".codeRadio", dto); }

}
