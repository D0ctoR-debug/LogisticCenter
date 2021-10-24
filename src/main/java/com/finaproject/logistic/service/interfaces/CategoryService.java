package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryService extends JpaRepository<Category,Long> {

}
