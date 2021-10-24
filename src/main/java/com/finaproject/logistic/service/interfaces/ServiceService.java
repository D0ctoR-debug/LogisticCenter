package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.Service;

import java.util.List;

public interface ServiceService {
    double calculatePriceOfWarehouse(double tons, double days);

    Service returnServiceById(long id);

    List<Service> returnAllServices();

//    Service returnServiceById(long id);
}
