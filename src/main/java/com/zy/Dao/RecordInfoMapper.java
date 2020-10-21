package com.zy.Dao;

import com.zy.Pojo.RecordInfo;
import com.zy.Pojo.SurfInfo;
import com.zy.Pojo.Vip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecordInfoMapper {
    //根据卡号插记录
    void insertrecord(SurfInfo surfInfo);

//    SurfInfo buIdnumber (@Param("idnumber") Long idnumber);

//    int insertComputerid(@Param("computerid") Integer computerid, @Param("idnumber") Long idnumber);

    List<RecordInfo> getAllRecord();

    int deleteRecordbyId(@Param("id") Integer id);

    int updatemoneybyId(@Param("id") Integer id, @Param("usemoney") Integer usemoney);

    int updatemoneybyIdnumber(@Param("idnumber") Long idnumber, @Param("usemoney") Integer usemoney);

    List<RecordInfo> getRecordbylike(@Param("realname") String realname);
}
