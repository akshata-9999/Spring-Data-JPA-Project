package com.project.GarageJobsSystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.GarageJobsSystem.entities.SparePart;

@Repository
public interface SparePartRepository extends JpaRepository<SparePart, Integer> {
	
}