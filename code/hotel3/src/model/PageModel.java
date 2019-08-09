package model;
import java.util.ArrayList;
public class PageModel {
	ArrayList rList;
	int currentPage,pageSize,rows,totalPages;
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	@SuppressWarnings("rawtypes")
	public ArrayList getRList() {
		return rList;
	}
	@SuppressWarnings("rawtypes")
	public void setRList(ArrayList rList) {
		this.rList = rList;
	}
}
