package org.candy.domain;



import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageMaker {
	//현재 페이지와 게시글의 토탈값 두가지를 매개변수로 해서 연산을 하여 나타냄...

	private boolean prev, next;
	private int page, start, end, total;

	private Criteria cri;

	public PageMaker(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.page = cri.getPage() > 0 ? cri.getPage() : 1;

		int tempLast = (int) (Math.ceil(page / 10.0) * 10);

		this.start = tempLast - 9; 

		prev = (start != 1);// true

		if (tempLast * 10 >= total) {
			tempLast = (int) (Math.ceil(total / 10.0));

		} else {
			this.next = true;
		}
		this.end = tempLast;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).build();
		return uriComponents.toUriString();
	}

}
