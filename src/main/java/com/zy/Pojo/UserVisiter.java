package com.zy.Pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVisiter {
    private Integer id;
    private Date login_time;
    private Date exit_time;
    private String visit_ip;
    private String user_address;
    private String user_from;
    private String browser;
    private String system;
    private String version;
    private String loginname;
    private String iphone;
}
