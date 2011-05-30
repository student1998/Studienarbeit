package de.hofuniversity.sta.ts.model;

import java.util.Date;
public class Event {
	

	//Veranstaltung beschreibung

	private int eventID;
	private String title;
	private String description;
	
	private int ticketAmount;
	private int soldTickets;
	private int status;
	
	private Date eventDate;
	private Date beginDate;
	private Date endDate;
	
	private int viewings;
	private float rating;
	
	public Event (){
		
	}
	
	public int getEventID() {
		return eventID;
	}
	public void setEventID(int eventID) {
		this.eventID = eventID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getTicketAmount() {
		return ticketAmount;
	}
	public void setTicketAmount(int ticketAmount) {
		this.ticketAmount = ticketAmount;
	}
	public int getSoldTickets() {
		return soldTickets;
	}
	public void setSoldTickets(int soldTickets) {
		this.soldTickets = soldTickets;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getViewings() {
		return viewings;
	}
	public void setViewings(int viewings) {
		this.viewings = viewings;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Event [eventID=" + eventID + ", title=" + title
				+ ", description=" + description + ", ticketAmount="
				+ ticketAmount + ", soldTickets=" + soldTickets + ", status="
				+ status + ", eventDate=" + eventDate + ", beginDate="
				+ beginDate + ", endDate=" + endDate + ", viewings=" + viewings
				+ ", rating=" + rating + "]";
	}
}

