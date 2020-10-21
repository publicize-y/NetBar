package com.zy.Service;

import com.zy.Pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {
    Admin login(Long username, String password);

    List<Admin> getalladmin();

    int updateAdminByid(@Param("password") String password, @Param("id") Integer id);

    Admin selectAdminByid(@Param("id") Integer id);

    Admin selectIdByusername(@Param("username") String username);

    int deleteAdminByid(@Param("id") Integer id);
}
