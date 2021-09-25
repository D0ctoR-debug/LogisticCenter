package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.Basket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface BasketDAO extends JpaRepository<Basket, Long> {

}
