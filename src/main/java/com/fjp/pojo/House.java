package com.fjp.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/23 10:00
 * id` int NOT NULL,
 *   `housetype` varchar(255) DEFAULT NULL COMMENT '房屋类型',
 *   `location` varchar(255) DEFAULT NULL COMMENT '位置',
 *   `rentprice` double DEFAULT NULL COMMENT '出租价格',
 *   `deposit` double DEFAULT NULL COMMENT '押金',
 *   `isrenting` int DEFAULT NULL COMMENT '是否出租，1出租，0未出租',
 *   `description` varchar(255) DEFAULT NULL COMMENT '描述',
 *   `houseimg` varchar(255) DEFAULT NULL COMMENT '图片',
 *   `createtime` datetime DEFAULT NULL COMMENT '创建时间',
 */
public class House {

    private int id;
    private String housetype;
    private String location;
    private Double rentprice;
    private Double deposit;
    private Integer isrenting;
    private String description;
    private String houseimg;
    @JsonFormat(pattern = "yyyy-MMM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createtime;

    public House() {
    }

    public House(int id, String housetype, String location, Double rentprice, Double deposit, Integer isrenting, String description, String houseimg, Date createtime) {
        this.id = id;
        this.housetype = housetype;
        this.location = location;
        this.rentprice = rentprice;
        this.deposit = deposit;
        this.isrenting = isrenting;
        this.description = description;
        this.houseimg = houseimg;
        this.createtime = createtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHousetype() {
        return housetype;
    }

    public void setHousetype(String housetype) {
        this.housetype = housetype;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Double getRentprice() {
        return rentprice;
    }

    public void setRentprice(Double rentprice) {
        this.rentprice = rentprice;
    }

    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public Integer getIsrenting() {
        return isrenting;
    }

    public void setIsrenting(Integer isrenting) {
        this.isrenting = isrenting;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHouseimg() {
        return houseimg;
    }

    public void setHouseimg(String houseimg) {
        this.houseimg = houseimg;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
