package com.finaproject.logistic.form;

public class ServiceForm {

    private long id;
    private String name;
    private double price;

    private boolean newService = false;

    public ServiceForm() {
        this.newService = true;
    }

    public ServiceForm(long id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isNewService() {
        return newService;
    }

    public void setNewService(boolean newService) {
        this.newService = newService;
    }
}
