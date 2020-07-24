package com.humains.controllers;

import com.humains.entities.Departement;
import com.humains.entities.Employee;
import com.humains.entities.Remuneration;
import com.humains.exceptions.ResourceNotFoundException;
import com.humains.security.SHA1;
import com.humains.services.DepartementService;
import com.humains.services.EmployeeService;
import com.humains.services.RemunerationService;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@Aspect
@RequestMapping("/departement")
public class DepartementController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartementService departementService;

    @GetMapping(value = {"/list","/page/{id}"})
    public String home(@PathVariable(name="id",required = false) Optional<Integer> id, ModelMap model)
    {
        Page<Departement> pages = departementService.findAllDepartements(id, 50, "id");
        model.addAttribute("pageable", pages);
        return "department/departement-list";
    }

    @GetMapping("/add")
    public String add(ModelMap model,Departement departement) {
        model.addAttribute("departement", departement);
        return "department/departement-edite";
    }

    @GetMapping("/add/{id}")
    public String edit(@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        model.addAttribute("departement", departementService.findById(id));
        return "department/departement-edite";
    }

    @PostMapping("/save")
    public String saveTag(@Valid @ModelAttribute("departement") Departement departement, BindingResult result, ModelMap model) throws ResourceNotFoundException {
        if(result.hasErrors()){
            model.addAttribute("departement",departement);
            return "department/departement-edite";
        }
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        if (departement.getCreated() == null && departement.getModified() == null){
            departement.setCreated(timestamp);
            departement.setModified(timestamp);
        }else{
            departement.setModified(timestamp);
        }
        departementService.save(departement);
        return "redirect:/departement/list";
    }

    @GetMapping("/delete/{page}/{id}")
    public String delete(@PathVariable("page") long page,@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        departementService.deleteById(id);
        return "redirect:/departement/page/"+page;
    }
}
