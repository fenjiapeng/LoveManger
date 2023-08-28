package com.fjp.pojo;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/22 10:32
 */
public class HouseVo extends House{

    /**
     * 分页参数
     */
    private Integer page;
    private Integer limit;

    /**
     * 接收多个id
     */
    private String[] ids;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public String[] getIds() {
        return ids;
    }

    public void setIds(String[] ids) {
        this.ids = ids;
    }
}
