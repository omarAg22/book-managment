package com.mycompany.librarymanager.servlet;

import com.mycompany.librarymanager.dao.BookDAO;
import com.mycompany.librarymanager.model.Book;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;


@WebServlet(name = "AddBookServlet", urlPatterns = {"/addBook"})

public class AddBookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the book details from the request parameters
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        boolean availability = Boolean.parseBoolean(request.getParameter("availability"));
        String category = request.getParameter("category");

        // Create a Book object with the provided details
        Book book = new Book(title, author, availability, category);

        // Create a BookDAO instance to interact with the database
        BookDAO bookDAO = new BookDAO();
        
        // Add the book to the database
        bookDAO.addBook(book);

        // Redirect to a success page or list the books
        response.sendRedirect("ViewBooksServlet");
    }
}
