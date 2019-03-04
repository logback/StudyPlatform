package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter@Setter
public class Cloze implements Serializable {
    private int id;
    private String article;
    private String select;
    private String select1;
    private String select2;
    private String select3;
    private String select4;
    private String select5;
    private String select6;
    private String select7;
    private String select8;
    private String select9;
    private String select10;
    private String translate;

    @Override
    public String toString() {
        return "Cloze{" +
                "id=" + id +
                ", article='" + article + '\'' +
                ", select='" + select + '\'' +
                ", select1='" + select1 + '\'' +
                ", select2='" + select2 + '\'' +
                ", select3='" + select3 + '\'' +
                ", select4='" + select4 + '\'' +
                ", select5='" + select5 + '\'' +
                ", select6='" + select6 + '\'' +
                ", select7='" + select7 + '\'' +
                ", select8='" + select8 + '\'' +
                ", select9='" + select9 + '\'' +
                ", select10='" + select10 + '\'' +
                ", translate='" + translate + '\'' +
                '}';
    }
}
