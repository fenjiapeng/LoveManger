package com.fjp.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import com.fjp.constant.SysConstant;
import com.fjp.pojo.User;
import com.fjp.pojo.UserVo;
import com.fjp.service.UserService;
import com.fjp.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/21 19:34
 */
@Controller
public class LoginController {

    @Resource
    private UserService userService;

    @RequestMapping("toLogin")
    public String toLogin() {
        return "system/main/login";
    }

    /**
     * 生成验证码
     * @param response
     * @param request
     * @param session
     */
    @RequestMapping("getCode")
    public void getCode(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
        //定义图行长度宽度和符号干扰
        CircleCaptcha circleCaptcha = CaptchaUtil.createCircleCaptcha(116, 34, 4, 5);
        //放入session
        session.setAttribute("code",circleCaptcha.getCode());
        //输出yemain
        ServletOutputStream outputStream = response.getOutputStream();
        //将数据以图片方式输出
        ImageIO.write(circleCaptcha.getImage(),"jpeg",outputStream);
    }


    /**
     * 登录方法
     */
    @RequestMapping("login")
    public String login(UserVo userVo, Model model){
        //获取验证码
        String code = WebUtils.getHttpSession().getAttribute("code").toString();
        if (userVo.getCode().equals(code)) {
            //验证用户名密码
            User user = userService.login(userVo);
            if (user != null) {
                WebUtils.getHttpSession().setAttribute("user",user);
                return "system/main/index";
            }else {
                //用户不存在
                model.addAttribute("error" , SysConstant.USER_LOGIN_ERROR_MSG);
                return "system/main/login";
            }
        }else {
            model.addAttribute("error",SysConstant.USER_LOGIN_CODE_ERROR_MSG);
            return "system/main/login";
        }
    }
}
