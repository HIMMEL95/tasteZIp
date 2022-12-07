package com.tasteZip.infra.modules.findWay;

import java.util.List;

public interface FindWayService {
	
	 public List<FindWay> selectList(FindWayVo vo) throws Exception;
	 public List<FindWay> selectList(FindWay dto) throws Exception;
	 public FindWay selectOne(FindWayVo vo) throws Exception;
	 public FindWay selectOne(FindWay dto) throws Exception;
}
