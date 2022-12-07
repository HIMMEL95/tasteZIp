package com.tasteZip.infra.modules.findWay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FindWayServiceImpl implements FindWayService{
	
@Autowired
FindWayDao dao;

    // main
	@Override
    public List<FindWay> selectList(FindWayVo vo) throws Exception {
        return dao.selectList(vo);
    }
	
	@Override
	public List<FindWay> selectList(FindWay dto) throws Exception {
		return dao.selectList(dto);
	}
	
    
    @Override
    public FindWay selectOne(FindWayVo vo) throws Exception {
        return dao.selectOne(vo);
    }
   
    @Override
    public FindWay selectOne(FindWay dto) throws Exception {
    	return dao.selectOne(dto);
    }
}
