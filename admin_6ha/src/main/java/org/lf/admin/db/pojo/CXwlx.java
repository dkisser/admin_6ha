package org.lf.admin.db.pojo;

public class CXwlx {
    private Integer id;

    private Integer lxId;

    private Integer lxPid;

    private String lxName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLxId() {
        return lxId;
    }

    public void setLxId(Integer lxId) {
        this.lxId = lxId;
    }

    public Integer getLxPid() {
        return lxPid;
    }

    public void setLxPid(Integer lxPid) {
        this.lxPid = lxPid;
    }

    public String getLxName() {
        return lxName;
    }

    public void setLxName(String lxName) {
        this.lxName = lxName == null ? null : lxName.trim();
    }
}