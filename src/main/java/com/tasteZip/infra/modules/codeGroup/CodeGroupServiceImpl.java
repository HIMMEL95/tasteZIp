package com.tasteZip.infra.modules.codeGroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeGroupServiceImpl implements CodeGroupService{
	
	@Autowired
	CodeGroupDao dao;
	
	
	// select List
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		return dao.selectList(vo);
	}

	
	// selectOne Count
	@Override
	public int selectOneCount(CodeGroupVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	
	// selelctOne
	@Override
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception{
		CodeGroup result = dao.selectOne(vo);
		System.out.println("service result: " + result);
		return result;
	}
	
	
	// insert
	@Override
	public int insert(CodeGroup dto) throws Exception{
		int result = dao.insert(dto);
		System.out.println("service result: " + result);
		return result;
	}
	
	
	//update
	@Override
	public int update(CodeGroup dto) throws Exception{
		return dao.update(dto);
	}
	
	
	//uelete
	@Override
	public int uelete(CodeGroup dto) throws Exception{
		return dao.uelete(dto);
	}
	
	
	// uelete List
	@Override
	public int ueleteList(String seq) throws Exception {
		return dao.ueleteList(seq);
	}
	
	
	// delete
	@Override
	public int delete(CodeGroupVo vo) throws Exception{
		return dao.delete(vo);
	}
	

}


