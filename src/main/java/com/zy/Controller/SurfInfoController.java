package com.zy.Controller;

import com.zy.Pojo.SurfInfo;
import com.zy.Service.SurfInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/surf")
@Controller
public class SurfInfoController {

    @Autowired
    private SurfInfoService surfInfoService;

    @RequestMapping("/getall")
    public  String getallSurfInfo(Model model){

        List<SurfInfo> list = surfInfoService.getall();

        model.addAttribute("list",list);

        return "surf/surf";

    }
    @RequestMapping("/togonet")
    public  String togonet(){

        return "surf/gonet";

    }

    @RequestMapping("/togonet1")
    public  String a(){

        return "surf/gonet";

    }





}
