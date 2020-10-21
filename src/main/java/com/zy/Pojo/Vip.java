package com.zy.Pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Vip {
    private Integer id;
    private Long idnumber;
    private  Integer money;
    private String  password;
    private  String realname;
    private  String sex;
    private Integer age;
    private String address;
    private  Long phonenumber;
    private Date createtime;
    private String facecode;
    private  Integer root;




}
