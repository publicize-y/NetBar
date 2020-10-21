package com.zy.Service;

import com.zy.Dao.UservisiterMapper;
import com.zy.Pojo.UserVisiter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UservisiterServiceImpl implements UservisiterService {
    @Autowired
    private UservisiterMapper uservisiterMapper;

    public void setUservisiterMapper(UservisiterMapper uservisiterMapper) {
        this.uservisiterMapper = uservisiterMapper;
    }


    public List<UserVisiter> getallUserVisiter() {
        return uservisiterMapper.getallUserVisiter();
    }

    public List<UserVisiter> getUserVisiterbylike(String username) {
        return uservisiterMapper.getUserVisiterbylike(username);
    }

    public int deleteUservisiterbyid(Integer id) {
        return uservisiterMapper.deleteUservisiterbyid(id);
    }


}
