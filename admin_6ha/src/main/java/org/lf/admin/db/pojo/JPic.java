package org.lf.admin.db.pojo;

import org.lf.admin.db.dao.PagedPojo;

public class JPic extends PagedPojo{
    private Integer id;

    private String mc;

    private String yxlx;

    private Integer picLx;

    private Integer num;

    private String imgurl;

    private String href;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMc() {
        return mc;
    }

    public void setMc(String mc) {
        this.mc = mc == null ? null : mc.trim();
    }

    public String getYxlx() {
        return yxlx;
    }

    public void setYxlx(String yxlx) {
        this.yxlx = yxlx == null ? null : yxlx.trim();
    }

    public Integer getPicLx() {
        return picLx;
    }

    public void setPicLx(Integer picLx) {
        this.picLx = picLx;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href == null ? null : href.trim();
    }
}