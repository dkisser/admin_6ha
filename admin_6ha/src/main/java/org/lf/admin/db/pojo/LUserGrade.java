package org.lf.admin.db.pojo;

import java.util.Date;

public class LUserGrade {
    private Integer id;

    private String userName;

    private Integer oldGrade;

    private Integer newGrade;

    private Integer price;

    private Date czsj;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Integer getOldGrade() {
        return oldGrade;
    }

    public void setOldGrade(Integer oldGrade) {
        this.oldGrade = oldGrade;
    }

    public Integer getNewGrade() {
        return newGrade;
    }

    public void setNewGrade(Integer newGrade) {
        this.newGrade = newGrade;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getCzsj() {
        return czsj;
    }

    public void setCzsj(Date czsj) {
        this.czsj = czsj;
    }
}