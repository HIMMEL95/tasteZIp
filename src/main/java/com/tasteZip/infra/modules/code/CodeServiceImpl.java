package com.tasteZip.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasteZip.infra.modules.code.Code;

@Service
public class CodeServiceImpl {
    
    @Autowired
    CodeDao dao;
    
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
