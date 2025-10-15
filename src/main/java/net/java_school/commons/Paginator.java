package net.java_school.commons;

public class Paginator {

	public PagingNumbers getPagingNumbers(int totalRecords, int page, int recordsPerPage, int pagesPerGroup) {
		int totalPages = totalRecords / recordsPerPage;
		
		if (totalRecords % recordsPerPage != 0) {
			totalPages++;
		}

		int totalGroups = totalPages / pagesPerGroup;
		
		if (totalPages % pagesPerGroup != 0) {
			totalGroups++;
		}

		int group = page / pagesPerGroup;
		if (page % pagesPerGroup != 0) {
			group++;
		}

		int first = (group - 1) * pagesPerGroup + 1;
		int last = group * pagesPerGroup;

		int firstMinusOne = 0;
		if (group > 1) {
			firstMinusOne = first - 1;
		}

		int lastPlusOne = 0;
		if (group < totalGroups) {
			lastPlusOne = last + 1;
		}
		if (group >= totalGroups) {
			last = totalPages;
		}

		int listItemNo = totalRecords - (page - 1) * recordsPerPage;

		PagingNumbers numbers = new PagingNumbers();

		numbers.setTotalPages(totalPages);
		numbers.setFirst(first);
		numbers.setLast(last);
		numbers.setFirstMinusOne(firstMinusOne);
		numbers.setLastPlusOne(lastPlusOne);
		numbers.setListItemNo(listItemNo);

		return numbers;
	}
}