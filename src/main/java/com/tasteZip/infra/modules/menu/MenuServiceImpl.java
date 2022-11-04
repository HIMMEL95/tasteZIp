package com.tasteZip.infra.modules.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {
    
    @Autowired
    MenuDao dao;

    @Override
    public List<Menu> selectList(MenuVo vo) throws Exception {
        return dao.selectList(vo);
    }

    @Override
    public int selectOneCount(MenuVo vo) throws Exception {
    	return dao.selectOneCount(vo);
    }
 
    @Override
    public List<Menu> selectList2(MenuVo vo) throws Exception {
    	return dao.selectList2(vo);
    }
    
    @Override
    public int selectOneCount2(MenuVo vo) throws Exception {
    	return dao.selectOneCount2(vo);
    }
    
    @Override
    public List<Menu> setDiv(MenuVo vo) throws Exception {
        return dao.setDiv(vo);
    }

}
