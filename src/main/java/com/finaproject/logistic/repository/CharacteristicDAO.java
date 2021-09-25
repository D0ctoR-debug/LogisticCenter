package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.ProductsCharacteristics;
import com.finaproject.logistic.entity.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface CharacteristicDAO extends JpaRepository<ProductsCharacteristics, Long> {

    ProductsCharacteristics findById(long id);

    ProductsCharacteristics findByName(String name);

    Set<ProductsCharacteristics> findByServices(Service service);

}
