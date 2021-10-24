package com.finaproject.logistic.entity;

import javax.persistence.*;
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
    @Column
    private double cost;
    @Column
    private double price;

    private int quantity;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

//    @ManyToMany(cascade = CascadeType.ALL)
//    @JoinTable(name = "basket_item",
//            joinColumns = {@JoinColumn(name = "service_id")},
//            inverseJoinColumns = {@JoinColumn(name = "basket_id")})
//    private List<Basket> baskets;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "order_item",
            joinColumns = {@JoinColumn(name = "service_id")},
            inverseJoinColumns = {@JoinColumn(name = "order_id")})
    private List<Order> orders;

    @ManyToMany
    @JoinColumn(name = "characteristics_id")
    private Set<ProductsCharacteristics> characteristics;

//    @ManyToMany
//    @JoinTable(name = "basket_item_service",
//            joinColumns = @JoinColumn(name = "service_id"),
//            inverseJoinColumns = @JoinColumn(name = "basket_item_id"))
//    private List<BasketItem> basketItems;


    public Service() {
    }

    public Service(String name, String description, String imageUrl, double cost, double price, int quantity) {
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
        this.cost = cost;
        this.price = price;
        this.quantity = quantity;
    }

    public Service(String name, String description, String imageUrl, double cost, double price) {
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
        this.cost = cost;
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

//    public List<Basket> getBaskets() {
//        return baskets;
//    }
//
//    public void setBaskets(List<Basket> baskets) {
//        this.baskets = baskets;
//    }

    public List<Order> getOrders() {
        return orders;
    }

    public Set<ProductsCharacteristics> getCharacteristics() {
        return characteristics;
    }

    public void setCharacteristics(Set<ProductsCharacteristics> characteristics) {
        this.characteristics = characteristics;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

//    public List<BasketItem> getBasketItems() {
//        return basketItems;
//    }
//
//    public void setBasketItems(List<BasketItem> basketItems) {
//        this.basketItems = basketItems;
//    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}