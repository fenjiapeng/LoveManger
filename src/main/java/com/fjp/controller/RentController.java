package com.fjp.controller;

import com.fjp.constant.SysConstant;
import com.fjp.pojo.Customer;
import com.fjp.pojo.RentVo;
import com.fjp.pojo.User;
import com.fjp.service.CustomerService;
import com.fjp.service.RentService;
import com.fjp.utils.DataGridView;
import com.fjp.utils.RandomUtils;
import com.fjp.utils.ResultObj;
import com.fjp.utils.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/24 9:43
 */
@RestController
public class RentController {


    @Resource
    private RentService rentService;
    @Resource
    private CustomerService customerService;
    /**
     * 检查客户身份证是否存在
     */
    @RequestMapping("/checkCustomerExit")
    public ResultObj checkCustomerExit(RentVo rentVo){
        Customer customer = customerService.queryCustomerById(rentVo.getIdentity());
        //客户是否存在
        if (customer != null){
            return ResultObj.STATUS_TRUE;
        }else {
            return ResultObj.STATUS_FALSE;
        }
    }

    /**
     * 初始化添加出租单
     */
    @RequestMapping("initRentFrom")
    public RentVo initRentFrom(RentVo rentVo){
        //生成出租单
        rentVo.setRentid(RandomUtils.createRandomStringUseTime(SysConstant.CAR_ORDER_CZ));
        //设置起租时间
        rentVo.setStartTime(new Date());
        //设置操作员
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        rentVo.setOpername(user.getRealname());
        return rentVo;
    }

    /**
     * 保存出租
     */
    @RequestMapping("/saveRent")
    public ResultObj saveRent(RentVo rentVo){
        try {
            //设置归还状态
            rentVo.setRentflag(SysConstant.RENT_BACK_FALSE);
            //设置创建是时间
            rentVo.setStartTime(new Date());
            //保存
            rentService.addRent(rentVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("loadAllRent")
    public DataGridView loadAllRent(RentVo rentVo) {
        return rentService.findAllRent(rentVo);
    }

    @RequestMapping("/updateRent")
    public ResultObj updateRent(RentVo rentVo){
        try {
            rentService.updateRent(rentVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除出租单
     */
    @RequestMapping("deleteRent")
    public ResultObj deleteRent(RentVo rentVo){
        try {
            rentService.deleteRent(rentVo);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
