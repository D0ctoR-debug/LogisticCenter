package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface DaoService extends JpaRepository<Service, Long> {
    List<Service> findByCategoryId(long id);

}
