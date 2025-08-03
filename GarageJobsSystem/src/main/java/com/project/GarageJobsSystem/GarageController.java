package com.project.GarageJobsSystem;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.GarageJobsSystem.entities.Customer;
import com.project.GarageJobsSystem.entities.Services;
import com.project.GarageJobsSystem.entities.User;
import com.project.GarageJobsSystem.entities.Vehicle;
import com.project.GarageJobsSystem.services.CustomerServices;
import com.project.GarageJobsSystem.services.JobCardServices;
import com.project.GarageJobsSystem.services.UserServices;
import com.project.GarageJobsSystem.services.VehicleServices;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GarageController {
	
	@Autowired
	UserServices userServices;
	
	
	@Autowired
	CustomerServices custServices;
	
	
	@GetMapping("/")
	public String homePage() {
		
		return "index.jsp";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register.jsp";
	}
	
	@PostMapping("/adduser")
	public String adduser(User obj, Model m) {
		String status= userServices.insertNewUser(obj);
		m.addAttribute("status",status);
		return "Status.jsp";
	}
	
	
	@PostMapping("/login")
	public String login(@RequestParam String username,@RequestParam String password_hash,Model m) {
	    String status = userServices.validateLogin(username, password_hash);
	    m.addAttribute("status", status);
	    return "Status.jsp"; // or forward to dashboard.jsp if success
	}
     
	
	@GetMapping("/customer")
    public String showAddCustomerForm() {
        return "addCustomer.jsp";
    }
	
	@PostMapping("/addCustomer")
	public String addCustomer(Customer customer, Model m) {
        String status = custServices.insertNewCustomer(customer);
        m.addAttribute("status", status);
        return "Status.jsp";
    }
	
	@GetMapping("/viewCust")
	public String viewCustomer(Model model) {
	    List<Customer> customer = custServices.allCustomers();
	    model.addAttribute("list", customer);
	    return "viewCustomers.jsp"; // Make sure the JSP is named viewCustomer.jsp
	}
	
	@GetMapping("/editCustomer")
	public String editCustomer(@RequestParam("customer_id") int customer_id, Model model) {
	    Customer customer = custServices.getCustomerById(customer_id);
	    if (customer != null) {
	        model.addAttribute("customer", customer);
	        return "editCustomer.jsp";
	    } else {
	        model.addAttribute("status", "Customer not found");
	        return "Status.jsp";
	    }
	}
	@PostMapping("/updateCustomer")
	public String updateCustomer(Customer customer, Model model) {
	    String status = custServices.updateCustomer(customer);
	    model.addAttribute("status", status);
	    return "redirect:/viewCustomers";  // triggers @GetMapping to reload list
	}

	@GetMapping("/viewCustomers")
	public String viewCustomers(Model model) {
	    List<Customer> customerList = custServices.allCustomers();
	    model.addAttribute("list", customerList);
	    return "viewCustomers.jsp";
	}
	
	@GetMapping("/deleteCustomer")
	public String deleteCustomer(@RequestParam("customer_id") int customerId, Model model) {
	    String status = custServices.deleteCustomer(customerId);
	    if (status.equals("success")) {
	        return "redirect:/viewCustomers";
	    } else {
	        model.addAttribute("status", "Customer deletion failed.");
	        return "Status.jsp";
	    }
	}
    
	@Autowired
	VehicleServices vehServices;
	
	@GetMapping("/dashboard")
	public String showDashboard(Model model) {
	    List<Vehicle> dueVehicles = vehServices.getDueVehicles();
	    model.addAttribute("dueCount", dueVehicles.size());
	    return "Dashboard.jsp";
	}

	@GetMapping("/registerVehicle")
	public String showVehicleForm(Model m) {
	    List<Customer> customers = custServices.getAllCustomers();
	    m.addAttribute("customers", customers);
	    m.addAttribute("vehicle", new Vehicle());
	    return "registerVehicles.jsp"; // NOT redirect!
	}

	@PostMapping("/addVehicle")
	public String addVehicle(@ModelAttribute Vehicle vehicle, Model m) {
	    String status = vehServices.insertNewVehicle(vehicle);
	    m.addAttribute("status", status);
	    return "Status.jsp";
	}

	@GetMapping("/viewVehicles")
	public String viewVehicles(Model model) {
		 List<Vehicle> vehicle = vehServices.getAllVehicle();
		 model.addAttribute("list", vehicle);
		return "viewVehicles.jsp";
	}
	
	@GetMapping("/editVehicle")
	public String editVehicle(@RequestParam("vehicle_id") int id, Model m) {
	    Vehicle vehicle = vehServices.getVehicleById(id); // fetch from DB
	    List<Customer> customers = custServices.getAllCustomers(); // for dropdown

	    m.addAttribute("vehicle", vehicle);
	    m.addAttribute("customers", customers);
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    m.addAttribute("purchaseDateStr", vehicle.getPurchase_date().format(formatter));
	    m.addAttribute("lastServiceDateStr", vehicle.getLast_service_date().format(formatter));

	    return "editVehicle.jsp";
	}

	
	@PostMapping("/updateVehicle")
	public String updateVehicle(@ModelAttribute Vehicle vehicle, Model m) {
	    vehServices.saveVehicle(vehicle); // assumes customer binding works
	    m.addAttribute("status", "Vehicle updated successfully");
	    return "redirect:/viewVehicles";
	}
	
	@GetMapping("/deleteVehicle")
	public String deleteVehicle(@RequestParam("vehicle_id") int id) {
	    vehServices.deleteveh(id);
	    return "redirect:/viewVehicles";
	}
	
	@Autowired
	JobCardServices jobServices;
    
	 @GetMapping("/createJobCard")
	    public String createJobCard(Model model) {
	        model.addAttribute("vehicles", vehServices.getAllVehicles());
	        Services service = new Services();
	        service.setSpareParts(new ArrayList<>()); // prevent null
	        model.addAttribute("service", service);
	        return "CraeteJobCard.jsp";
	    }

	    @PostMapping("/addJobCard")
	    public String saveJobCard(@ModelAttribute Services service, Model model) {
	        jobServices.saveJobCard(service);
	        model.addAttribute("service", new Services());
	        return "Dashboard.jsp";
	    }
	    
	    
	    @GetMapping("/jobCardList")
	    public String viewAllJobCards(Model model) {
	    	List<Services> pendingJobs = jobServices.getJobsByStatus("Pending");
	        model.addAttribute("jobCards", pendingJobs);
	        return "MarkJob.jsp";
	    }

	    // Mark job card as complete and show bill
	    @GetMapping("/markComplete")
	    public String markJobCardComplete(@RequestParam("jobId") int jobId, Model model) {
	        Services job = jobServices.completeJobAndUpdateVehicle(jobId);
	        model.addAttribute("job", job);
	        return "Bill.jsp";
	    }
	    
	    @GetMapping("/jobCard")
	    public String viewJobCards(@RequestParam(required = false) String status, Model model) {
	        List<Services> job;
	        if (status != null && !status.isEmpty()) {
	            job = jobServices.getJobsByStatus(status);
	        } else {
	            job = jobServices.getAllJobCards();
	        }
	        model.addAttribute("job", job);
	        return "jobCardList.jsp";
	    }
	    
	    @GetMapping("/complete")
	    public String markJobComplete(@RequestParam("jobId") int jobId , Model model) {
	    	 Services job = jobServices.getJobCardById(jobId);
	    	 model.addAttribute("job", job);  
	        return "Bill1.jsp";        
	    }


	    @GetMapping("/dueVehicles")
	    public String showDueVehicles(Model model) {
	        List<Vehicle> dueList = vehServices.getDueVehicles();
	        model.addAttribute("dueVehicles", dueList);
	        return "DueVehicles.jsp";
	    }
	    
	    @GetMapping("/logout")
	    public String logout(HttpServletRequest request) {
	        request.getSession().invalidate();
	        return "index.jsp";  // Redirect to login or home page
	    }


}
