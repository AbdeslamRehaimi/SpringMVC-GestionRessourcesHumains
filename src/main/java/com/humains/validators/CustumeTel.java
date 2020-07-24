package com.humains.validators;

import com.humains.entities.Employee;
import com.humains.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CustumeTel  implements ConstraintValidator<TelUnique, Employee>{
    @Autowired
    EmployeeService employeeService;
    public boolean isValid(Employee employee, ConstraintValidatorContext context) {
        try {
            return employeeService.findEmployeeByTel(employee.getTel())==null;
        } catch (Exception e)
        {
            return true;
        }
    }
}
