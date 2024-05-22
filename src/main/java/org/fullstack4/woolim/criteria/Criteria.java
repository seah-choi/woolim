package org.fullstack4.woolim.criteria;

import lombok.ToString;

@ToString
public class Criteria {


    private int pageNum;

    private int amount;

    private int skip;

    private String keyword;

    private String type;
    private String typeArr[];

    private String sorting;
    private String viewSorting;
    public Criteria() {
        this(1, 9);
        this.skip = 0;
    }


    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum - 1) * amount;
    }


    public int getPageNum() {
        return pageNum;
    }


    public void setPageNum(int pageNum) {
        this.skip = (pageNum - 1) * this.amount;
        this.pageNum = pageNum;
    }


    public int getAmount() {
        return amount;
    }


    public void setAmount(int amount) {
        this.skip = (pageNum - 1) * this.amount;
        this.amount = amount;
    }


    public int getSkip() {
        return skip;
    }


    public void setSkip(int skip) {
        this.skip = skip;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
        this.typeArr = type.split("");
    }

    public String[] getTypeArr() {
        return typeArr;
    }

    public void setTypeArr(String[] typeArr) {
        this.typeArr = typeArr;
    }

    public String getSorting() {
        return sorting;
    }

    public void setSorting(String sorting) {
        this.sorting = sorting;
    }

    public String getViewSorting() {
        return viewSorting;
    }

    public void setViewSorting(String viewSorting) {
        this.viewSorting = viewSorting;
    }
}
