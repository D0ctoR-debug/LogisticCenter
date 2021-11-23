package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;


public interface UserService extends UserDetailsService {

    boolean isLoginAlreadyInUse(String login);

    boolean saveUser(User user);

    UserDetails loadUserByUsername(String s) throws UsernameNotFoundException;

    User returnUserByUsername(String username);

    void deleteUser(long id);

}
