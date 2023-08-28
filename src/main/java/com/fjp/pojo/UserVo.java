package com.fjp.pojo;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/21 19:21
 */
public class UserVo extends User{

    /**
     * 分页参数
     */
    private Integer page;
    private Integer limit;
    private String code;

    /**
     * 接收多个角色id
     */
    private Integer[] ids;


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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }
}
