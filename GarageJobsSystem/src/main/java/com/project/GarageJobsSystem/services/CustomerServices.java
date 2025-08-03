package com.project.GarageJobsSystem.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.GarageJobsSystem.entities.Customer;
import com.project.GarageJobsSystem.repositories.CustomerRepository;

@Service
public class CustomerServices {
	
	@Autowired
	CustomerRepository custRepo;
	
	
	public String insertNewCustomer(Customer customer) {
		String status = "";
	    try {
	        if (custRepo.existsByPhone(customer.getPhone())) {
	            status = "Registration failed: Phone number already exists";
	        } else {
	            custRepo.save(customer);
	            status = "Add Customer success";
	        }
	    } catch (Exception e) {
	        status = "Registration failed: " + e.getMessage();
	        e.printStackTrace();
	    }
	    return status;
	}
	
	public List<Customer> allCustomers() {
		List<Customer> lst = custRepo.findAll();
		return lst;
	}
	
	public Customer getCustomerById(int customer_id) {
	    return custRepo.findById(customer_id).orElse(null);
	}
	
	public String updateCustomer(Customer updatedCustomer) {
	    Optional<Customer> existing = custRepo.findById(updatedCustomer.getCustomer_id());
	    if (existing.isPresent()) {
	        custRepo.save(updatedCustomer);  // save() updates if ID exists
	        return "Customer updated successfully";
	    }
	    return "Customer not found";
	}
	
	public String deleteCustomer(int customerId) {
	    String status = "";
	    Optional<Customer> customerOpt = custRepo.findById(customerId);
	    if (customerOpt.isPresent()) {
	        custRepo.delete(customerOpt.get());
	        status = "success";
	    } else {
	        status = "failed";
	    }
	    return status;
	}
	
	public List<Customer> getAllCustomers() {
        return custRepo.findAll();
    }
}
