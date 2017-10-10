package org.lf.admin.db.pojo;

public class Menu {
    private Integer id;

    private String menuName;

    private String url;

    private String mennuIcon;

    private Integer parentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getMennuIcon() {
        return mennuIcon;
    }

    public void setMennuIcon(String mennuIcon) {
        this.mennuIcon = mennuIcon == null ? null : mennuIcon.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}