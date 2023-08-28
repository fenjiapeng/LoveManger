package com.fjp.mapper;

import com.fjp.pojo.Rent;
import com.fjp.pojo.RentVo;

import java.util.List;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/24 14:05
 */
public interface RentMapper {

    void addRentFlag(RentVo rentVo);

    List<Rent> findAllRent(RentVo rentVo);

    int updateRent(RentVo rentVo);

    void deleteByPrimaryKey(String rentid);

    Rent queryRentById(String rentid);

}
