package com.zy.Pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecordInfo {
    private  Integer id;
    private  Long  idnumber;
    private String realname;
    private Date createtime;
    private Date exittime;
    private Integer usemoney;
    private Integer computerid;
    private Date date;

}
