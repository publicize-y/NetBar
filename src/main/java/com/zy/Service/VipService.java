package com.zy.Service;

import com.zy.Pojo.Vip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VipService {
    List<Vip> getallVip();

    int updateVipByid(Vip vip);

    Vip selectVipByid(Integer id);

    Vip selectVipByidnumber(Long idnumber);

    int deleteVipByid(Integer id);

    int addVip(Vip vip);

    List<Vip> getVipbylike(String realname);
    //充值
    int updatemoney(@Param("money") Integer money, Long idnumber);

    int selectMoneybyIdnumber(long idnumber);
    //扣费
    int updatemoney1(@Param("money") Integer money, @Param("idnumber") Long idnumber);

    Vip viplogin(@Param("idnumber") Long idnumber, @Param("password") String password);

    int updateVipPasswordByid(@Param("password") String password, @Param("id") Integer id);
}
