package com.finaproject.logistic.model;

import com.finaproject.logistic.entity.Service;

public class WarehouseLogisticInfo {

    private long id;
    private String name;
    private double pricePerHour;
    private double pricePerTon;

    public WarehouseLogisticInfo() {
    }


    public WarehouseLogisticInfo(long id, String name, double pricePerHour, double pricePerTon) {
        this.id = id;
        this.name = name;
        this.pricePerHour = pricePerHour;
        this.pricePerTon = pricePerTon;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPricePerHour() {
        return pricePerHour;
    }

    public void setPricePerHour(double pricePerHour) {
        this.pricePerHour = pricePerHour;
    }

    public double getPricePerTon() {
        return pricePerTon;
    }

    public void setPricePerTon(double pricePerTon) {
        this.pricePerTon = pricePerTon;
    }
}
