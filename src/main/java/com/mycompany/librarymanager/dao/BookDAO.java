package com.mycompany.librarymanager.dao;

import com.mycompany.librarymanager.model.Book;
import com.mycompany.librarymanager.util.DBUtil;
import java.sql.Connection;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private final Connection connection;

    public BookDAO() {
        connection = DBUtil.getConnection();
    }

    public void addBook(Book book) {
        String sql = "INSERT INTO books (title, author, availability, categorie) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setBoolean(3, book.isAvailabile());
            stmt.setString(4, book.getCategory());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAvailabilityAndDates(int id, boolean availability, Date borrowDate, Date returnDate) {
        String sql = "UPDATE books SET availability = ?, borrow_date = ?, return_date = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setBoolean(1, availability);
            stmt.setDate(2, new java.sql.Date(borrowDate.getTime()));
            stmt.setDate(3, new java.sql.Date(returnDate.getTime()));
            stmt.setInt(4, id);
            stmt.executeUpdate();
            System.out.println("Updated Book ID: " + id + " with Borrow Date: " + borrowDate + " and Return Date: " + returnDate);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book getBookById(int id) {
        String sql = "SELECT id, title, author, availability, categorie, borrow_date, return_date FROM books WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setAvailabile(rs.getBoolean("availability"));
                book.setCategory(rs.getString("categorie"));

                // Fetch borrow_date and return_date
                book.setBorrowDate(rs.getDate("borrow_date"));
                book.setReturnDate(rs.getDate("return_date"));  // Add this line

                return book;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setAvailabile(rs.getBoolean("availability"));
                book.setCategory(rs.getString("categorie"));
                book.setBorrowDate(rs.getDate("borrow_date"));
                book.setReturnDate(rs.getDate("return_date"));  // Add this line
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
    }

    public void deleteBook(int id) {
        String sql = "DELETE FROM books WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int rowsDeleted = stmt.executeUpdate();
            System.out.println("Rows deleted: " + rowsDeleted); // Debug log
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void returnBook(int id) {
        String sql = "UPDATE books SET availability = ?, borrow_date = NULL, return_date = NULL WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setBoolean(1, true); // Set availability to true (Available)
            stmt.setInt(2, id);       // Book ID

            stmt.executeUpdate();
            System.out.println("Returned Book ID: " + id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Book> searchBooks(String query) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ? OR categorie LIKE ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            // Use wildcards (%) to match any part of the string
            stmt.setString(1, "%" + query + "%");
            stmt.setString(2, "%" + query + "%");
            stmt.setString(3, "%" + query + "%");

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setAvailabile(rs.getBoolean("availability"));
                book.setCategory(rs.getString("categorie"));
                book.setBorrowDate(rs.getDate("borrow_date"));
                book.setReturnDate(rs.getDate("return_date"));  // Add this line
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public List<Book> getBorrowedBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE availability = false";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setAvailabile(rs.getBoolean("availability"));
                book.setCategory(rs.getString("categorie"));
                book.setBorrowDate(rs.getDate("borrow_date"));
                book.setReturnDate(rs.getDate("return_date"));  // Add this line
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
    }
}
