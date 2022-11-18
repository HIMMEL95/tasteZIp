package com.tasteZip.infra.common.constants;

public final class Constants {

//	for paging
	public static final int ROW_NUM_TO_SHOW = 10;
	public static final int PAGE_NUM_TO_SHOW = 5;

//	for paging2
	public static final int ROW_NUM_TO_SHOW2 = 5;
	public static final int PAGE_NUM_TO_SHOW2 = 5;
	
// insert 또는 update 후 페이지 전환 타입: 1:from 2:list
	public static final int INSERT_AFTER_TYPE = 1;
	public static final int UPDATE_AFTER_TYPE = 1;
	
// CheckLoginSessionInterception 
	public static final String URL_LOGINFORM = "/login";
	
// login time
	public static final int SESSION_MINUTE = 30;
	
	public static final String URL_USERLOGINFORM = "/login";
	public static final String URL_ADDINLOGINFORM = "/xdminLogin";
	
	public static final String DATETIME_FORMAT_BASIC = "yyyy-MM-dd HH:mm:ss";
	public static final String TIME_FORMAT_BASIC = "HH:mm:ss";
	
	public static final String UPLOAD_PATH_PREFIX_EXTERNAL = "D://factory/ws_sts_4151/tasteZip/src/main/webapp";
	public static final String UPLOAD_PATH_PREFIX_SERVER= "/factory/workspace/tasteZip/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX = "D://factory/ws_sts_4151/tasteZip/src/main/webapp/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX_MAC = "/Users/haneullee/Documents/factory/tasteZip/src/main/webapp/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX_LINUX = "/home/himmel/Documents/factory/tasteZip/src/main/webapp/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX_FOR_VIEW = "/resources/uploaded";
	
	public static final int COOKIE_MAXAGE = 60 * 60 * 24 * 30; //초 * 분 * 시간 * 일 : 30day
	  public static final String COOKIE_DOMAIN = "";
	  public static final String COOKIE_PATH = "/";
	  public static final String COOKIE_NAME_SEQ = "cookieSeq";
}
