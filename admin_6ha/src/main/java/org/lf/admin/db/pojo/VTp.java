package org.lf.admin.db.pojo;

import java.util.Date;

public class VTp {
    private Integer id;

    private String dm;

    private Integer lx;

    private String sqr;

    private String imgurl;

    private String href;

    private Date date;

    private Integer zt;

    private String fzr;

    private String glr;

    private byte[] remark;
    
    private String remarkStr;

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
        this.dm = dm == null ? null : dm.trim();
    }

    public Integer getLx() {
        return lx;
    }

    public void setLx(Integer lx) {
        this.lx = lx;
    }

    public String getSqr() {
        return sqr;
    }

    public void setSqr(String sqr) {
        this.sqr = sqr == null ? null : sqr.trim();
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getZt() {
        return zt;
    }

    public void setZt(Integer zt) {
        this.zt = zt;
    }

    public String getFzr() {
        return fzr;
    }

    public void setFzr(String fzr) {
        this.fzr = fzr == null ? null : fzr.trim();
    }

    public String getGlr() {
        return glr;
    }

    public void setGlr(String glr) {
        this.glr = glr == null ? null : glr.trim();
    }

    public byte[] getRemark() {
        return remark;
    }

    public void setRemark(byte[] remark) {
        this.remark = remark;
    }

	public String getRemarkStr() {
		return remarkStr;
	}

	public void setRemarkStr(String remarkStr) {
		this.remarkStr = remarkStr;
	}
}