package com.finaproject.logistic.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "characteristics")
public class ProductsCharacteristics {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String name;

    @Column
    private double value;

    @ManyToMany(mappedBy = "characteristics")
    private Set<Service> services;

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

    public Set<Service> getServices() {
        return services;
    }

    public void setServices(Set<Service> services) {
        this.services = services;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }
}
