package com.tasteZip.infra.modules.member;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface MemberService {

    public List<Member> selectList(MemberVo vo) throws Exception;
    public int selectOneCount(MemberVo vo) throws Exception;
    
    // login s
    public Member loginCheck(Member dto) throws Exception;
    public Member snsLoginCheck(Member dto) throws Exception;
    public Member xdminLoginCheck(Member dto) throws Exception;
    // login e
    
    /* insert & update */
    public int memberInst(Member dto) throws Exception;
    public int memberUpdt(Member dto) throws Exception;
    public int mypageUpdt(Member dto) throws Exception;
    
    /* code list */
    public List<Member> codeGender(Member dto) throws Exception;
    public List<Member> codeRadio(Member dto) throws Exception;
    
    // selectone
    public Member selectOne(MemberVo vo) throws Exception;
    
    /* image upload s */
    //  article img
    public void uploadFiles(MultipartFile[] multipartFiles, Member dto, String tableName, int type) throws Exception;
    public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Member dto, String tableName) throws Exception;
    public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Member dto, String tableName) throws Exception;
    /* image upload e */
}
