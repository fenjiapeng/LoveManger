package com.fjp.service.Impl;

import com.fjp.constant.SysConstant;
import com.fjp.mapper.HouseMapper;
import com.fjp.mapper.RentMapper;
import com.fjp.pojo.House;
import com.fjp.pojo.HouseVo;
import com.fjp.pojo.Rent;
import com.fjp.pojo.RentVo;
import com.fjp.service.RentService;
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
 * @date 2023/8/24 14:04
 */
@Service
public class RentServiceImpl implements RentService {

    @Resource
    private RentMapper rentMapper;
    @Resource
    private HouseMapper houseMapper;

    @Override
    public DataGridView findAllRent(RentVo rentVo) {
        Page<Rent> page = PageHelper.startPage(rentVo.getPage(), rentVo.getLimit());
        List<Rent> rent = rentMapper.findAllRent(rentVo);
        return new DataGridView(page.getTotal(),rent);
    }

    @Override
    public void addRent(RentVo rentVo) {
        rentMapper.addRentFlag(rentVo);
        //更改车辆的出租信息
        House house = new House();
        house.setId(rentVo.getId());
        //设置状态
        house.setIsrenting(SysConstant.RENT_BACK_TRUE);
        houseMapper.updateHouse(house);
    }

    @Override
    public void updateRent(RentVo rentVo) {
        rentMapper.updateRent(rentVo);
    }

    @Override
    public void deleteRent(RentVo rentVo) {
        //House house = new House();
       // houseVo.setId(rentVo.getId());
        //house.setIsrenting(SysConstant.RENT_CAR_FALSE);
        //删除出租单
        rentMapper.deleteByPrimaryKey(rentVo.getRentid());
        //更新状态
        //houseMapper.updateHouse(house);
    }


    @Override
    public Rent queryRentByRentId(String rentid) {
        return   rentMapper.queryRentById(rentid);
    }
}
