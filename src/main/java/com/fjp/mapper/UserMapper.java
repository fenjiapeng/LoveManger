package com.fjp.mapper;

import com.fjp.pojo.User;
import com.fjp.pojo.UserVo;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/21 20:56
 */
public interface UserMapper {

    User login(UserVo userVo);
}
