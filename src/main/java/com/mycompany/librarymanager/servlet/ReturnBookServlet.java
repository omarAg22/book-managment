package com.mycompany.librarymanager.servlet;

import com.mycompany.librarymanager.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Fetch the book ID from the form
            int bookId = Integer.parseInt(request.getParameter("id"));

            // Call DAO method to return the book (reset availability and clear dates)
            bookDAO.returnBook(bookId);

            // Redirect to View Books page
            response.sendRedirect("ViewBooksServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error returning the book: " + e.getMessage());
        }
    }
}
