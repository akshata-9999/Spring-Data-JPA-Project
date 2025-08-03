package com.project.GarageJobsSystem.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.GarageJobsSystem.entities.User;
import com.project.GarageJobsSystem.repositories.UserRepository;

@Service
public class UserServices {
	@Autowired
	UserRepository userRepo;
	public String insertNewUser(User obj) {
	    String status = "";
	    try {
	        if (userRepo.existsById(obj.getUser_id())) {
	            status = "Registration failed: User ID already exists";
	        } else {
	            userRepo.save(obj);
	            status = "Registration success";
	        }
	    } catch (Exception e) {
	        status = "Registration failed: " + e.getMessage();
	        e.printStackTrace();
	    }
	    return status;
	}
	
	public String validateLogin(String username, String password_hash) {
        Optional<User> userOpt = userRepo.findByUsername(username);

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            // Compare raw password with stored password_hash
            if (user.getPassword_hash().equals(password_hash)) {
                return "Login success";
            } else {
                return "Invalid password";
            }
        } else {
            return "Username not found";
        }
    }
}
