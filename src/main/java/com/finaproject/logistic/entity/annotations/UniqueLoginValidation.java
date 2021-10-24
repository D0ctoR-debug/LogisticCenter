package com.finaproject.logistic.entity.annotations;

import com.finaproject.logistic.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueLoginValidation implements ConstraintValidator<UniqueLogin, String> {
    @Autowired
    private UserService userRepository;
    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return s != null && !userRepository.isLoginAlreadyInUse(s);
    }
}