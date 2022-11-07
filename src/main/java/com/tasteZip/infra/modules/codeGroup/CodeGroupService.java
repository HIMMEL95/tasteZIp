package com.tasteZip.infra.modules.codeGroup;

import java.util.List;

public interface CodeGroupService {
	
	
	// selectList
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception;
	
	// selectOne Count
	public int selectOneCount(CodeGroupVo vo) throws Exception;
	
	// selectOne
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception;
	
	//insert
	public int insert(CodeGroup dto) throws Exception;
	
	//update
	public int update(CodeGroup dto) throws Exception;
	
	// uele
	public int uelete(CodeGroup dto) throws Exception;
	
	// list uelete
	public int ueleteList(String seq) throws Exception;
	
	//delete
	public int delete(CodeGroupVo vo) throws Exception;
	

}
