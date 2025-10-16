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

		int firstPage = (group - 1) * pagesPerGroup + 1;
		
		int lastPage = group * pagesPerGroup;

		int lastOfPrevGroup = 0;
		
		if (group > 1) {
			lastOfPrevGroup = firstPage - 1;
		}

		int firstOfNextGroup = 0;
		
		if (group < totalGroups) {
			firstOfNextGroup = lastPage + 1;
		}
		
		if (group >= totalGroups) {
			lastPage = totalPages;
		}

		int listItemNo = totalRecords - (page - 1) * recordsPerPage;

		PagingNumbers numbers = new PagingNumbers();

		numbers.setTotalPages(totalPages);
		numbers.setFirstPage(firstPage);
		numbers.setLastPage(lastPage);
		numbers.setLastOfPrevGroup(lastOfPrevGroup);
		numbers.setFirstOfNextGroup(firstOfNextGroup);
		numbers.setListItemNo(listItemNo);

		return numbers;
	}
}