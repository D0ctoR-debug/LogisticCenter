package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    User findByUsername(String username);
//    @Query(value = "select role.users from Role role where role.id=:id")
//    List<User> findAllByRoleID(int id);
}
