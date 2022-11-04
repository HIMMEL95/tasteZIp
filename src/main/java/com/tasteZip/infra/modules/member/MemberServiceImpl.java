package com.tasteZip.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
