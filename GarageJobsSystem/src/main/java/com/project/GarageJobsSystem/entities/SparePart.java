package com.project.GarageJobsSystem.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name="spare_parts")
public class SparePart {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int part_id;

	    private String part_name;
	    private int quantity;
	    private double cost;
	    @ManyToOne
	    @JoinColumn(name = "service_id", nullable = false)
	    private Services service;
		public int getPart_id() {
			return part_id;
		}

		public void setPart_id(int part_id) {
			this.part_id = part_id;
		}

		public String getPart_name() {
			return part_name;
		}

		public void setPart_name(String part_name) {
			this.part_name = part_name;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public double getCost() {
			return cost;
		}

		public void setCost(double cost) {
			this.cost = cost;
		}

		public Services getService() {
			return service;
		}

		public void setService(Services service) {
			this.service = service;
		}
	    
	    

}
