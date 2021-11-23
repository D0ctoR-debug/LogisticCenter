package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.Service;

import java.util.List;

public interface ServiceService {

    Service returnServiceById(long id);

    List<Service> returnAllServices();

}
