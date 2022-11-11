package com.tasteZip.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService{
    
    @Autowired
    CodeDao dao;
    
    
    // selectList
    @Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		return dao.selectList(vo);
	}
    
    
    // selectOne
    @Override
	public Code selectOne(CodeVo vo) throws Exception{
		Code result = dao.selectOne(vo);
		System.out.println("service result: " + result);
		return result;
	}

    // selectOne Count
    @Override
	public int selectOneCount(CodeVo vo) throws Exception {
		
		return dao.selectOneCount(vo);
	}
	
	
	// insert
    @Override
	public int insert(Code dto) throws Exception{
		int result = dao.insert(dto);
		System.out.println("service result: " + result);
		return result;
	}
	
	// update
    @Override
	public int update(Code dto) throws Exception{
		return dao.update(dto);
	}
	
	
	// uele form
    @Override
	public int uelete(Code dto) throws Exception{
		return dao.uelete(dto);
	}
	
	
	// uele List
    @Override
	public int ueleteList(String ifccSeq) throws Exception{
		return dao.ueleteList(ifccSeq);
	}
	
	
	// delete
    @Override	
	public int delete(CodeVo vo) throws Exception{
		return dao.delete(vo);
	}
	
    @PostConstruct
    public void selectListCachedCodeArrayList() throws Exception {
        List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
//      codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
        Code.cachedCodeArrayList.clear(); 
        Code.cachedCodeArrayList.addAll(codeListFromDb);
        System.out.println("cachedCodeArrayList: " + Code.cachedCodeArrayList.size() + " chached !");
    }
    
    public static List<Code> selectListCachedCode(String ccgSeq) throws Exception {
        List<Code> rt = new ArrayList<Code>();
        for (Code codeRow : Code.cachedCodeArrayList) {
            if (codeRow.getIfcgSeq().equals(ccgSeq)) {
                rt.add(codeRow);
            } else {
                // by pass
            }
        }
        return rt;
    }
    
    public static String selectOneCachedCode(int code) throws Exception {
        String rt = "";
        for(Code codeRow : Code.cachedCodeArrayList) {
            if (codeRow.getIfccSeq().equals(Integer.toString(code))) {
                rt = codeRow.getIfccName();
            } else {
                // by pass
            }
        }
        return rt;
    }
    
}
