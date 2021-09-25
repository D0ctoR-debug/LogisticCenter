package com.finaproject.logistic.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

@Entity
public class Service {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String name;

    @Column
    private String description;

    @Column
    private String imageUrl;



//    @Column
//    private String result;

//    @Column
//    private double pricePerTon;
//
//    @Column
//    private double pricePerKm;
//
//    @Column
//    private double pricePerName;

//    @Column
//    private java.sql.Timestamp serviceTime;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "basket_item",
            joinColumns = {@JoinColumn(name = "service_id")},
            inverseJoinColumns = {@JoinColumn(name = "basket_id")})
    private List<Basket> baskets;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "order_item",
            joinColumns = {@JoinColumn(name = "service_id")},
            inverseJoinColumns = {@JoinColumn(name = "order_id")})
    private List<Orders> orders;

    @ManyToMany
    @JoinColumn(name = "characteristics_id")
    private Set<ProductsCharacteristics> characteristics;


    public Service() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Basket> getBaskets() {
        return baskets;
    }

    public void setBaskets(List<Basket> baskets) {
        this.baskets = baskets;
    }

    public List<Orders> getOrders() {
        return orders;
    }

    public Set<ProductsCharacteristics> getCharacteristics() {
        return characteristics;
    }

    public void setCharacteristics(Set<ProductsCharacteristics> characteristics) {
        this.characteristics = characteristics;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }
}