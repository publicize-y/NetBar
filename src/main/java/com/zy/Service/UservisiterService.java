package com.zy.Service;

import com.zy.Pojo.UserVisiter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UservisiterService {
    List<UserVisiter> getallUserVisiter();

    List<UserVisiter> getUserVisiterbylike(@Param("username") String username);

    int deleteUservisiterbyid(@Param("id") Integer id);


}
