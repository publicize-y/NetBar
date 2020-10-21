package com.zy.Controller;

import com.zy.Util.FaceAdd;
import com.zy.Util.FaceSeach;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.rmi.CORBA.Util;

@Controller
@RequestMapping("/other")
public class other {

    @RequestMapping("/changeuser")
    public String changeuser(){

        return "setting/changeuser";
    }
    //查看资料
    @RequestMapping("/usermeans")
    public String getusermeans(){

        return "setting/usermeans";
    }
    //充值
    @RequestMapping("/addmoney")
    public String addmoney(){

        return "surf/addmoney";
    }
    @RequestMapping("/addface")
    @ResponseBody
    public void aaa(String img){
       /* System.out.println(img);*/
        img = img.substring(img.indexOf(",")+1);
        String a="kakxi";
       final String s = FaceSeach.faceSearch(img);
       System.out.println(s);


    }

}
