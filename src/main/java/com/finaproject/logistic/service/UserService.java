package com.finaproject.logistic.service;

import com.finaproject.logistic.entity.Role;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UserService implements UserRepository {

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private UserDAO userDAO;


    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }

    public boolean saveUser(User user) {
        User userFromDB = userDAO.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRole(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userDAO.save(user);
        return true;
    }

    public boolean isLoginAlreadyInUse(String username) {
        boolean userInDb = true;
        if (userDAO.findByUsername(username) == null) userInDb = false;
        return userInDb;
    }

}
