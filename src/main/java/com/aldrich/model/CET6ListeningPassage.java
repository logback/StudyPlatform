package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@ToString@Getter@Setter
public class CET6ListeningPassage implements Serializable {
    private int id;
    private String selectA;
    private String selectB;
    private String selectC;
    private String selectD;
    private String answer;
    private String parsing;
}
