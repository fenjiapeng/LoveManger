package com.fjp.service;

import com.fjp.pojo.Customer;
import com.fjp.pojo.CustomerVo;
import com.fjp.utils.DataGridView;

import java.util.List;

/**
 * @author fjc23
 */
public interface CustomerService {

    /**
     * 查找所有客户
     * @return
     */
    DataGridView findByCustomer(CustomerVo customerVo);

    void addCustomer(CustomerVo customerVo);

    void deleteCustomer(String identity);

    void updateCustomer(CustomerVo customerVo);

    Customer queryCustomerById(String identity);
}
