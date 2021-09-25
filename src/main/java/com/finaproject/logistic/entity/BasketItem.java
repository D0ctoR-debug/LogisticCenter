package com.finaproject.logistic.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "basket_item")
public class BasketItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private int quantity;



//    @ManyToMany(mappedBy = "basketItems")
//    private List<Service> services;

    public BasketItem() {
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


}
