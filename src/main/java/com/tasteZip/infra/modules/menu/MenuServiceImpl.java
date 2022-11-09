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
	public Menu selectOne(MenuVo vo) throws Exception {
    	return dao.selectOne(vo);
	}

	@Override
    public List<Menu> setDiv(MenuVo vo) throws Exception {
        return dao.setDiv(vo);
    }

	@Override
	public int insert(Menu dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(Menu dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(Menu dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(MenuVo vo) throws Exception {
		return dao.delete(vo);
	}
	

}
