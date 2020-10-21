package com.zy.Controller;

import com.zy.Pojo.SurfInfo;
import com.zy.Pojo.Vip;
import com.zy.Service.SurfInfoService;
import com.zy.Service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/vip")
public class VipController {
    @Autowired
    private VipService vipService;
    @Autowired
    private SurfInfoService surfInfoService;
    //获取所有VIP
    @RequestMapping("/getall")
    public  String  getallUservister(Model model){

        List<Vip> list= vipService.getallVip();
        model.addAttribute("list",list);
        return "vip/viplist";
    }
    //去更新页面
    @RequestMapping("/toupdate")
    public  String  toupdateAdmin(Integer id,Model model){
        Vip vip= vipService.selectVipByid(id);

        model.addAttribute("Vip",vip);

        return "vip/updatvip";
    }
    //模糊查询
  @RequestMapping("/querylist")
  public String getVipBylike(String realname,Model model){
        List<Vip> list= vipService.getVipbylike(realname);

        List<Vip> list1 = new ArrayList<Vip>();

        if (list.isEmpty()){
            list1=vipService.getallVip();
            model.addAttribute("list",list1);
            model.addAttribute("msg","查询为空");
        }else {
            model.addAttribute("list",list);
        }
        return "vip/viplist";
    }
    //删除
    @RequestMapping("/delete")
    public void deleteVip(Integer id){
        vipService.deleteVipByid(id);
    }

    //跳转添加会员页面
    @RequestMapping("/toaddvip")
    public  String toaddvip (){
        return "vip/addvip";
    }

    //会员充值
    @RequestMapping("/toupdatemoney")
    public  String toupdatemoney (){

        return "vip/updatemoney";

    }
    //管理员修改信息
    @RequestMapping("/updatevip")
    public String updateVip(Vip vip){

        vipService.updateVipByid(vip);

        return "redirect:/vip/getall";
    }
    //vip跳转到个人页面
    @RequestMapping("/topersonnal")
    public  String topersonal(Integer id,Model model){

        Vip vip = vipService.selectVipByid(id);

        model.addAttribute("vip",vip);

        return "vipJSP/personnal";

    }
    @RequestMapping("/togonet")
    public  String togonet(Integer id,Model model){

        Vip vip = vipService.selectVipByid(id);

        model.addAttribute("vip",vip);

        return "vipJSP/gonet";

    }

    @RequestMapping("/tooutnet")
    public  String tooutnet(Long idnumber,Model model){

      SurfInfo surfInfo= surfInfoService.selectSurfinfoByIdnumber(idnumber);

        model.addAttribute("surfInfo",surfInfo);

        return "vipJSP/outnet";

    }




}
