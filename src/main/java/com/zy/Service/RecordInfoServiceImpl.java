package com.zy.Service;

import com.zy.Dao.RecordInfoMapper;
import com.zy.Pojo.RecordInfo;
import com.zy.Pojo.SurfInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordInfoServiceImpl implements RecordInfoService {
    @Autowired
    private RecordInfoMapper recordInfoMapper;

//    public int insertrecord(Long idnumber) {
//        SurfInfo surfInfo = recordInfoMapper.buIdnumber(idnumber);
//
//        System.out.println(surfInfo+"@@@@@@@@@@@@@@@@@@");
//
//        recordInfoMapper.insertrecord(surfInfo);
//
//        return surfInfo.getId();
//    }


    public void insertrecord(SurfInfo surfInfo) {

        recordInfoMapper.insertrecord(surfInfo);

    }

    public List<RecordInfo> getAllRecord() {
        return recordInfoMapper.getAllRecord();
    }


    public int deleteRecordbyId(Integer id) {
        return recordInfoMapper.deleteRecordbyId(id);
    }

    public int updatemoneybyId(Integer id, Integer usemoney) {

        return recordInfoMapper.updatemoneybyId(id,usemoney);

    }

    public int updatemoneybyIdnumber(Long idnumber, Integer usemoney) {

        return recordInfoMapper.updatemoneybyIdnumber(idnumber,usemoney);

    }

    public List<RecordInfo> getRecordbylike(String realname) {

        return recordInfoMapper.getRecordbylike(realname);

    }


}
