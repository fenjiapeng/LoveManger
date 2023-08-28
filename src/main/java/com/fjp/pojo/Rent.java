package com.fjp.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/24 9:38
 */
public class Rent {
    private String rentid;
    private Double price;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone =
            "GMT+8")
    private Date begindate;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone =
            "GMT+8")
    private Date returndate;
    private Integer rentflag;
    private String identity;
    private Integer id;
    private String opername;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone =
            "GMT+8")
    private Date createtime;


    public String getRentid() {
        return rentid;
    }

    public void setRentid(String rentid) {
        this.rentid = rentid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getBegindate() {
        return begindate;
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    public Date getReturndate() {
        return returndate;
    }

    public void setReturndate(Date returndate) {
        this.returndate = returndate;
    }

    public Integer getRentflag() {
        return rentflag;
    }

    public void setRentflag(Integer rentflag) {
        this.rentflag = rentflag;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpername() {
        return opername;
    }

    public void setOpername(String opername) {
        this.opername = opername;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
