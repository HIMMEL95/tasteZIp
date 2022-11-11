package com.tasteZip.infra.modules.code;

import java.util.List;

public interface CodeService {
	
	// list
	public List<Code> selectList(CodeVo vo) throws Exception;
	
	
	//selectOne
	public Code selectOne(CodeVo vo) throws Exception;	
	public int selectOneCount(CodeVo vo) throws Exception;

	
	//insert
	public int insert(Code dto) throws Exception;

	
	//update
	public int update(Code dto) throws Exception;
	
	
	//uelteform
	public int uelete(Code dto) throws Exception;
	
	//uele list
	public int ueleteList(String ifccSeq) throws Exception;
	
	// dele
	public int delete(CodeVo vo) throws Exception;
}
