package com.aldrich.model;


import java.util.List;

public class Page<T> {
    private int total;
    private List<T> data;
    private int total1;
    private List<T> data1;
    private int total2;
    private List<T> data2;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public int getTotal1() {
        return total1;
    }

    public void setTotal1(int total1) {
        this.total1 = total1;
    }

    public List<T> getData1() {
        return data1;
    }

    public void setData1(List<T> data1) {
        this.data1 = data1;
    }

    public int getTotal2() {
        return total2;
    }

    public void setTotal2(int total2) {
        this.total2 = total2;
    }

    public List<T> getData2() {
        return data2;
    }

    public void setData2(List<T> data2) {
        this.data2 = data2;
    }
}
