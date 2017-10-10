package org.lf.admin.db.pojo;

public class CGroup {
    private Integer id;

    private String mc;

    private String fzr;

    private String glr;

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