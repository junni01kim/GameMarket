package dto;

import java.io.Serializable;

public class Game implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String gameId; 		    //책 ID
	private String name;			//책이름
	private int  unitPrice; 	    //가격
	private String producer;			//제작사
	private String description; 	//설명
	private String publisher;	    //출판사
	private String category; 		//분류
	private String releaseDate;   //출판일(월/년)
	private String condition; 		//신제품 or 구제품 or 리퍼브제품
	private String filename;        //이미지
	private int rating = 0;
	private int ratingCount = 0;
	private String review = "";
	

	public Game() {
		super();
}

	public Game(String gameId, String name) {
		this.gameId = gameId;
		this.name = name;
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String author) {
		this.producer = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getRating() {
		int averageRating = rating/ratingCount;
		String stars = "";
		for(int i=0; i<averageRating; i++) stars += "★";
		for(int i=0; i<5-averageRating; i++) stars += "☆";
		return stars;
	}
	
	public void setRating(int rating) {
		this.rating += rating;
		addRatingCount();
	}
	
	public String getReiview() {
		return review;
	}
	
	public void setReview(String review) {
		this.review = review;
	}
	
	public void addRatingCount() {
		ratingCount++;
	}
}
