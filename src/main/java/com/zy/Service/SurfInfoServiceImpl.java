package com.zy.Service;

import com.zy.Dao.SurfInfoMapper;
import com.zy.Pojo.SurfInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SurfInfoServiceImpl  implements SurfInfoService{
    @Autowired
    private SurfInfoMapper surfInfoMapper;

    public List<SurfInfo> getall() {

        return surfInfoMapper.getall();

    }

    public int gonet(Long idnumber) {

        return surfInfoMapper.gonet(idnumber);

    }

    public int updatecomputerid(Long idnumber, Integer computerid) {

        return surfInfoMapper.updatecomputerid(idnumber,computerid);

    }

    public SurfInfo selectSurfinfoByIdnumber(Long idnumber) {

        return surfInfoMapper.selectSurfinfoByIdnumber(idnumber);

    }

    public SurfInfo selectSurfinfoByComputerid(Integer computerid) {

        return surfInfoMapper.selectSurfinfoByComputerid(computerid);

    }

    public int updateExittime(Integer id, Date exittime) {

        return surfInfoMapper.updateExittime(id,exittime);

    }

    public SurfInfo selectSurfinfoByid(Integer id) {

        return surfInfoMapper.selectSurfinfoByid(id);

    }

    public int deleteSurfInfoByid(Integer id) {
        return surfInfoMapper.deleteSurfInfoByid(id);
    }

    public int updateExittimeByvip(Long idnumber, Date exittime) {
        return surfInfoMapper.updateExittimeByvip(idnumber, exittime);
    }

    public int deleteSurfInfoByidnumber(Long idnumber) {

        return surfInfoMapper.deleteSurfInfoByidnumber(idnumber);

    }

    public int updatemoney(Integer money, Long idnumber) {

        return surfInfoMapper.updatemoney(money, idnumber);
    }


}
