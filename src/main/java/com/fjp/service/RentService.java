package com.fjp.service;

import com.fjp.pojo.Rent;
import com.fjp.pojo.RentVo;
import com.fjp.utils.DataGridView;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/24 9:46
 */
public interface RentService {


     DataGridView findAllRent(RentVo rentVo);


    void addRent(RentVo rentVo);

    void updateRent(RentVo rentVo);

    void deleteRent(RentVo rentVo);

    Rent queryRentByRentId(String rentid);

}
