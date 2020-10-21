package com.zy.Service;

import com.zy.Pojo.SurfInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SurfInfoService {

    List<SurfInfo> getall();

    //根据卡号插入到在线表
    int gonet(Long idnumber);

    int updatecomputerid(Long idnumber, Integer computerid);

    SurfInfo selectSurfinfoByIdnumber(Long idnumber);

    SurfInfo selectSurfinfoByComputerid(Integer computerid);

    int updateExittime(Integer id, Date exittime);

    SurfInfo selectSurfinfoByid(Integer id);

    int deleteSurfInfoByid(Integer id);

    int updateExittimeByvip(Long idnumber, Date exittime);

    int deleteSurfInfoByidnumber(@Param("idnumber") Long idnumber);

    int updatemoney(@Param("money") Integer money, @Param("idnumber") Long idnumber);



}
