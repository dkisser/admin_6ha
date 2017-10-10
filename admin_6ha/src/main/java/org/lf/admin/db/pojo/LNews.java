package org.lf.admin.db.pojo;

import java.util.Date;

public class LNews {
    private Integer id;

    private String dm;

    private String czr;

    private Integer oldZt;

    private Integer newZt;

    private Date date;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDm() {
        return dm;
    }

    public void setDm(String dm) {
        this.dm = dm;
    }

    public String getCzr() {
        return czr;
    }

    public void setCzr(String czr) {
        this.czr = czr == null ? null : czr.trim();
    }

    public Integer getOldZt() {
        return oldZt;
    }

    public void setOldZt(Integer oldZt) {
        this.oldZt = oldZt;
    }

    public Integer getNewZt() {
        return newZt;
    }

    public void setNewZt(Integer newZt) {
        this.newZt = newZt;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}