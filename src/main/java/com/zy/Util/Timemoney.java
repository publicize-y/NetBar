package com.zy.Util;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Timemoney {

    public Integer getmoney(Date createtime,Date exittime){

         long time = createtime.getTime();

         long time1 =exittime.getTime();
         //获取时间差
         long  h = (((time1 - time) / (60 * 60 * 1000)));

         Integer money =0;

         Integer  hour= (int) h;
         //五元一小时
         money = (hour+1) *  5;

        return money;
    }

}
