package com.tasteZip.infra.modules.findWay;

import java.util.List;

public interface FindWayService {
	
	 public List<FindWay> selectList(FindWayVo vo) throws Exception;
	
}
