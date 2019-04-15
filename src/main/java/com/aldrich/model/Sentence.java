package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * @author aldrich
 * @date 2018/12/27 10:15
 */
@Setter
@Getter
@Component("sentence")
public class Sentence implements Serializable {

    private static final long serialVersionUID = 6513017398665946450L;
    private int    id;
    private String keyWord;
    private int    typeId;
    private String typeName;
    private String content;
    private String translate;

    @Override
    public String toString() {
        return "Sentence{" +
                "id=" + id +
                ", keyWord='" + keyWord + '\'' +
                ", typeId=" + typeId +
                ", typeName='" + typeName + '\'' +
                ", content='" + content + '\'' +
                ", translate='" + translate + '\'' +
                '}';
    }
}
