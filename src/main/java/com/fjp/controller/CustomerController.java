package com.fjp.controller;

import com.fjp.pojo.Customer;
import com.fjp.pojo.CustomerVo;
import com.fjp.service.CustomerService;
import com.fjp.utils.DataGridView;
import com.fjp.utils.ResultObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/22 9:55
 */
@Controller
public class CustomerController {

    @Resource
    private CustomerService customerService;

    /**
     * 查询客户信息
     * @param customerVo
     * @return
     */
    @RequestMapping("/loadAllCustomer")
    @ResponseBody
    public DataGridView loadAllCustomer(CustomerVo customerVo){
       return customerService.findByCustomer(customerVo);

    }

    /**
     * 添加客户
     * @param customerVo
     * @return
     */
    @RequestMapping("/addCustomer")
    @ResponseBody
    public ResultObj addCustomer(CustomerVo customerVo) {
        try {
            customerVo.setCreatetime(new Date());
            this.customerService.addCustomer(customerVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }
    /**
     * 删除客户
     */
    @RequestMapping("/deleteCustomer")
    @ResponseBody
    public ResultObj deleteCustomer(String identity){
        try {
            customerService.deleteCustomer(identity);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 修改用户信息
     */
    @RequestMapping("/updateCustomer")
    @ResponseBody
    public ResultObj updateCustomer(CustomerVo customerVo){
        try {
            this.customerService.updateCustomer(customerVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
}
