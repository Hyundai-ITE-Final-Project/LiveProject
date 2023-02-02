package com.livecommerce.project.vo;

import lombok.Getter;
import lombok.Setter;
/**
 * @author 김나형
 * @since 2023.01.10
 * @version 1.0
 * 
 * <pre>
 * 수정일              		수정자                   수정내용
 * 2023.01.10		김나형		최초생성
 * </pre>
 */ 
@Getter
@Setter

public class Criteria {

    /* 현재 페이지 번호 */
    private int pageNum;

    /* 페이지 표시 개수 */
    private int amount;

    /* 검색 키워드 */
    private String keyword;

    /* Criteria 생성자 */
    public Criteria(int pageNum) {
    	this(pageNum, 12);
    }
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    /* Criteria 기본 생성자 */
    public Criteria() {
        this(1, 12);
    }

    @Override
    public String toString() {
        return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + "]";
    }

}// end class