package com.finaproject.logistic.controller.annotation;




import com.finaproject.logistic.service.interfaces.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueLoginValidation implements ConstraintValidator<UniqueLogin, String> {
    @Autowired
    private UserRepository userRepository;
    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return s != null && !userRepository.isLoginAlreadyInUse(s);
    }
}
