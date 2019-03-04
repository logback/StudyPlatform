package com.aldrich.model;



import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import java.io.Serializable;

/**
 * @author aldrich
 * @date 2018/11/26 22:05
 */
@Getter
@Setter
public class Student implements Serializable {
    private int    id;
    private String name;
    private String pwd;

    public Student(int id, String name, String pwd) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
