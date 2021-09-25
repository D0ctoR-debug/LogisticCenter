package com.finaproject.logistic.service;

import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.repository.DaoService;
import com.finaproject.logistic.repository.ServiceDAO;
import com.finaproject.logistic.service.interfaces.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

@org.springframework.stereotype.Service
public class ServiceService implements ServiceRepository {

    private ServiceDAO serviceDAO;
    private DaoService daoService;

    @Autowired
    public void setDaoService(DaoService daoService) {
        this.daoService = daoService;
    }

    @Autowired
    public void setServiceDAO(ServiceDAO serviceDAO) {
        this.serviceDAO = serviceDAO;
    }

    @Override
    public double calculatePriceOfWarehouse(double tons, double hours) {
        return (tons * hours);
    }

//    @Override
//    public Service returnServiceById(long id) {
//        return daoService.getOne(id);
//    }

}
