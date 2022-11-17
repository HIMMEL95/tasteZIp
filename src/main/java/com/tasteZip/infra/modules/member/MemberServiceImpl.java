package com.tasteZip.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasteZip.infra.common.util.UtilSecurity;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberDao dao;
    
    @Override
    public List<Member> selectList(MemberVo vo) throws Exception {
        return dao.selecList(vo);
    }

    @Override
    public int selectOneCount(MemberVo vo) throws Exception {
        return dao.selectOneCount(vo);
    }

    /* login s */
    @Override
    public Member loginCheck(Member dto) throws Exception {
        return dao.loginCheck(dto);
    }

    @Override
    public Member snsLoginCheck(Member dto) throws Exception {
        return dao.snsLoginCheck(dto);
    }

    @Override
    public Member xdminLoginCheck(Member dto) throws Exception {
        return dao.xdminLoginCheck(dto);
    }
    /* login e */

    /* insert & update */
    @Override
    public int memberInst(Member dto) throws Exception {
        dto.setIfmmPwd(UtilSecurity.encryptSha256(dto.getIfmmPwd()));
        return dao.memberInst(dto);
    }

    @Override
    public int memberUpdt(Member dto) throws Exception {
        return dao.memberUpdt(dto);
    }

    /* code list */
    @Override
    public List<Member> codeGender(Member dto) throws Exception {
        return dao.codeGender(dto);
    }

    @Override
    public List<Member> codeRadio(Member dto) throws Exception {
        return dao.codeRadio(dto);
    }
}
