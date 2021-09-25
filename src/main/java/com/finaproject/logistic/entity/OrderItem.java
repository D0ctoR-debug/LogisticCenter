package com.finaproject.logistic.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "order_item")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private int quantity;

//
//
//    @ManyToMany(mappedBy = "basketItems", fetch = FetchType.EAGER)
//    private List<Service> services;


    public OrderItem() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

//    public List<Service> getServices() {
//        return services;
//    }
//
//    public void setServices(List<Service> services) {
//        this.services = services;
//    }
}
