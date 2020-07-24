package com.humains.validators;
import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Retention(RUNTIME)
@Target(ElementType.TYPE )
@Constraint(validatedBy = CustumeTel.class)
public @interface TelUnique {
    String message() default "Pardon! Ce tel est déjà utilisé";
    Class<?>[] groups() default { };
    Class<? extends Payload>[] payload() default { };
}
