package com.fjp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/22 0:51
 */
@Controller
public class DeskController {
    /**
     * 跳转页面
     */
//    @RequestMapping("toDeskManager")
//    public String toDeskManager(){
//        return "system/main/deskManger";
//    }
    @RequestMapping("toDeskManager")
    public String toDeskManager(){
        return "system/main/deskManger";

    }

}
