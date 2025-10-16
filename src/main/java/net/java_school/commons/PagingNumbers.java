package net.java_school.commons;

public class PagingNumbers {

	private int totalPages;
	private int firstPage;
	private int lastPage;
	private int lastOfPrevGroup;
	private int firstOfNextGroup;
	private int listItemNo;
	
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getLastOfPrevGroup() {
		return lastOfPrevGroup;
	}
	public void setLastOfPrevGroup(int lastOfPrevGroup) {
		this.lastOfPrevGroup = lastOfPrevGroup;
	}
	public int getFirstOfNextGroup() {
		return firstOfNextGroup;
	}
	public void setFirstOfNextGroup(int firstOfNextGroup) {
		this.firstOfNextGroup = firstOfNextGroup;
	}
	public int getListItemNo() {
		return listItemNo;
	}
	public void setListItemNo(int listItemNo) {
		this.listItemNo = listItemNo;
	}
}