package com.project.GarageJobsSystem.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table (name="services")
public class Services {
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int service_id;
	 @ManyToOne
	 @JoinColumn(name = "vehicle_id", nullable = false)
	 private Vehicle vehicle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate service_date;
	private String service_type;
	private String description;
	private BigDecimal cost;
	private String status;
	
	@OneToMany(mappedBy = "service", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SparePart> spareParts;

	
	public List<SparePart> getSpareParts() {
		return spareParts;
	}
	public void setSpareParts(List<SparePart> spareParts) {
		this.spareParts = spareParts;
	}
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int service_id) {
		this.service_id = service_id;
	}
	
	public Vehicle getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public LocalDate getService_date() {
		return service_date;
	}
	public void setService_date(LocalDate service_date) {
		this.service_date = service_date;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getCost() {
		return cost;
	}
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	 public void addSparePart(SparePart part) {
	        part.setService(this);
	        this.spareParts.add(part);
	    }
	

}
