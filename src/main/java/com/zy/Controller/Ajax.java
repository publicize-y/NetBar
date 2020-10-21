package com.zy.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.zy.Pojo.Admin;
import com.zy.Pojo.RecordInfo;
import com.zy.Pojo.SurfInfo;
import com.zy.Pojo.Vip;
import com.zy.Service.AdminService;
import com.zy.Service.RecordInfoService;
import com.zy.Service.SurfInfoService;
import com.zy.Service.VipService;
import com.zy.Util.FaceAdd;
import com.zy.Util.FaceSeach;
import com.zy.Util.Timemoney;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/ajax")
public class Ajax {
    @Autowired
    private AdminService adminService;
    @Autowired
    private VipService vipService;
    @Autowired
    private SurfInfoService surfInfoService;
    @Autowired
    private RecordInfoService recordInfoService;
    @Autowired
    private Timemoney timemoney;

    public void setVipService(VipService vipService) {
        this.vipService = vipService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    //验证管理员旧密码
    @RequestMapping("/check")
    public String checkpassword(String pwd,Integer id){
        String msg="";
        Admin admin= adminService.selectAdminByid(id);
        String password =admin.getPassword();
        System.out.println(password);

        if(pwd.equals(password)){
            msg="ok";

        }
        else {
            msg="error";

        }
        return msg;
    }
    //验证管理员旧密码
    @RequestMapping("/checkvippassword")
    public String checkvippassword(String pwd,Integer id){
        String msg="";
        System.out.println(id+"123123***********************");
        Vip vip =vipService.selectVipByid(id);
        String password =vip.getPassword();
        System.out.println(password);

        if(pwd.equals(password)){
            msg="ok";

        }
        else {
            msg="error";

        }
        return msg;
    }

    //修改管理员密码
    @RequestMapping("/update")
    public  String updateAdmin(Integer id ,String pwd1){
        String msg="";
       Integer A= adminService.updateAdminByid(pwd1,id);

        if(A>0){
             msg ="ok";
        }else {
            msg="fail";
        }

        return msg;
    }
    //修改用户密码
    @RequestMapping("/updatevippassword")
    public  String updatevip(Integer id ,String pwd1){
        String msg="";
        Integer A= vipService.updateVipPasswordByid(pwd1,id);

        if(A>0){
            msg ="ok";
        }else {
            msg="fail";
        }

        return msg;
    }
    //上机页面进行充值
    @RequestMapping("/updatemoney")
    public  String updatemoney (Long idnumber ,Integer money){
        String msg="";

       Integer A= vipService.updatemoney(money,idnumber);

        Integer B= surfInfoService.updatemoney(money,idnumber);

        if(A>0&&B>0){
            msg ="ok";
        }else {
            msg="fail";
        }

        return msg;

    }

    //充值
    @RequestMapping("/updatemoney1")
    public  String updatemoney1 (Long idnumber ,Integer money){
        String msg="";

        Integer A= vipService.updatemoney(money,idnumber);



        if(A>0){
            msg ="ok";
        }else {
            msg="fail";
        }

        return msg;

    }

    //管理员找回密码
    @RequestMapping("/repassword")
    public  String repassword(String username,String registercode,String password){
        String msg="";
        Admin admin= adminService.selectIdByusername(username);
        Integer id =null;
        String code=null;
        if (admin!=null){
             id =admin.getId();
             code =admin.getCode();
        }else {
            msg="error";
        }
        if(registercode.equals(code)){
            adminService.updateAdminByid(password,id);
            msg="ok";

        }
        else {
            msg="error";

        }
        return msg;

    }
    //管理员上机
    @RequestMapping("/gonet")
    public  String gonet(Long idnumber,Integer computerid,Model model){

      String msg="";

      SurfInfo surfInfo= surfInfoService.selectSurfinfoByIdnumber(idnumber);

        SurfInfo surfInfo1= surfInfoService.selectSurfinfoByComputerid(computerid);

        Vip vip= vipService.selectVipByidnumber(idnumber);

        //判断卡号是否存在
    if(vip!=null) {

        if (surfInfo == null) {
            System.out.println("进入判断卡号");

            if (surfInfo1 == null) {

                System.out.println("进入判断机号");

                if (vip != null && vip.getMoney() > 0) {

                    Integer A = 0;

                    Integer B = 0;
                    //插入在线表
                    A = surfInfoService.gonet(idnumber);

                    B = surfInfoService.updatecomputerid(idnumber, computerid);
                    if (A > 0 && B > 0) {

                        msg = "ok";
                    } else {
                        msg = "error";
                    }

                } else {

                    msg = "nomoney";
                }

            } else {
                System.out.println("返回fail");
                msg = "fail";
            }
        } else {
            System.out.println("返回exit");
            msg = "exit";
        }

    }else {
        msg="novip";
    }

      return  msg;


    }
    //管理员下机
    @RequestMapping("/outnet")
    public  String  outnet(Integer id ,Model model){

        System.out.println(id+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        String msg ="";

        Date exittime =new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        simpleDateFormat.format(exittime);
        //surf表更新下机时间
        surfInfoService.updateExittime(id,exittime);

        SurfInfo surfInfo= surfInfoService.selectSurfinfoByid(id);

        if(surfInfo==null){

            msg ="fail";
        }else {

            msg="ok";
        }

        //获取surf表idnumber
        Long idmunber= surfInfo.getIdnumber();
        //获取surf表上机时间
        Date  createtime = surfInfo.getCreatetime();
        //获取surf表下机时间
        Date  Exittime = surfInfo.getExittime();
        //获取使用金额
        Integer money = timemoney.getmoney(createtime,Exittime);
        //插入记录到record
        SurfInfo surfInfo1 = surfInfoService.selectSurfinfoByIdnumber(idmunber);

         recordInfoService.insertrecord(surfInfo1);
         //获取record的id,具体见sql语句
         Integer id1 =surfInfo1.getId();


        //更新record消费金额
        recordInfoService.updatemoneybyId(id1,money);
        //更新vip的余额
        vipService.updatemoney1(money,idmunber);
        //获取vip表更新后的余额
        int  qian= vipService.selectMoneybyIdnumber(idmunber);


        if(qian<=0){
            msg="nomoney";
        }
        //删除surf上机的信息
        surfInfoService.deleteSurfInfoByid(id);

        return msg;
    }

    //会员自主下机
    @RequestMapping("/outnetbyvip")
    public  String  outnetbyvip(Long idnumber ,Model model){
        String msg ="";

        Date exittime =new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        simpleDateFormat.format(exittime);
        //surf表更新下机时间
        surfInfoService.updateExittimeByvip(idnumber,exittime);

        SurfInfo surfInfo= surfInfoService.selectSurfinfoByIdnumber(idnumber);

        if(surfInfo==null){
            msg ="fail";
        }else {
            //获取surf表上机时间
            Date  createtime = surfInfo.getCreatetime();
            //获取surf表下机时间
            Date  Exittime = surfInfo.getExittime();
            //获取使用金额
            Integer money = timemoney.getmoney(createtime,Exittime);
            //插入记录到record
//            recordInfoService.insertrecord(idnumber);

            //插入记录到record
            SurfInfo surfInfo1 = surfInfoService.selectSurfinfoByIdnumber(idnumber);

            recordInfoService.insertrecord(surfInfo1);
            //获取record的id,具体见sql语句
            Integer id1 =surfInfo1.getId();


            //更新record消费金额
            recordInfoService.updatemoneybyIdnumber(idnumber,money);
            //更新vip的余额
            vipService.updatemoney1(money,idnumber);
            //获取vip表更新后的余额
            int  qian= vipService.selectMoneybyIdnumber(idnumber);
            //删除surf上机的信息
            surfInfoService.deleteSurfInfoByidnumber(idnumber);

            if(qian<=0){
                msg="nomoney";
            }else {
                msg = "ok";
            }
        }

        return msg;
    }

    //会员自主上机
    @RequestMapping("/gonetbyvip")
    public  String gonetbyvip(Integer computerid,String password,String facecode, Model model){
        //System.out.println(facecode);

        String msg="";

        facecode = facecode.substring(facecode.indexOf(",")+1);

        String s=null;

        s =FaceSeach.faceSearch(facecode);

        JsonObject jsonObject=null;

        String score1=null;

        String idnumber1=null;

        jsonObject=new JsonParser().parse(s).getAsJsonObject();

        if(s!=null){
            if(jsonObject!=null){
                //对比分数
                JsonArray items = jsonObject.getAsJsonObject("result").getAsJsonArray("user_list");
                JsonElement row = null;
                for(int i=0; i<items.size(); i++){
                    row = items.getAsJsonArray().get(i);
                }
                score1 = row.getAsJsonObject().get("score").getAsString();
                System.out.println(score1);
                //人脸识别出来的idnumber
                idnumber1 = row.getAsJsonObject().get("user_id").getAsString();
                System.out.println(idnumber1);

                if(score1!=null&&idnumber1!=null){
                    //将String类型转换为long
                    long idnumber = Long.parseLong(idnumber1);

                    //将String类型转换为int
                    int score = (int)Double.parseDouble(score1);

                    SurfInfo surfInfo= surfInfoService.selectSurfinfoByIdnumber(idnumber);

                    SurfInfo surfInfo1= surfInfoService.selectSurfinfoByComputerid(computerid);

                    Vip vip= vipService.selectVipByidnumber(idnumber);
                    //判断vip卡号是否存在
                    if(vip!=null) {
                        //判断是否存在用户
                        if(score>=80){
                            //判断上机表信息是否以及存在此账号
                            if (surfInfo == null) {
                                System.out.println("进入判断卡号");

                                if (surfInfo1 == null) {

                                    System.out.println("进入判断机号");

                                    if (vip != null && vip.getMoney() > 0) {

                                        Integer A = 0;

                                        Integer B = 0;
                                        //插入在线表
                                        A = surfInfoService.gonet(idnumber);

                                        B = surfInfoService.updatecomputerid(idnumber, computerid);
                                        if (A > 0 && B > 0) {

                                            msg = "ok";
                                        } else {
                                            msg = "error";
                                        }

                                    } else {

                                        msg = "nomoney";
                                    }

                                } else {
                                    System.out.println("返回fail");
                                    msg = "fail";
                                }
                            } else {
                                System.out.println("返回exit");
                                msg = "exit";
                            }
                        }else {
                            msg="faceerror";
                        }


                    }else {
                        msg="novip";
                    }
                }else {
                    msg="faceerror";
                }

            }
            else {
                msg="faceerror";
            }
        }else {
            msg="faceerror";
        }

        return  msg;


    }

    //添加会员

    @RequestMapping("/addvip")
    public   String addvip(String vip )  {
        String msg="";
        //将传来的json字符串解析对应的类型
        JsonObject jsonObject=null;
        if(vip!=null){
           jsonObject=new JsonParser().parse(vip).getAsJsonObject();
            if (jsonObject!=null){
                Long idnumber = null;
                String password =null;
                String realname =null;
                String sex = null;
                Integer age = null;
                String address = null;
                Long phonenumber =null;
                String facecode =null;
                if (jsonObject!=null){
                    idnumber = jsonObject.getAsJsonObject().get("idnumber").getAsLong();
                    password = jsonObject.getAsJsonObject().get("password").getAsString();
                    realname = jsonObject.getAsJsonObject().get("realname").getAsString();
                    sex = jsonObject.getAsJsonObject().get("sex").getAsString();
                    age = jsonObject.getAsJsonObject().get("age").getAsInt();
                    address = jsonObject.getAsJsonObject().get("address").getAsString();
                    phonenumber = jsonObject.getAsJsonObject().get("phonenumber").getAsLong();
                    facecode = jsonObject.getAsJsonObject().get("facecode").getAsString();
                    //去除base64图片的头
                    facecode = facecode.substring(facecode.indexOf(",")+1);
                    String S= FaceAdd.add(facecode,idnumber);
                    if(S!=null){
                        //解析api返回的face_token
                        JsonObject jsonObject1=new JsonParser().parse(S).getAsJsonObject();
                        if (jsonObject1!=null){
                            String face_token = jsonObject1.getAsJsonObject().get("result").getAsJsonObject().get("face_token").getAsString();
                            if(face_token!=null){
                                Vip vip1= vipService.selectVipByidnumber(idnumber);
                                if(vip1==null){
                                    Vip vip2 =new Vip(null,idnumber,null,password,realname,sex,age,address,phonenumber,null,face_token,null);
                                    vipService.addVip(vip2);
                                    msg="ok";
                                }else {
                                    msg="same";
                                }
                            }else {
                                msg="re";
                            }
                        }
                        else {
                            msg="re";
                        }
                    }else {
                        msg="error";
                    }
                }
            }
            else {
                msg="error";
            }
        }else {
            msg="error";
        }

        return msg;

    }


}
