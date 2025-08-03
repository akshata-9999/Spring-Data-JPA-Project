package com.project.GarageJobsSystem.repositories;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.GarageJobsSystem.entities.Vehicle;

@Repository
public interface VehicleRepository extends JpaRepository<Vehicle, Integer>{

	boolean existsByRegNumber(String regnumber);
	
	@Query("SELECT v FROM Vehicle v JOIN FETCH v.customer")
	List<Vehicle> findAllWithCustomer();
	
	@Query("SELECT v FROM Vehicle v WHERE v.last_service_date <= :cutoffDate")
    List<Vehicle> findVehiclesDueForService(@Param("cutoffDate") LocalDate cutoffDate);

}
