package org.lf.admin.db.pojo;

public class VNews {
    private Integer id;

    private String dm;
    
    private Integer lx;

    private String title;

    private String sqr;

    private String imgurl;

    private String href;

    private String date;

    private Integer zt;

    private byte[] remark;
    
    private String remarkStr;
    
    private String fzr;

    private String glr;

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

	public Integer getLx() {
        return lx;
    }

    public void setLx(Integer lx) {
        this.lx = lx;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public Integer getZt() {
        return zt;
    }

    public void setZt(Integer zt) {
        this.zt = zt;
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
    
}