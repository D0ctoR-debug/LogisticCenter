package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.OrderStage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStageDAO extends JpaRepository<OrderStage, Long> {
}
