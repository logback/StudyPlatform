package com.aldrich.model;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

/**
 * @author aldrich
 * @date 2019/1/2 21:37
 */
@Setter
@Getter
@Component("permission")
public class Permission implements Serializable {

    private static final long serialVersionUID = -2422153190481297059L;
    private int     id;
    private String  account;
    private String  name;
    private String    permissionType;
    private String  permissionName;

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", permissionType=" + permissionType +
                ", permissionName='" + permissionName + '\'' +
                '}';
    }
}
