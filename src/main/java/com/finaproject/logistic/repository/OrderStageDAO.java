package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.OrderStage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderStageDAO extends JpaRepository<OrderStage, Long> {
}
