package com.tasteZip.infra.modules.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService {
    
    @Autowired
    StoreDao dao;

    @Override
    public List<Store> selectList(StoreVo vo) throws Exception {
        return dao.selectList(vo);
    }

    @Override
    public int selectOneCount(StoreVo vo) throws Exception {
        return dao.selectOneCount(vo);
    }
    
}
