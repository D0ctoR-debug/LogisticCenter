package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.Role;

import java.util.List;

public interface RoleService {
    List<Role> returnAllRoles();

    Role returnRoleById(long id);

    List<Role> returnAllRolesWithoutSeveralRoles(long roleID1, long roleID2);

}
