package com.project.GarageJobsSystem.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.GarageJobsSystem.entities.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	
	boolean existsByPhone(String phone);
	Optional<Customer> findById(int customer_id);

}
