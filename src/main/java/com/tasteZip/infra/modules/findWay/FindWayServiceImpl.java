package com.tasteZip.infra.modules.findWay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class FindWayServiceImpl {
	
	
	@Autowired
    FindWayDao dao;

    // main
    public List<FindWay> selectList(FindWayVo vo) throws Exception {
        return dao.selectList(vo);
    }

}
