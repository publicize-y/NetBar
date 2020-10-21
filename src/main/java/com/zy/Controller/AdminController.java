package com.zy.Controller;
import com.zy.Pojo.Admin;
import com.zy.Pojo.Vip;
import com.zy.Service.AdminService;
import com.zy.Service.RecordInfoServiceImpl;
import com.zy.Service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private VipService vipService;

    @RequestMapping(value = "/tologin")
    public  String tologin(Model model){
        model.addAttribute("msg","用户名或者密码错误");
        return"login";
    }

    @RequestMapping("/login")
    public  String  login(Long username, String password , HttpSession session){
      Admin admin= adminService.login(username,password);

      Vip vip= vipService.viplogin(username,password);

        if(admin==null){

                if (vip==null){
                    return "redirect:tologin";
                }else {
                    session.setAttribute("user",vip.getRealname());
                    session.setAttribute("user1",vip.getRoot());
                    session.setAttribute("user2",vip);
                    session.setAttribute("user3",vip);
                    session.setAttribute("loginok","ok");
                    return "index";
                }

        }else {
            session.setAttribute("user",admin.getRealname());
           session.setAttribute("user1",admin.getRoot());
            session.setAttribute("user2",admin);
           session.setAttribute("loginok","ok");
            return "index";
        }

    }
    @RequestMapping("/getall")
    public  String getalladmin(Model model){

       List<Admin> list = adminService.getalladmin();
       model.addAttribute("list",list);
       return "uservisiter/adminlist";
    }


    @RequestMapping("/toupdate")
    public  String  toupdateAdmin(Integer id,Model model){
       Admin admin= adminService.selectAdminByid(id);
       model.addAttribute("admin",admin);
        return "uservisiter/updateadmin";
    }



    @RequestMapping("/delete")
    public  void deleteAdmin(Integer id){
        adminService.deleteAdminByid(id);
    }

    //去首页
    @RequestMapping("/towelcome")
    public  String towelcome(){

        return "welcome";
    }
    //去首页
    @RequestMapping("/towelcome1")
    public  String towelcome1(){

        return "index";
    }
    //退出
    @RequestMapping("/exit")
    public  String exit(HttpSession session){

        session.removeAttribute("loginok");

        return "login";


    }
}
