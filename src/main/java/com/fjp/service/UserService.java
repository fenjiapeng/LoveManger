package com.fjp.service;

import com.fjp.pojo.User;
import com.fjp.pojo.UserVo;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/21 20:44
 */
public interface UserService {
    User login(UserVo userVo);
}
