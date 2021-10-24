package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDAO extends JpaRepository<Role,Long> {
    @Query(value = "from Role role where not role.id =:roleId1 and not role.id =:roleId2")
    List<Role> findRolesWithoutSeveralRoles(long roleId1, long roleId2);
}
