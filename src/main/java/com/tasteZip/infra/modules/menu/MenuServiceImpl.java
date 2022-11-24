package com.tasteZip.infra.modules.menu;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tasteZip.infra.common.constants.Constants;
import com.tasteZip.infra.common.util.UtilDateTime;
import com.tasteZip.infra.common.util.UtilSecurity;

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
 

    // ----------------------------    
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
	public Menu selectMenu(MenuVo vo) throws Exception {
    	return dao.selectMenu(vo);
	}

	@Override
    public List<Menu> setDiv(MenuVo vo) throws Exception {
        return dao.setDiv(vo);
    }

	@Override
	public int insert(Menu dto) throws Exception {
		 try {
	            dao.insert(dto);
	            uploadFiles(dto.getMenuImage(), dto, "menuUploaded", 0);
	            return 1;
	        } catch (Exception e) {
	            throw new Exception();
	        }
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
	
	 /* image upload s */
    @Override
    public void uploadFiles(MultipartFile[] multipartFiles, Menu dto, String tableName, int type) throws Exception {
        
        for(int j=0; j < multipartFiles.length; j++) {
                
            if(!multipartFiles[j].isEmpty()) {
            
                String className = dto.getClass().getSimpleName().toString().toLowerCase();     
                String fileName = multipartFiles[j].getOriginalFilename();
                String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
                String uuid = UUID.randomUUID().toString();
                String uuidFileName = uuid + "." + ext;
                String pathModule = className;
                String nowString = UtilDateTime.nowString();
                String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
                String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
                //String path = Constants.UPLOAD_PATH_PREFIX_LINUX + "/" + pathModule + "/" + pathDate + "/";
                //String path = Constants.UPLOAD_PATH_PREFIX_MAC + "/" + pathModule + "/" + pathDate + "/";
                //String path = Constants.UPLOAD_PATH_PREFIX_SERVER + "/" + pathModule + "/" + pathDate + "/";

                String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
                
                System.out.println("path: " + path);
                
                File uploadPath = new File(path);
                
                if (!uploadPath.exists()) {
                    uploadPath.mkdir();
                } else {
                    // by pass
                }
                  
                multipartFiles[j].transferTo(new File(path + uuidFileName));
                
                dto.setPath(pathForView);
                dto.setOriginalName(fileName);
                dto.setUuidName(uuidFileName);
                dto.setExt(ext);
                dto.setSize(multipartFiles[j].getSize());
                
                dto.setTableName(tableName);
                dto.setType(type);
                dto.setDefaultNy(j == 0 ? 1 : 0);
                dto.setSort(j + 1);
                dto.setPseq(dto.getIfmnSeq());

                dao.insertUploaded(dto);
                j++;
            }
        }
    }
    
    @Override
    public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Menu dto, String tableName) throws Exception{
        
        for (int i=0; i<deleteSeq.length; i++) {
            File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
            boolean result = file.delete();
            
            if(result) {
                dto.setSeq(deleteSeq[i]);
                dto.setTableName(tableName);
                dao.deleteUploaded(dto);
            }
        }
    }
    
    @Override
    public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Menu dto, String tableName) throws Exception{
        
        for (int i=0; i<deleteSeq.length; i++) {
//          File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
//          boolean result = file.delete();
            
//          if(result) {
                dto.setSeq(deleteSeq[i]);
                dto.setTableName(tableName);
                dao.ueleteUploaded(dto);
//          }
        }
    }
    /* image upload e */

    @Override
	public Menu selectImg(MenuVo vo) throws Exception{
    	return dao.selectImg(vo);
	}
    
    

}
