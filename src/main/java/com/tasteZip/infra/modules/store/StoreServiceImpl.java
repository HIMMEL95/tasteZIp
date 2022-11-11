package com.tasteZip.infra.modules.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public int selectOneCount(StoreVo vo) throws Exception {
        return dao.selectOneCount(vo);
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
}
