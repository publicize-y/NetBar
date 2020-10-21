package com.zy.Util;

import com.zy.Util.baiduAPI.Base64Util;
import com.zy.Util.baiduAPI.FileUtil;
import com.zy.Util.baiduAPI.HttpUtil;
import com.zy.Util.baiduAPI.GsonUtils;
import lombok.val;

import java.util.*;

/**
 * 人脸注册
 */
public class FaceAdd {

    /**
     * 重要提示代码中所需工具类
     * FileUtil,Base64Util,HttpUtil,GsonUtils请从
     * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
     * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
     * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
     * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
     * 下载
     */
    public static String add(String Base64,Long idnumber ) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        String ak="LpjIr4TYWjpqqX3ZxWKIRIQ2";
        String sk ="SIowE4h6oxGhgPb25CBDM14h0eT82i3E";
        try {
//            byte[] bytes = FileUtil.readFileByBytes("C:\\Users\\14456\\Pictures\\证件照\\1.jpg");
//            String s = Base64Util.encode(bytes);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("image", Base64);
            map.put("group_id", "group_repeat");
            map.put("user_id", idnumber);
            map.put("user_info", "abc");
            map.put("liveness_control", "NORMAL");
            map.put("image_type", "BASE64");
            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);
            String s1 = AuthService.getAuth(ak, sk);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = s1;

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}