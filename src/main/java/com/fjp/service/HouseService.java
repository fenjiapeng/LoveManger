package com.fjp.service;

import com.fjp.pojo.House;
import com.fjp.pojo.HouseVo;
import com.fjp.utils.DataGridView;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/23 10:12
 */
public interface HouseService {
    DataGridView queryAllHouse(HouseVo houseVo);

    void addHouse(HouseVo houseVo);

    void deleteHouse(int id);

    House queryHouseById(int id);

    void updateHouse(HouseVo houseVo);
}
