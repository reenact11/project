package org.SOC.domain;

public class Criteria {

	private int page;// 현재 조회하는 페이지의 번호
	private int perPageNum;// 한 페이지당 출력하는 글의 개수
	private String category;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 20;
		this.category = "Notice";
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		int cnt = this.perPageNum;
		if (perPageNum != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = perPageNum;
		}
	}

	public int getPage() {
		return page;
	}

	// method for MyBatis SQL Mapper -
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	// method for MyBatis SQL Mapper
	public int getPerPageNum() {
		return this.perPageNum;
	}

	// method for MyBatis SQL Mapper
	public String getCategory() {
		return this.category;

	}

	// method for MyBatis SQL Mapper
	public void setCategory(String category) {
		this.category = category;

	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", category=" + category + "]";
	}
}
