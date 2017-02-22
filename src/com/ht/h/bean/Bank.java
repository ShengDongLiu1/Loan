package com.ht.h.bean;

import java.util.Date;

/**
 * 银行卡信息表
 * @author LiuShengDong
 *
 */
public class Bank {
    private Integer bid;

    private Integer uid;

    private String baccount;

    private String bcardnumber;

    private Date btime;

    private String bstate;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getBaccount() {
        return baccount;
    }

    public void setBaccount(String baccount) {
        this.baccount = baccount == null ? null : baccount.trim();
    }

    public String getBcardnumber() {
        return bcardnumber;
    }

    public void setBcardnumber(String bcardnumber) {
        this.bcardnumber = bcardnumber == null ? null : bcardnumber.trim();
    }

    public Date getBtime() {
        return btime;
    }

    public void setBtime(Date btime) {
        this.btime = btime;
    }

    public String getBstate() {
        return bstate;
    }

    public void setBstate(String bstate) {
        this.bstate = bstate == null ? null : bstate.trim();
    }
}