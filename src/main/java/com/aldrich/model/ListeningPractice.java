package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter@Setter
public class ListeningPractice implements Serializable {
    private int id;
    private String selectA;
    private String selectB;
    private String selectC;
    private String selectD;
    private String answer;
    private String parsing;

    @Override
    public String toString() {
        return "ListeningPractice{" +
                "id=" + id +
                ", selectA='" + selectA + '\'' +
                ", selectB='" + selectB + '\'' +
                ", selectC='" + selectC + '\'' +
                ", selectD='" + selectD + '\'' +
                ", answer='" + answer + '\'' +
                ", parsing='" + parsing + '\'' +
                '}';
    }
}
