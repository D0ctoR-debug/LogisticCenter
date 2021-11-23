package com.finaproject.logistic.entity.annotations;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = UniqueLoginValidation.class)
@Retention(RetentionPolicy.RUNTIME) //доступ после компиляции
@Target({ElementType.FIELD}) //применение на поле
public @interface UniqueLogin {
    String message() default "User with such username already exist.";
    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default{};
}