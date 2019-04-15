package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * @author aldrich
 * @date 2018/12/24 8:52
 */
@Setter
@Getter
@Component("Word")
public class Word implements Serializable {


    private static final long serialVersionUID = -584984524459878727L;
    private int    id;
    private String name;
    private String eSound;
    private String eSymbol;


    @Override
    public String toString() {
        return "Word{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", eSound='" + eSound + '\'' +
                ", eSymbol='" + eSymbol + '\'' +
                '}';
    }

}
