package com.zy.Dao;

import com.zy.Pojo.SurfInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SurfInfoMapper {

    List<SurfInfo> getall();

    //根据卡号插入到在线表
    int gonet(@Param("idnumber") Long idnumber);
    //添加机号
    int updatecomputerid(@Param("idnumber") Long idnumber, @Param("computerid") Integer computerid);

    SurfInfo selectSurfinfoByIdnumber(@Param("idnumber") Long idnumber);

    SurfInfo selectSurfinfoByComputerid(@Param("computerid") Integer computerid);

    int updateExittime(@Param("id") Integer id, @Param("exittime") Date exittime);

    int updateExittimeByvip(@Param("idnumber") Long idnumber, @Param("exittime") Date exittime);

    SurfInfo selectSurfinfoByid(@Param("id") Integer id);

    int deleteSurfInfoByid(@Param("id") Integer id);

    int deleteSurfInfoByidnumber(@Param("idnumber") Long idnumber);

    SurfInfo selectinfobyIdnumber(@Param("idnumber") Long idnumber);
    //充值
    int updatemoney(@Param("money") Integer money, @Param("idnumber") Long idnumber);


}
