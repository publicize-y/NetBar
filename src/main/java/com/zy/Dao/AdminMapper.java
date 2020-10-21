package com.zy.Dao;

import com.zy.Pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
   Admin login(@Param("username") Long username, @Param("password") String password);

   List<Admin> getalladmin();

   int updateAdminByid(@Param("password") String password, @Param("id") Integer id);

   Admin selectAdminByid(@Param("id") Integer id);

   int deleteAdminByid(@Param("id") Integer id);

   Admin selectcodeByusername(@Param("username") String username);


}
