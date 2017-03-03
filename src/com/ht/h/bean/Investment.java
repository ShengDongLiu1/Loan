package com.ht.h.bean;

import java.util.Date;

public class Investment {
    private Integer iid;

    private Integer iuid;

    private Integer lid;

    private Long imoney;

    private String inumber;

    private Date itime;

    private Long iavailable;

    public Integer getIid() {
        return iid;
    }

    public void setIid(Integer iid) {
        this.iid = iid;
    }

    public Integer getIuid() {
        return iuid;
    }

    public void setIuid(Integer iuid) {
        this.iuid = iuid;
    }

    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public Long getImoney() {
        return imoney;
    }

    public void setImoney(Long imoney) {
        this.imoney = imoney;
    }

    public String getInumber() {
        return inumber;
    }

    public void setInumber(String inumber) {
        this.inumber = inumber == null ? null : inumber.trim();
    }

    public Date getItime() {
        return itime;
    }

    public void setItime(Date itime) {
        this.itime = itime;
    }

    public Long getIavailable() {
        return iavailable;
    }

    public void setIavailable(Long iavailable) {
        this.iavailable = iavailable;
    }
}