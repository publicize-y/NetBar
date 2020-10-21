package com.zy.Service;

import com.zy.Pojo.RecordInfo;
import com.zy.Pojo.SurfInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecordInfoService {



    void insertrecord(SurfInfo surfInfo);

    List<RecordInfo> getAllRecord();

//    int insertComputerid(Integer computerid, Long idnumber);

    int deleteRecordbyId(Integer id);

    int updatemoneybyId(Integer id, Integer usemoney);

    int updatemoneybyIdnumber(Long idnumber, Integer usemoney);

    List<RecordInfo> getRecordbylike(@Param("realname") String realname);
}
