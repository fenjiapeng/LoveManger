package com.fjp.service.Impl;

import com.fjp.mapper.UserMapper;
import com.fjp.pojo.User;
import com.fjp.pojo.UserVo;
import com.fjp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/21 20:53
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 登录
     * @param userVo
     * @return
     */
    @Override
    public User login(UserVo userVo) {

        //对密吗加密

        return userMapper.login(userVo);
    }
}
