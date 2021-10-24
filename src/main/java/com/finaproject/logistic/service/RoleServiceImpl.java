package com.finaproject.logistic.service;

import com.finaproject.logistic.entity.Role;
import com.finaproject.logistic.repository.RoleDAO;
import com.finaproject.logistic.service.interfaces.RoleService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class RoleServiceImpl implements RoleService {

    private RoleDAO roleDAO;

    @Autowired
    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @Override
    public List<Role> returnAllRoles() {
        return roleDAO.findAll();
    }

    @Override
    public Role returnRoleById(long id) {
        return roleDAO.getById(id);
    }

    @Override
    public List<Role> returnAllRolesWithoutSeveralRoles(long roleID1, long roleID2) {
        return roleDAO.findRolesWithoutSeveralRoles(roleID1,roleID2);
    }
}
