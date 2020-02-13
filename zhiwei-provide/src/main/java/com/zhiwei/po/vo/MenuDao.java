package com.zhiwei.po.vo;

import java.io.Serializable;

public class MenuDao  implements Serializable {
    private Integer id;
    private String name;
    private Integer pId;
    private boolean checked = false;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    @Override
    public String toString() {
        return "MenuDao{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pId=" + pId +
                ", checked=" + checked +
                '}';
    }
}
