package com.tasteZip.infra.modules.store;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.tasteZip.infra.common.constants.Constants;
import com.tasteZip.infra.common.util.UtilDateTime;

@Service
public class StoreServiceImpl implements StoreService {
    
    @Autowired
    StoreDao dao;

    // main
    @Override
    public List<Store> selectList(StoreVo vo) throws Exception {
        return dao.selectList(vo);
    }
    
    @Override
    public List<Store> storeList(StoreVo vo) throws Exception {
        return dao.storeList(vo);
    }
    
    @Override
    public List<Store> menuList(StoreVo vo) throws Exception {
        return dao.menuList(vo);
    }

    @Override
    public int selectOneCount(StoreVo vo) throws Exception {
        return dao.selectOneCount(vo);
    }
    
    @Override
    public Store storeMain(StoreVo vo) throws Exception {
        return dao.storeMain(vo);
    }

    // xdmin
    @Override
    public List<Store> xdminSelectList(StoreVo vo) throws Exception {
        return dao.xdminSelectList(vo);
    }

    @Override
    public int xdminSelectOneCount(StoreVo vo) throws Exception {
        return dao.xdminSelectOneCount(vo);
    }

    @Override
    public Store xdminSelectOne(StoreVo vo) throws Exception {
        return dao.xdminSelectOne(vo);
    }
    
    @Override
    public List<Store> openingList(StoreVo vo) throws Exception {
        return dao.openingList(vo);
    }
    
    @Override
    public List<Store> day(Store dto) throws Exception {
        return dao.day(dto);
    }

    @Override
    public List<Store> opening(Store dto) throws Exception {
        return dao.opening(dto);
    }

    @Override
    public int sDelete(StoreVo vo) throws Exception {
        return dao.sDelete(vo);
    }

    @Override
    public int rtDelete(StoreVo vo) throws Exception {
        return dao.rtDelete(vo);
    }

    @Override
    public int uelete(Store dto) throws Exception {
        return dao.uelete(dto);
    }

	/*
	 * @Override public int insert(Store dto) throws Exception { try {
	 * dao.insert(dto); uploadFiles(dto.getStoreImage(), dto, "storeUploaded", 0);
	 * return 1; } catch (Exception e) { throw new Exception(); } }
	 */
    
    @Override
	public int insert(Store dto) throws Exception {
		return dao.insert(dto);
	}

    @Override
    public int update(Store dto) throws Exception {
        return dao.update(dto);
    }

    @Override
    public int runningInsert(Store dto) throws Exception {
        return dao.runningInsert(dto);
    }

    @Override
    public int runningUpdate(Store dto) throws Exception {
        return dao.runningUpdate(dto);
    }
    
    public void delete(StoreVo vo) throws Exception {
        rtDelete(vo);
        sDelete(vo);
    }
    
    public void inst(Store dto) throws Exception {
        
        insert(dto);
        
        for (int i=0; i<dto.getIfrtOpeningArray().length; i++) {
            int ifrtDay = dto.getIfrtDayArray()[i];
            String ifrtStartTime = dto.getIfrtStartTimeArray()[i].toString();
            String ifrtEndTime = dto.getIfrtEndTimeArray()[i].toString();
            int ifrtOpening = dto.getIfrtOpeningArray()[i];
            
            dto.setIfrtDay(ifrtDay); 
            dto.setIfrtStartTime(ifrtStartTime);
            dto.setIfrtEndTime(ifrtEndTime);
            dto.setIfrtOpening(ifrtOpening);
            runningInsert(dto);
        }
    }
    
    public void updt(Store dto) throws Exception {
        
        update(dto);
        for (int i=0; i<dto.getIfrtOpeningArray().length; i++) {
            int ifrtDay = dto.getIfrtDayArray()[i];
            String ifrtStartTime = dto.getIfrtStartTimeArray()[i].toString();
            String ifrtEndTime = dto.getIfrtEndTimeArray()[i].toString();
            int ifrtOpening = dto.getIfrtOpeningArray()[i];
            
            dto.setIfrtDay(ifrtDay); 
            dto.setIfrtStartTime(ifrtStartTime);
            dto.setIfrtEndTime(ifrtEndTime);
            dto.setIfrtOpening(ifrtOpening);
            runningUpdate(dto);
        }
    }
    
    /* image upload s */
    @Override
    public void uploadFiles(MultipartFile[] multipartFiles, Store dto, String tableName, int type) throws Exception {
        
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
                dto.setPseq(dto.getIfstSeq());

                dao.insertUploaded(dto);
                j++;
            }
        }
    }
    
    @Override
    public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Store dto, String tableName) throws Exception{
        
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
    public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Store dto, String tableName) throws Exception{
        
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
}
