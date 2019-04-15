package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * @author aldrich
 * @date 2018/12/26 18:55
 */
@Setter
@Getter
@Component("wordPojo")
public class WordPojo implements Serializable {

    private static final long serialVersionUID = -2423918414041893325L;
    private int    id;
    private String name;
    private String eSound;
    private String eSymbol;
    private String aSymbol;
    private String aSound;
    private String type;
    private String level;
    private String meaning;

    @Override
    public String toString() {
        return "WordPojo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", eSound='" + eSound + '\'' +
                ", eSymbol='" + eSymbol + '\'' +
                ", aSymbol='" + aSymbol + '\'' +
                ", aSound='" + aSound + '\'' +
                ", type='" + type + '\'' +
                ", level='" + level + '\'' +
                ", meaning='" + meaning + '\'' +
                '}';
    }
}
