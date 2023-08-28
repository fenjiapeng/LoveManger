package com.fjp.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/22 9:34
 * `identity` varchar(255) DEFAULT NULL,
 *   `custname` varchar(255) DEFAULT NULL,
 *   `sex` int DEFAULT NULL,
 *   `address` varchar(255) DEFAULT NULL,
 *   `phone` varchar(255) DEFAULT NULL,
 *   `career` varchar(255) DEFAULT NULL,
 *   `createtime` datetime DEFAULT NULL
 */
public class Customer {
    private String identity;
    private String custname;
    private Integer sex;
    private String address;
    private String phone;
    private String career;
    @JsonFormat(pattern = "yyyy-MMM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createtime;

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
