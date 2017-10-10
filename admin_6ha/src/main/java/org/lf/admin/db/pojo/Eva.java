package org.lf.admin.db.pojo;

public class Eva {
    private Integer id;

    private String evaName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEvaName() {
        return evaName;
    }

    public void setEvaName(String evaName) {
        this.evaName = evaName == null ? null : evaName.trim();
    }
}