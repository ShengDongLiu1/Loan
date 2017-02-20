package com.ht.h.bean;

import java.util.Date;

public class Test {
    private Integer tid;

    private String tname;

    private String tsex;

    private Date tdata;

    private Long tmoney;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex == null ? null : tsex.trim();
    }

    public Date getTdata() {
        return tdata;
    }

    public void setTdata(Date tdata) {
        this.tdata = tdata;
    }

    public Long getTmoney() {
        return tmoney;
    }

    public void setTmoney(Long tmoney) {
        this.tmoney = tmoney;
    }
}