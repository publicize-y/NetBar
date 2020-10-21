package com.zy.Pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SurfInfo {
    private Integer id;
    private  Long  idnumber;
    private String realname;
    private Date createtime;
    private Date exittime;
    private Integer money;
    private Integer computerid;
    private String condition;

}
