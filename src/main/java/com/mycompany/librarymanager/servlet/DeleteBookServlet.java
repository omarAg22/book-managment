package com.mycompany.librarymanager.servlet;

import com.mycompany.librarymanager.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
 static final long serialVersionUID = 1L;
	private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get book ID from the request
        int id = Integer.parseInt(request.getParameter("id"));

        // Delete the book from the database
        bookDAO.deleteBook(id);

        // Redirect to the View Books page
        response.sendRedirect("ViewBooksServlet");
    }
}
