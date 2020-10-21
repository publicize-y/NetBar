package com.zy.Service;

import com.zy.Dao.AdminMapper;
import com.zy.Pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl  implements  AdminService{
    @Autowired
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {

        this.adminMapper = adminMapper;

    }


    public Admin login(Long username, String password) {
        return adminMapper.login(username,password);
    }

    public List<Admin> getalladmin() {
        return adminMapper.getalladmin();
    }

    public int updateAdminByid(String password, Integer id) {
        return adminMapper.updateAdminByid(password,id);
    }

    public Admin selectAdminByid(Integer id) {
        return adminMapper.selectAdminByid(id);
    }

    public Admin selectIdByusername(String username) {
        return adminMapper.selectcodeByusername(username);
    }


    public int deleteAdminByid(Integer id) {
        return adminMapper.deleteAdminByid(id);
    }
}
