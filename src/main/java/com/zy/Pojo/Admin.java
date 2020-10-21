package com.zy.Pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private  Integer id;
    private String realname;
    private  Long  username;
    private  String  password;
    private  Integer age;
    private  String  sex;
    private Date createtime;
    private  String  code;
    private  Integer root;

}
