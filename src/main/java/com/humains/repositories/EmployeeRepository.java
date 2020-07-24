package com.humains.repositories;

import com.humains.entities.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    Page<Employee> findAll(Pageable pageable);

    @Query("select e from Employee e where e.manager.id=:id")
    List<Employee> findBySous_jacents(@Param("id") long id);


    @Query("select e from Employee e where e.cin=:cin")
    Employee findByCin(@Param("cin") String cin);

    @Query("select e from Employee e where e.email=:email")
    Employee findByEmail(@Param("email") String email);

    @Query("select e from Employee e where e.tel=:tel")
    Employee findByTel(@Param("tel") String tel);

    @Query("select e from Employee e where e.email=:email and e.password=:password")
    Employee findByEmailAndPassword(@Param("email") String tel, @Param("password") String password);

    @Query("select DISTINCT e.manager from Employee e")
    Page<Employee> findManagers(Pageable pageable);


}
