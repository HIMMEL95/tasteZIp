package com.tasteZip.infra.modules.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDao dao;
	
	@Override
	public List<Mypage> bucketList(MypageVo vo) throws Exception {
		return dao.bucketList(vo);
	}
}
