package com.aldrich.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;


public class Practice implements Serializable {
    private int id;
    private String article;
    private String topic;
    private String selectA;
    private String selectB;
    private String selectC;
    private String selectD;
    private String answer;
    private String parsing;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getSelectA() {
        return selectA;
    }

    public void setSelectA(String selectA) {
        this.selectA = selectA;
    }

    public String getSelectB() {
        return selectB;
    }

    public void setSelectB(String selectB) {
        this.selectB = selectB;
    }

    public String getSelectC() {
        return selectC;
    }

    public void setSelectC(String selectC) {
        this.selectC = selectC;
    }

    public String getSelectD() {
        return selectD;
    }

    public void setSelectD(String selectD) {
        this.selectD = selectD;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getParsing() {
        return parsing;
    }

    public void setParsing(String parsing) {
        this.parsing = parsing;
    }

    @Override
    public String toString() {
        return "Practice{" +
                "id=" + id +
                ", article='" + article + '\'' +
                ", topic='" + topic + '\'' +
                ", selectA='" + selectA + '\'' +
                ", selectB='" + selectB + '\'' +
                ", selectC='" + selectC + '\'' +
                ", selectD='" + selectD + '\'' +
                ", answer='" + answer + '\'' +
                ", parsing='" + parsing + '\'' +
                '}';
    }
}
