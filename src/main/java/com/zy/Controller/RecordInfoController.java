package com.zy.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.Pojo.RecordInfo;
import com.zy.Pojo.UserVisiter;
import com.zy.Pojo.Vip;
import com.zy.Service.RecordInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/record")
public class RecordInfoController {
    @Autowired
    private RecordInfoService recordInfoService;

    @RequestMapping("/torecord")
    public  String torecord(){

        return "record/record";

    }

    @RequestMapping("/getall")
    public  String getallRecord(Model model,@RequestParam(required=true,defaultValue="1") Integer page){

        //page默认值是1，pageSize默认是10，我写的是2 意思是从第1页开始，每页显示2条记录。
        PageHelper.startPage(page, 10);

        List<RecordInfo> list= recordInfoService.getAllRecord();

        PageInfo<RecordInfo> p=new PageInfo<RecordInfo>(list);

        model.addAttribute("page",p);

        model.addAttribute("list",list );

     return "record/record";
    }

    @RequestMapping("/delete")
    public  String deleterecord(Integer id){

        recordInfoService.deleteRecordbyId(id);


        return "redirect:/record/getall";

    }
    //模糊查询
    @RequestMapping("/querylist")
    public String getVipBylike(String realname,Model model){



        List<RecordInfo> list= recordInfoService.getRecordbylike(realname);

        List<RecordInfo> list1 = new ArrayList<RecordInfo>();

        if (list.isEmpty()){
            list1=recordInfoService.getAllRecord();
            model.addAttribute("list",list1);
            model.addAttribute("msg","查询为空");
        }else {


            model.addAttribute("list",list);
        }
        return "record/record";
    }
}
