package com.fjp.mapper;

import com.fjp.pojo.Customer;
import com.fjp.pojo.CustomerVo;

import java.util.List;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/22 9:37
 */
public interface CustomerMapper {

    List<Customer> findAllCustomer(Customer customer);

    int addCustomer(CustomerVo customerVo);

    void deleteCustomer(String identity);

    void updateCustomer(Customer customer);

    Customer queryCustomerById(String identity);
}
