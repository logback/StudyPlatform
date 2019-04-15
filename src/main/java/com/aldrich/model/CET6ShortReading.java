package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Setter@Getter@ToString
public class CET6ShortReading implements Serializable {
    private int id;
    private String article;
    private String topic;
    private String selectA;
    private String selectB;
    private String selectC;
    private String selectD;
    private String answer;
    private String parsing;
}
