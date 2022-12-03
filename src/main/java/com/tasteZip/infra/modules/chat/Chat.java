package com.tasteZip.infra.modules.chat;
//본인에게 맞는 package로 변경하도록 합니다.

public class Chat {
	
	private Integer chatSeq;
	private Integer chatDelNy;
	private Integer cuMember;
	private String chatCreateDate;
	
	//채팅 맴버 정보 추출을 위한 필드
	//아래 필드도 본인의 DB테이블에 맞게 변경해주세요
	private Integer ifmmSeq;       //유저 시퀀스
	private String ifmmId;   //유저 이름 or 닉네임
	private String path;       //프로필 이미지 경로
	private String uuidName;   //프로필 이미지 파일 이름
	private String shValue;
	
	public Integer getChatSeq() {
		return chatSeq;
	}
	public void setChatSeq(Integer chatSeq) {
		this.chatSeq = chatSeq;
	}
	public Integer getChatDelNy() {
		return chatDelNy;
	}
	public void setChatDelNy(Integer chatDelNy) {
		this.chatDelNy = chatDelNy;
	}
	public Integer getCuMember() {
		return cuMember;
	}
	public void setCuMember(Integer cuMember) {
		this.cuMember = cuMember;
	}
	public String getChatCreateDate() {
		return chatCreateDate;
	}
	public void setChatCreateDate(String chatCreateDate) {
		this.chatCreateDate = chatCreateDate;
	}
	public Integer getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(Integer ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getIfmmId() {
		return ifmmId;
	}
	public void setIfmmId(String ifmmId) {
		this.ifmmId = ifmmId;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getUuidName() {
		return uuidName;
	}
	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
}
