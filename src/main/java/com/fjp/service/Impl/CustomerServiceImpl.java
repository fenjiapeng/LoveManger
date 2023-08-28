package com.fjp.service.Impl;

import com.fjp.mapper.CustomerMapper;
import com.fjp.pojo.Customer;
import com.fjp.pojo.CustomerVo;
import com.fjp.service.CustomerService;
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
 * @date 2023/8/22 9:50
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Resource
    private CustomerMapper customerMapper;
    @Override
    public DataGridView findByCustomer(CustomerVo customerVo) {
        Page<Object> page = PageHelper.startPage(customerVo.getPage(), customerVo.getLimit());
        List<Customer> customer = customerMapper.findAllCustomer(customerVo);
        return new DataGridView(page.getTotal(),customer);
    }

    /**
     * 添加客户信息
     * @param customerVo
     */
    @Override
    public void addCustomer(CustomerVo customerVo) {
        this.customerMapper.addCustomer(customerVo);
    }

    @Override
    public void deleteCustomer(String identity) {
        customerMapper.deleteCustomer(identity);
    }

    @Override
    public void updateCustomer(CustomerVo customerVo) {
        customerMapper.updateCustomer(customerVo);
    }

    @Override
    public Customer queryCustomerById(String identity) {
        return customerMapper.queryCustomerById(identity);
    }
}
