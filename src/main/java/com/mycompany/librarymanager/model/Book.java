package com.mycompany.librarymanager.model;

import java.sql.Date;

public class Book {
    private int id;              // Book ID
    private String title;        // Book title
    private String author;       // Book author
    private boolean availability; // Availability (true = available, false = borrowed)
    private String category;     // Book category
    private Date borrowDate;
    private Date returnDate;

    // Default constructor
    public Book() {
    }

    // Parameterized constructor
    public Book( String title, String author, boolean availability, String category) {
        
        this.title = title;
        this.author = author;
        this.availability = availability;
        this.category = category;
    }
    public Date getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public boolean isAvailabile() {
        return availability;
    }

    public void setAvailabile(boolean availability) {
        this.availability = availability;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // Override toString() for easier debugging
    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", availability=" + availability +
                ", category='" + category + '\'' +
                '}';
    }
}
