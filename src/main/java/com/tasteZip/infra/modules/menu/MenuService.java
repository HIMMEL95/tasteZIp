package com.tasteZip.infra.modules.menu;

import java.util.List;

public interface MenuService {

    public List<Menu> selectList(MenuVo vo) throws Exception;
    public int selectOneCount(MenuVo vo) throws Exception;
    
    // ------------------
    public List<Menu> selectList2(MenuVo vo) throws Exception;
    public int selectOneCount2(MenuVo vo) throws Exception;
    public Menu selectOne(MenuVo vo) throws Exception;
    
    public List<Menu> setDiv(MenuVo vo) throws Exception;
    
    public int insert(Menu dto) throws Exception;
	public int update(Menu dto) throws Exception;
	public int uelete(Menu dto) throws Exception;
	public int delete(MenuVo vo) throws Exception;
    
}
