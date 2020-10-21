package com.zy.Dao;

import com.zy.Pojo.UserVisiter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UservisiterMapper {
    List<UserVisiter> getallUserVisiter();

    List<UserVisiter> getUserVisiterbylike(@Param("loginname") String username);

    int deleteUservisiterbyid(@Param("id") Integer id);


}
