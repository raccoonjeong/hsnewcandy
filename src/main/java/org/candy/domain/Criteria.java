package org.candy.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {

	private int page;
	private String type, keyword;

	public Criteria() {
		this.page = 1;
	}
	//디폴트 생성자

	public Criteria(int page) {

		this.page = page;
	}

	public int getSkip() {
		return (this.page - 1) * 10;

	}

	public String[] getArr() {
		if (type == null) {
			return null;
		}
		return this.type.split("");
	}
	
	public String makeSearch(int page) { //검색조건 유지한 채로 페이징
        if(this.keyword!=null && this.type!=null && this.type!=""&& this.keyword!="") {
        
        UriComponents uriComponents = //물음표 등의 토큰 자동생성
                UriComponentsBuilder.newInstance().queryParam("page", page).
                queryParam("type", this.type).
                queryParam("keyword", encoding(this.keyword)).build();
        return uriComponents.toUriString();}
        
        else {UriComponents uriComponents =
                UriComponentsBuilder.newInstance().queryParam("page", page).
                build();
        return uriComponents.toUriString();}
                    
    }
	
    
    private String encoding(String keyword) { //키워드 한글일때 문제를 막기위해 인코딩.. 익스플로러에서는 한글로 파라미터를 못받는다.
        if(keyword == null || keyword.trim().length()==0) {
            return "";
        }
        try {
            return URLEncoder.encode(keyword,"UTF-8");
        }catch(UnsupportedEncodingException e) {
            return "";
        }
    }
}
