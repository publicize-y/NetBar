package com.zy.Util;

import com.zy.Util.baiduAPI.Base64Util;
import com.zy.Util.baiduAPI.FileUtil;
import com.zy.Util.baiduAPI.GsonUtils;
import com.zy.Util.baiduAPI.HttpUtil;
import com.zy.Util.*;

import java.util.HashMap;
import java.util.Map;

public class FaceSeach {
    public static String faceSearch(String Base64) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        String ak="LpjIr4TYWjpqqX3ZxWKIRIQ2";
        String sk ="SIowE4h6oxGhgPb25CBDM14h0eT82i3E";
        try {
//            byte[] bytes = FileUtil.readFileByBytes("C:\\Users\\14456\\Pictures\\证件照\\3.jpg");
//            String s = Base64Util.encode(bytes);
          //  System.out.println(s);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("image",Base64);
            map.put("liveness_control", "NORMAL");
            map.put("group_id_list", "group_repeat,group_233");
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
