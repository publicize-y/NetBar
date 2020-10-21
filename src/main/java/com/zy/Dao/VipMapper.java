package com.zy.Dao;

import com.zy.Pojo.Vip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VipMapper {


    List<Vip> getallVip();

    int updateVipByid(Vip vip);

    Vip selectVipByid(@Param("id") Integer id);

    Vip selectVipByidnumber(@Param("idnumber") Long idnumber);

    int deleteVipByid(@Param("id") Integer id);

    int addVip(Vip vip);

    List<Vip> getVipbylike(@Param("realname") String realname);
    //充值
    int updatemoney(@Param("money") Integer money, @Param("idnumber") Long idnumber);
    //扣费
    int updatemoney1(@Param("money") Integer money, @Param("idnumber") Long idnumber);

    int selectMoneybyIdnumber(@Param("idnumber") Long idnumber);
    //普通用户登录
    Vip viplogin(@Param("idnumber") Long idnumber, @Param("password") String password);
    //用户修改密码
    int updateVipPasswordByid(@Param("password") String password, @Param("id") Integer id);


}
