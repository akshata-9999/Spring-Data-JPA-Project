package com.project.GarageJobsSystem.entities;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table (name="vehicles")
public class Vehicle {
	@Id
	private int vehicle_id;
	 @ManyToOne
	 @JoinColumn(name = "customer_id", referencedColumnName = "customer_id")
	 private Customer customer;
	 @Column(name= "reg_number")
	private String regNumber;
	private String brand;
	private String model;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate purchase_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate last_service_date;
	
	
	public String getRegNumber() {
		return regNumber;
	}
	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}
	public int getVehicle_id() {
		return vehicle_id;
	}
	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}
	
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public LocalDate getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(LocalDate purchase_date) {
		this.purchase_date = purchase_date;
	}
	public LocalDate getLast_service_date() {
		return last_service_date;
	}
	public void setLast_service_date(LocalDate last_service_date) {
		this.last_service_date = last_service_date;
	}
	
	public boolean isServiceDue() {
        return last_service_date != null &&
               last_service_date.plusMonths(3).isBefore(LocalDate.now());
    }
}
