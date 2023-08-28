package com.fjp.controller;

import com.fjp.constant.SysConstant;
import com.fjp.pojo.House;
import com.fjp.pojo.HouseVo;
import com.fjp.service.HouseService;
import com.fjp.utils.AppFileUtils;
import com.fjp.utils.DataGridView;
import com.fjp.utils.ResultObj;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/23 10:08
 * @RestController返回json类型，不用每个方法上添加ResposeBody
 */
@RestController
public class HouseController {

    @Resource
    private HouseService houseService;
    /**
     * 查询所有房屋信息 返回值DataGridView
     */
    @RequestMapping("/loadAllHouse")
    public DataGridView findAllHouse(HouseVo houseVo){
        return houseService.queryAllHouse(houseVo);
    }

    /**
     * 添加房屋
     */
    @RequestMapping("/addHouse")
    public ResultObj addHouse(HouseVo houseVo){

        try {
            houseVo.setCreatetime(new Date());
            //如果不是默认图片就去掉图片的_temp后缀
            if(!houseVo.getHouseimg().equals(SysConstant.DEFAULT_CAR_IMG)){
                String fileName = AppFileUtils.updateFileName(houseVo.getHouseimg(), SysConstant.FILE_UPLOAD_TEMP);
                houseVo.setHouseimg(fileName);
            }
            houseService.addHouse(houseVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }


    /**
     * 删除房屋信息
     */

    @RequestMapping("deleteHouse")
    public ResultObj deleteHouse(int id){
        try {
            houseService.deleteHouse(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }

    }

    /**
     * 修改房屋信息
     */
    @RequestMapping("updateHouse")
    public ResultObj updateHouse(HouseVo houseVo){
        try {
            String houseimg = houseVo.getHouseimg();
            if (houseimg.endsWith(SysConstant.FILE_UPLOAD_TEMP)) {
                String filePath = AppFileUtils.updateFileName(houseVo.getHouseimg(), SysConstant.FILE_UPLOAD_TEMP);
                houseVo.setHouseimg(filePath);

                House house = houseService.queryHouseById(houseVo.getId());
                AppFileUtils.removeFileByPath(houseVo.getHouseimg());
            }
              //更新操作
                houseService.updateHouse(houseVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
}
