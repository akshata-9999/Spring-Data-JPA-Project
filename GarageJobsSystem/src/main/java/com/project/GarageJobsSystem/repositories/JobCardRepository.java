package com.project.GarageJobsSystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.GarageJobsSystem.entities.Services;

@Repository
public interface JobCardRepository extends JpaRepository<Services, Integer>{
	List<Services> findByStatus(String status);

}
