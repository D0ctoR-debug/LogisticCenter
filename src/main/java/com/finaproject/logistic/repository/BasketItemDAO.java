package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.BasketItem;

import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BasketItemDAO extends JpaRepository<BasketItem, Long> {

    List<BasketItem> findByUser(User user);

    BasketItem findByUserAndService(User user, Service service);

}
