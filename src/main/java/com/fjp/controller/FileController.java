package com.fjp.controller;

import com.fjp.constant.SysConstant;
import com.fjp.utils.AppFileUtils;
import com.fjp.utils.DataGridView;
import com.fjp.utils.RandomUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author fjp
 * @version 1.0
 * @description: TODO
 * @date 2023/8/23 14:16
 */
@Controller
public class FileController {

    /**
     * 查看图片
     */
    @RequestMapping("downloadSowFile")
    public ResponseEntity<Object> downloadSowFile(String path, HttpServletResponse response){
        return AppFileUtils.downloadFile(response,path,"");
    }

    /**
     * 上传图片
     */
    @RequestMapping("uploadFile")
    @ResponseBody
    public DataGridView uploadFile(MultipartFile multipartFile) throws IOException {
        //文件上床的父目录
        String parentPath = AppFileUtils.PATH;
        //得到当前时间作为存放图片的目录
        String dirName = RandomUtils.getCurrentDateForString();
        //构建文件夹对象
        File dirFile = new File(parentPath,dirName);
        if (!dirFile.exists()){
            dirFile.mkdirs();//如果想要的日期目录不存在，创建该目录

        }
        //得到源文件名称
        String oldNmae = multipartFile.getOriginalFilename();
        //根据源文件名称获取到一个新文件名称
       String newName = RandomUtils.createFileNameUseTime(oldNmae, SysConstant.FILE_UPLOAD_TEMP);
        File dest = new File(dirFile,newName);
        multipartFile.transferTo(dest);

        //构建返回值
        Map<String, Object> map = new HashMap<>();

        map.put("src",dirName+"/"+newName);
        return new DataGridView(map);
    }
}
