package com.tasteZip.infra.common.base;

import com.tasteZip.infra.common.constants.Constants;

public class BaseVo {
	
//	paging	
	private int thisPage = 1;
	private int rowNumToShow = Constants.ROW_NUM_TO_SHOW;
	private int pageNumToShow = Constants.PAGE_NUM_TO_SHOW;
	
	private int totalRows;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	private int startRnumForMysql = 0;

	
// -------------------------
	private int thisPage2 = 1;
	private int rowNumToShow2 = Constants.ROW_NUM_TO_SHOW2;
	private int pageNumToShow2 = Constants.PAGE_NUM_TO_SHOW2;
	
	private int totalRows2;
	private int totalPages2;
	private int startPage2;
	private int endPage2;
	
	private int startRnumForMysql2 = 0;

	
	public void setParamsPaging(int totalRows) {
		setTotalRows(totalRows);
		
		if (getTotalRows() == 0) {
			setTotalPages(1);
		} else {
			setTotalPages(getTotalRows() / getRowNumToShow()); 
			/* System.out.println("test : " + getTotalPages()); */
		}
		
		if (getTotalRows() % getRowNumToShow() > 0) {
			setTotalPages(getTotalPages() + 1);
		}
		
		if (getTotalPages() < getThisPage()) {
			setThisPage(getTotalPages());
		}
		
		setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);
		setEndPage(getStartPage() + getPageNumToShow() - 1);
		
		if (getEndPage() > getTotalPages()) {
			setEndPage(getTotalPages());
		}
		
		if (thisPage == 1) {
			setStartRnumForMysql(0);
		} else {
			setStartRnumForMysql((getRowNumToShow() * (getThisPage()-1)));
		}
	}
	
	public void setParamsPaging2(int totalRows2) {
		setTotalRows2(totalRows2);
		
		if (getTotalRows2() == 0) {
			setTotalPages2(1);
		} else {
			setTotalPages2(getTotalRows2() / getRowNumToShow2()); 
			/* System.out.println("test : " + getTotalPages()); */
		}
		
		if (getTotalRows2() % getRowNumToShow2() > 0) {
			setTotalPages2(getTotalPages2() + 1);
		}
		
		if (getTotalPages2() < getThisPage2()) {
			setThisPage2(getTotalPages2());
		}
		
		setStartPage2(((getThisPage2() - 1) / getPageNumToShow2()) * getPageNumToShow2() + 1);
		setEndPage2(getStartPage2() + getPageNumToShow2() - 1);
		
		if (getEndPage2() > getTotalPages2()) {
			setEndPage2(getTotalPages2());
		}
		
		if (thisPage2 == 1) {
			setStartRnumForMysql2(0);
		} else {
			setStartRnumForMysql2((getRowNumToShow2() * (getThisPage2()-1)));
		}
	}
	
	
	
	public int getStartRnumForMysql2() {
		return startRnumForMysql2;
	}
	public void setStartRnumForMysql2(int startRnumForMysql2) {
		this.startRnumForMysql2 = startRnumForMysql2;
	}
	public int getThisPage2() {
		return thisPage2;
	}
	public void setThisPage2(int thisPage2) {
		this.thisPage2 = thisPage2;
	}
	public int getPageNumToShow2() {
		return pageNumToShow2;
	}
	public void setPageNumToShow2(int pageNumToShow2) {
		this.pageNumToShow2 = pageNumToShow2;
	}
	public int getRowNumToShow2() {
		return rowNumToShow2;
	}
	public void setRowNumToShow2(int rowNumToShow2) {
		this.rowNumToShow2 = rowNumToShow2;
	}
	public int getTotalRows2() {
		return totalRows2;
	}

	public void setTotalRows2(int totalRows2) {
		this.totalRows2 = totalRows2;
	}

	public int getTotalPages2() {
		return totalPages2;
	}

	public void setTotalPages2(int totalPages2) {
		this.totalPages2 = totalPages2;
	}

	public int getStartPage2() {
		return startPage2;
	}

	public void setStartPage2(int startPage2) {
		this.startPage2 = startPage2;
	}

	public int getEndPage2() {
		return endPage2;
	}

	public void setEndPage2(int endPage2) {
		this.endPage2 = endPage2;
	}

	// -------------------
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public int getRowNumToShow() {
		return rowNumToShow;
	}
	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}
	public int getPageNumToShow() {
		return pageNumToShow;
	}
	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}
	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}
}
