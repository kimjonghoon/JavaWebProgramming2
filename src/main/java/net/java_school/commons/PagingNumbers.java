package net.java_school.commons;

public class PagingNumbers {

	private int totalPages;
	private int first;
	private int last;
	private int firstMinusOne;
	private int lastPlusOne;
	private int listItemNo;
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public int getFirstMinusOne() {
		return firstMinusOne;
	}
	public void setFirstMinusOne(int firstMinusOne) {
		this.firstMinusOne = firstMinusOne;
	}
	public int getLastPlusOne() {
		return lastPlusOne;
	}
	public void setLastPlusOne(int lastPlusOne) {
		this.lastPlusOne = lastPlusOne;
	}
	public int getListItemNo() {
		return listItemNo;
	}
	public void setListItemNo(int listItemNo) {
		this.listItemNo = listItemNo;
	}
}