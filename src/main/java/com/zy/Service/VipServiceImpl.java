package com.zy.Service;

import com.zy.Dao.VipMapper;
import com.zy.Pojo.Vip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipServiceImpl implements VipService {
    @Autowired
    private VipMapper vipMapper;

    public void setVipMapper(VipMapper vipMapper) {
        this.vipMapper = vipMapper;
    }

    public List<Vip> getallVip() {
        return vipMapper.getallVip();
    }

    public int updateVipByid(Vip vip) {

        return vipMapper.updateVipByid(vip);

    }

    public Vip selectVipByid(Integer id) {
        return vipMapper.selectVipByid(id);
    }

    public Vip selectVipByidnumber(Long idnumber) {

        return vipMapper.selectVipByidnumber(idnumber);

    }

    public int deleteVipByid(Integer id) {
        return vipMapper.deleteVipByid(id);
    }

    public int addVip(Vip vip) {
        return vipMapper.addVip(vip);
    }

    public List<Vip> getVipbylike(String realname) {
        return vipMapper.getVipbylike(realname);
    }

    public int updatemoney(Integer money, Long idnumber) {

        return vipMapper.updatemoney(money,idnumber);

    }

    public int selectMoneybyIdnumber(long idnumber) {

        return vipMapper.selectMoneybyIdnumber(idnumber);
    }

    public int updatemoney1(Integer money, Long idnumber) {

        return vipMapper.updatemoney1(money,idnumber);

    }

    public Vip viplogin(Long idnumber, String password) {
        return vipMapper.viplogin(idnumber,password);
    }

    public int updateVipPasswordByid(String password, Integer id) {
        return vipMapper.updateVipPasswordByid(password, id);
    }


}
