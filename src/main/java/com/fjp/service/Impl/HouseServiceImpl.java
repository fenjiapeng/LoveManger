package com.fjp.service.Impl;

import com.fjp.constant.SysConstant;
import com.fjp.mapper.HouseMapper;
import com.fjp.pojo.House;
import com.fjp.pojo.HouseVo;
import com.fjp.service.HouseService;
import com.fjp.utils.AppFileUtils;
import com.fjp.utils.DataGridView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/23 10:12
 */
@Service
public class HouseServiceImpl implements HouseService {
    @Resource
    private HouseMapper houseMapper;

    /**
     * 查询全部房屋信息
     * @param houseVo
     * @return
     */
    @Override
    public DataGridView queryAllHouse(HouseVo houseVo) {
        Page<Object> page = PageHelper.startPage(houseVo.getPage(), houseVo.getLimit());
        List<House> houses = houseMapper.queryAllHouse(houseVo);
        return new DataGridView(page.getTotal(),houses);
    }

    /**
     * 增加
     * @param houseVo
     */
    @Override
    public void addHouse(HouseVo houseVo) {
        houseMapper.addHouse(houseVo);
    }

    /**
     * 删除,删除图片，删除信息
     */
    @Override
    public void deleteHouse(int id) {
        //先删除图片
       House house = houseMapper.selectByPrimayKey(id);
        //如果不是默认图片，就进行删除
        if (!house.getHouseimg().equals(SysConstant.DEFAULT_CAR_IMG)){
            AppFileUtils.deleteFileUsePath(house.getHouseimg());
        }
        //删除数据库数据
        houseMapper.deleteHouse(id);
    }

    @Override
    public House queryHouseById(int id) {
        return houseMapper.selectByPrimayKey(id);
    }

    @Override
    public void updateHouse(HouseVo houseVo) {
        houseMapper.updateHouse(houseVo);
    }
}
