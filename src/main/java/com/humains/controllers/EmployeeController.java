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
//@RequestMapping("/employee")
@RequestMapping(value = {"","/employee"})
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartementService departementService;

    @Autowired
    private RemunerationService remunerationService;

    @GetMapping(value = {""})
    public String indexLogin(ModelMap model , Employee user){
        model.addAttribute("user", user);
        return "user/user-login";
    }

    @GetMapping(value = {"/home","/page/{id}"})
    public String home(@PathVariable(name="id",required = false) Optional<Integer> id, ModelMap model)
    {
        Page<Employee> pages = employeeService.findAllEmployees(id, 4, "id");
        model.addAttribute("pageable", pages);
        return "home/employee-list";
    }


    @PostMapping(value = {"/login"})
    public String login(@ModelAttribute("user") Employee user, BindingResult result, ModelMap model , HttpSession session) throws ResourceNotFoundException, Exception {
        if(result.hasErrors()){
            model.addAttribute("user",user);
            System.out.println(result);
            System.out.println("__________________________________________________");
            return "user/user-login";
        }

        String hachedPass = SHA1.getSHA1(user.getPassword());

        if(employeeService.findEmployeeByEmailAndPassword(user.getEmail(), hachedPass)){
            session.setAttribute("Error", null);
            System.out.println("Welcome Back");
            session.setAttribute("fullName", employeeService.findEmployeeByEmail(user.getEmail()).getNom()+" " + employeeService.findEmployeeByEmail(user.getEmail()).getPrenom());
            session.setAttribute("role", employeeService.findEmployeeByEmail(user.getEmail()).getRole());
            session.setAttribute("ConnectedUser", employeeService.findEmployeeByEmail(user.getEmail()));
            session.setAttribute("image", employeeService.findEmployeeByEmail(user.getEmail()).getImage());
            return "redirect:/home/";
        }else{
            user.setEmail(null);
            user.setPassword(null);
            System.out.println("Unvailable");
            session.setAttribute("Error", "Pardons nous ne pouvons pas verifier vos informations !");
            return "user/user-login";
        }
    }


    @GetMapping("/add")
    public String add(ModelMap model,Employee employee) {
        model.addAttribute("departements", departementService.findAll());
        model.addAttribute("remunerations", remunerationService.findAll());
        model.addAttribute("employee", employee);
        model.addAttribute("employees",employeeService.notUsedEmployees());
        return "home/employee-edite";
    }


    @PostMapping("/save")
    public String saveArticle(@Valid @ModelAttribute("employee") Employee employee, BindingResult result, ModelMap model, HttpSession session) throws ResourceNotFoundException {
        if(result.hasErrors()){
            model.addAttribute("departements", departementService.findAll());
            model.addAttribute("remunerations", remunerationService.findAll());
            model.addAttribute("employee", employee);
            if(!employee.getPassword().equals(employee.getConfirmedPassword())){
                session.setAttribute("pass", "Les deux password non identique !");
            }else{
                session.setAttribute("pass", null);
            }

            System.out.println(result);
            return "home/employee-edite";
        }
        session.setAttribute("pass", null);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        employeeService.ajouterEmployee(employee);
        return "redirect:/employee/home";
    }

    @GetMapping("/delete/{page}/{id}")
    public String delete(@PathVariable("page") long page,@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        employeeService.supprimmerEmployee(id);
        return "redirect:/employee/home";
    }

    @GetMapping("/add/{id}")
    public String edit(@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        Employee employee = employeeService.findById(id);
        employee.setPassword(null);
        /*
        List <Departement> departement = new ArrayList<>() ;
        List <Remuneration> remuneration = new ArrayList<>() ; ;

        departement.add(departementService.findById(employee.getDepartement().getId()));
        remuneration.add(remunerationService.findById(employee.getRemuneration().getId()));



        model.addAttribute("departements", departement);
        model.addAttribute("remunerations", remuneration);
        */
        model.addAttribute("departements", departementService.findAll());
        model.addAttribute("remunerations", remunerationService.findAll());
        model.addAttribute("employee", employee);
        return "home/employee-edite";
    }

    @RequestMapping("/employeeShow/{id}")
    public String viewEmp(@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        model.addAttribute("employee",employeeService.findById(id));

        return "home/employee-show";
    }


    @GetMapping(value = {"/managers","/page/{id}"})
    public String managers(@PathVariable(name="id",required = false) Optional<Integer> id, ModelMap model)
    {
        Page<Employee> pages = employeeService.findManagers(id, 4, "id");
        model.addAttribute("pageable", pages);
        System.out.println("-------------");
        return "managers/managers-list";
    }

    @RequestMapping("/manager/{id}")
    public String view(@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        model.addAttribute("manager",employeeService.findById(id));
        model.addAttribute("sousjacent",employeeService.findAllSous_jacents(id));

        return "managers/managers-show";
    }


    @RequestMapping("/managerAdd/{id}")
    public String addToManager(@PathVariable("id") long id, ModelMap model) throws ResourceNotFoundException {
        model.addAttribute("manager",employeeService.findById(id));
        model.addAttribute("employees",employeeService.notUsedEmployees());
        return "managers/managers-edite";
    }


    @GetMapping(value = {"/disconnecte"})
    public String disconnect( ModelMap model ,Employee user, HttpSession session){

        session.removeAttribute("fullName");
        session.removeAttribute("role");
        session.removeAttribute("ConnectedUser");
        session.removeAttribute("image");
        session.invalidate();
        model.addAttribute("user",user);
        return "redirect:/";
    }
}
