package com.fjp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/22 1:20
 */
@Controller
public class BusController {
    /**
     * 跳转客户管理yemain
     */
    @RequestMapping("toCustomerManager")
    public String toCustomerManager(){
        return "system/main/customerManager";
    }

    @RequestMapping("toHouseManager")
    public String toHouseManager(){
        return "system/main/houseManager";
    }

    @RequestMapping("toRentManager")
    public String toRentManager(){
        return "system/main/rentHouseManager";
    }
    @RequestMapping("rentManger")
    public String rentManger(){
        return "system/main/rentManager";
    }

}
