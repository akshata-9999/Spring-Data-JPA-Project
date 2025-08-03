package com.project.GarageJobsSystem.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.GarageJobsSystem.entities.Customer;
import com.project.GarageJobsSystem.entities.Vehicle;
import com.project.GarageJobsSystem.repositories.CustomerRepository;
import com.project.GarageJobsSystem.repositories.VehicleRepository;

@Service
public class VehicleServices {
	
	@Autowired
	VehicleRepository vehRepo;
	
	@Autowired
    private CustomerRepository custRepo;
	
	public void saveVehicle(Vehicle vehicle) {
	    vehRepo.save(vehicle);
	}

	public String insertNewVehicle(Vehicle vehicle) {
		String status = "";
	    try {
	        if (vehRepo.existsByRegNumber(vehicle.getRegNumber())) {
	            status = "Registration failed: Registration number already exists";
	        } else {
	            vehRepo.save(vehicle);
	            status = "Add Vehicle success";
	        }
	    } catch (Exception e) {
	        status = "Registration failed: " + e.getMessage();
	        e.printStackTrace();
	    }
	    return status;
	}

	public List<Vehicle> getAllVehicle() {
		List<Vehicle> lst = vehRepo.findAll();
		return lst;
	}
	
	   public Vehicle getVehicleById(int id) {
	        return vehRepo.findById(id).orElse(null);
	    }
	
	   public String updateVehicleWithCustomer(Vehicle vehicle, int customerId) {
	        try {
	            Customer customer = custRepo.findById(customerId).orElse(null);
	            if (customer == null) {
	                return "Update failed: Customer not found";
	            }
	            vehicle.setCustomer(customer);
	            vehRepo.save(vehicle);
	            return "Vehicle updated successfully";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "Update failed: " + e.getMessage();
	        }
	    }
	   
	   public String deleteveh(int vehicleId) {
		    String status = "";
		    Optional<Vehicle> veh = vehRepo.findById(vehicleId);
		    if (veh.isPresent()) {
		        vehRepo.delete(veh.get());
		        status = "success";
		    } else {
		        status = "failed";
		    }
		    return status;
		}
	   
	   public List<Vehicle> getAllVehicles() {
		    return vehRepo.findAllWithCustomer();
		}

	   public List<Vehicle> getDueVehicles() {
	        LocalDate cutoffDate = LocalDate.now().minusMonths(3);
	        return vehRepo.findVehiclesDueForService(cutoffDate);
	    }
	   
}
