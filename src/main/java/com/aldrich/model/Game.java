package com.aldrich.model;

public class Game {
    String name;
    String meaning;
    int word_id;
    int id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public int getWord_id() {
        return word_id;
    }

    public void setWord_id(int word_id) {
        this.word_id = word_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public Game(String name, String meaning) {
        this.name = name;
        this.meaning = meaning;
    }

    public Game(String meaning) {
        this.meaning = meaning;
    }

    @Override
    public String toString() {
        return "Game{" +
                "name='" + name + '\'' +
                ", meaning='" + meaning + '\'' +
                ", word_id=" + word_id +
                ", id=" + id +
                '}';
    }
}
