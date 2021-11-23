package com.finaproject.logistic.service;

import com.finaproject.logistic.entity.Role;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.RoleDAO;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    private UserDAO userDAO;
    private RoleDAO roleDAO;

    @Autowired
    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return User.fromUser(user);
    }

    @Override
    public User returnUserByUsername(String username) {
        return null;
    }

    @Override
    public void deleteUser(long id) {
        User user = userDAO.getById(id);
        user.getRole().clear();
        userDAO.delete(user);
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream().map(r -> new SimpleGrantedAuthority(r.getName())).collect(Collectors.toList());
    }

    public boolean saveUser(User user) {
        User userFromDB = userDAO.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRole(Collections.singleton(new Role(3L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setDiscount(2.5);
        userDAO.save(user);
        return true;
    }

    public boolean isLoginAlreadyInUse(String username) {
        boolean userInDb = true;
        if (userDAO.findByUsername(username) == null) userInDb = false;
        return userInDb;
    }
}
