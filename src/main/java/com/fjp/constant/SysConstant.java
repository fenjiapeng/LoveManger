package com.fjp.constant;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/21 15:23
 * 常量接口
 */
@SuppressWarnings("all")
public class SysConstant {
    public static String USER_LOGIN_ERROR_MSG = "用户名或密码错误";
    public static String USER_LOGIN_CODE_ERROR_MSG = "验证码错误";


    /**
     * 可用状态常量
     */
    public static Integer AVAILABLE_TRUE = 1;
    public static Integer AVAILABLE_FALSE = 0;

    /**
     * 用户类型
     */
    public static  Integer USER_TYPE_SUPER = 1;  //超级管理员
    public static Integer USER_TYPE_NORMAL = 2; //普通用户

    /**
     * 是否展开
     */
    Integer SPREAD_TRUE = 1;
    Integer SPREAD_FALSE = 0;

    /**
     * 操作状态
     */
    public static String ADD_SUCCESS = "添加成功";
    public static String ADD_ERROR = "添加失败";

    public static String UPDATE_SUCCESS = "修改成功";
    public static String UPDATE_ERROR = "修改失败";

    public static String DELETE_SUCCESS = "删除成功";
    public static String DELETE_ERROR = "删除失败";

    public static String RESET_SUCCESS = "重置成功";
    public static String RESET_ERROR = "重置失败";

    public static String DISPATCH_SUCCESS = "分配成功";
    public static String DISPATCH_ERROR = "分配失败";

    public static Integer CODE_SUCCESS = 0; //操作成功
    public static Integer CODE_ERROR = -1; //操作失败

    /**
     * 公用的常量
     */
    public static Integer CODE_ZERO = 0;
    public static Integer CODE_ONE = 1;
    public static Integer CODE_TWO = 2;
    public static Integer CODE_THREE = 3;

    /**
     * 用户的默认密码
     */
    public static String USER_DEFAULT_PWD = "123456";

    /**
     * 临时文件标记
     */
    public static String FILE_UPLOAD_TEMP = "_temp";

    /**
     * 设置默认图片地址
     */
    public static String DEFAULT_CAR_IMG = "images/layui.png";

    /**
     * 单号的前缀
     */
    public static String CAR_ORDER_CZ = "CZ";  //出租车辆的订单号前缀
    public static String CAR_ORDER_XZ = "XZ";  //检查单的单号前缀

    /**
     * 归还状态
     */
    public static Integer RENT_BACK_FALSE = 0; //为归还
    public static Integer RENT_BACK_TRUE = 1; //已归还

    /**
     * 出租状态
     */
    public static Integer RENT_CAR_TRUE = 1; //已出租
    public static Integer RENT_CAR_FALSE = 0; //未出租

}
