package com.aldrich.model;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

/**
 * @author aldrich
 * @date 2019/1/2 20:15
 */
@Setter
@Getter
@Component
public class Role implements Serializable {

    private static final long serialVersionUID = 7788060745436108946L;
    private int id;
    private String account;
    private String name;
    @JSONField(format="yyyy-MM-dd")
    private Date time;
    private String email;
    private String image;
    private String roleName;
    private int    roleType;
    private Boolean lock= Boolean.FALSE;

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", time=" + time +
                ", email='" + email + '\'' +
                ", image='" + image + '\'' +
                ", roleName='" + roleName + '\'' +
                ", roleType=" + roleType +
                ", lock=" + lock +
                '}';
    }
}
