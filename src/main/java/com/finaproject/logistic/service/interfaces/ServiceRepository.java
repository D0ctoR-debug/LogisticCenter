package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.Service;

public interface ServiceRepository {
    double calculatePriceOfWarehouse(double tons, double days);

//    Service returnServiceById(long id);
}
