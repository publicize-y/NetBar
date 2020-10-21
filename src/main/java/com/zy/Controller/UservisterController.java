package com.zy.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.Pojo.UserVisiter;
import com.zy.Service.UservisiterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/uservisiter")
public class UservisterController {
    @Autowired
    private UservisiterService uservisiterService;

    public void setUservisiterService(UservisiterService uservisiterService) {
        this.uservisiterService = uservisiterService;
    }
    //分页查询所有记录
    @RequestMapping("/getall")
    public  String  getallUservister(Model model,@RequestParam(required=true,defaultValue="1") Integer page){
        //page默认值是1，pageSize默认是10，我写的是2 意思是从第1页开始，每页显示2条记录。
        PageHelper.startPage(page, 2);

        List<UserVisiter> list= uservisiterService.getallUserVisiter();

        PageInfo<UserVisiter> p=new PageInfo<UserVisiter>(list);

        model.addAttribute("page",p);

        model.addAttribute("list",list);

        return "uservisiter/list";
    }
    //模糊查询访问记录
    @RequestMapping("/querylist")
    public  String getUserVisiterbylike(String username,Model model,@RequestParam(required=true,defaultValue="1") Integer page){

        PageHelper.startPage(page, 2);
        List<UserVisiter> list= uservisiterService.getUserVisiterbylike(username);
        List<UserVisiter> list1 =new ArrayList<UserVisiter>();
        if (list.isEmpty()){
            list1=uservisiterService.getallUserVisiter();
            model.addAttribute("list",list1);
            model.addAttribute("msg","查询为空");
        }else {
            model.addAttribute("list",list);
        }


        return "uservisiter/list";
    }

    @RequestMapping("/delete")
    public  void deleteAdmin(Integer id){

     uservisiterService.deleteUservisiterbyid(id);

    }



}
