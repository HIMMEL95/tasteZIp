package com.tasteZip.infra.modules.menu;

import java.util.List;

public interface MenuService {

    public List<Menu> selectList(MenuVo vo) throws Exception;
    public List<Menu> setDiv(MenuVo vo) throws Exception;
    public int selectOneCount(MenuVo vo) throws Exception;
}
