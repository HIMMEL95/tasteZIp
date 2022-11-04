package com.tasteZip.infra.modules.codeGroup;

import java.util.List;

public interface CodeGroupService {
	
	
	// selectList
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception;
	
	// selectOne Count
	public int selectOneCount(CodeGroupVo vo) throws Exception;
	

}
