package com.finaproject.logistic.validator;

import com.finaproject.logistic.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserFormValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"name","user.name.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"username","user.username.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password","user.password.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"passwordConfirm","user.passConf.empty");

    }
}
