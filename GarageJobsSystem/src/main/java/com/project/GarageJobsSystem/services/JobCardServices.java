package com.project.GarageJobsSystem.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.GarageJobsSystem.entities.Services;
import com.project.GarageJobsSystem.entities.SparePart;
import com.project.GarageJobsSystem.entities.Vehicle;
import com.project.GarageJobsSystem.repositories.JobCardRepository;
import com.project.GarageJobsSystem.repositories.VehicleRepository;

import jakarta.transaction.Transactional;

@Service
public class JobCardServices {
	@Autowired
	private JobCardRepository jobRepo;

	@Autowired
	private VehicleRepository vehRepo;

	
	public void saveJobCard(Services service) {

        if (service.getSpareParts() != null) {
            for (SparePart part : service.getSpareParts()) {
                part.setService(service);
            }
        }
        jobRepo.save(service); 
    }
	
	public List<Services> getAllJobCards() {
	    return jobRepo.findAll();
	}

	public void updateJobCard(Services job) {
	    jobRepo.save(job); // or serviceRepository.save(job)
	}
	
	public Services getJobCardById(int id) {
	    return jobRepo.findById(id).orElse(null);
	}

	@Transactional
    public Services completeJobAndUpdateVehicle(int jobId) {
        Services job = jobRepo.findById(jobId)
                .orElseThrow(() -> new RuntimeException("Job not found with ID: " + jobId));

        // Mark job as complete
        job.setStatus("Complete");

        // Update last service date on vehicle
        Vehicle vehicle = job.getVehicle();
        if (vehicle != null) {
            vehicle.setLast_service_date(job.getService_date());
            vehRepo.save(vehicle);
        }

        return jobRepo.save(job);
    }
	
	public List<Services> getJobsByStatus(String status) {
	    return jobRepo.findByStatus(status);
	}



}

