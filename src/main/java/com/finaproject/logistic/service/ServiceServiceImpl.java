package com.finaproject.logistic.service;

import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.repository.DaoService;
import com.finaproject.logistic.service.interfaces.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;
import java.util.List;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {

    private DaoService daoService;

    @Autowired
    public void setDaoService(DaoService daoService) {
        this.daoService = daoService;
    }

    @Override
    @Transactional
    public Service returnServiceById(long id) {
        return daoService.getById(id);
    }

    @Override
    public List<Service> returnAllServices() {
        return daoService.findAll();
    }

}
