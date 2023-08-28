package com.fjp.mapper;

import com.fjp.pojo.House;
import com.fjp.pojo.HouseVo;

import java.util.List;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/23 10:13
 */
public interface HouseMapper {
     void addHouse(HouseVo houseVo);


    /**
     * 查询所有房屋信息
     * @param house
     * @return
     */
    List<House> queryAllHouse(House house);

    House selectByPrimayKey(int id);

    void deleteHouse(int id);

    void updateHouse(House house);


}
