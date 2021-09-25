package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.Service;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

@Transactional
@Repository
public class ServiceDAO {


    @Autowired
    private SessionFactory sessionFactory;

    public Service findService(long id) {
        try {
            String sql = "Select e from " + Service.class.getName() + " e Where e.id =:id ";

            Session session = this.sessionFactory.getCurrentSession();
            Query<Service> query = session.createQuery(sql, Service.class);
            query.setParameter("id", id);
            return (Service) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
