package org.SOC.domain;

import java.util.List;
public class ArticleFreePage {

	private int total;  //2
	private int currentPage; //1
	private List<BoardVO> post;
	private int totalPages;  //1
	private int startPage; //1
	private int endPage;  //1

	public ArticleFreePage(int total, int currentPage, int size, List<BoardVO> post) {
		this.total = total;  //2
		this.currentPage = currentPage;  //1
		this.post = post;
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if (total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if (modVal == 0) startPage -= 5;
			
			endPage = startPage + 4;
			if (endPage > totalPages) endPage = totalPages;
		}
	}

	public int getTotal() {
		return total;
	}

	public boolean hasNoArticles() {
		return total == 0;
	}

	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<BoardVO> getPost() {
		return post;
	}

	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
}
