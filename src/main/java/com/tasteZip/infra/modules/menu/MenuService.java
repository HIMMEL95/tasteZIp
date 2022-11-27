package com.tasteZip.infra.modules.menu;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface MenuService {

    public List<Menu> selectList(MenuVo vo) throws Exception;
    public int selectOneCount(MenuVo vo) throws Exception;
    
    // ------------------
    public List<Menu> selectList2(MenuVo vo) throws Exception;
    public int selectOneCount2(MenuVo vo) throws Exception;
    public Menu selectOne(MenuVo vo) throws Exception;
    public Menu selectMenu(MenuVo vo) throws Exception;
    
    public List<Menu> setDiv(MenuVo vo) throws Exception;
    
    public int insert(Menu dto) throws Exception;
	public int update(Menu dto) throws Exception;
	public int uelete(Menu dto) throws Exception;
	public int delete(MenuVo vo) throws Exception;
	
	/* image upload s */
    //  article img
    public void uploadFiles(MultipartFile[] multipartFiles, Menu dto, String tableName, int type) throws Exception;
    public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Menu dto, String tableName) throws Exception;
    public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Menu dto, String tableName) throws Exception;
    /* image upload e */
    
    public Menu selectImg(MenuVo vo) throws Exception;
    
    /* 장바구니 용 s */
    public List<Menu> selectCart(MenuVo vo) throws Exception;
    /* 장바구니 용 e */

}
