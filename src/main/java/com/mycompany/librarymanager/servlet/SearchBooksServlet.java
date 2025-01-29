package com.mycompany.librarymanager.servlet;

import com.mycompany.librarymanager.dao.BookDAO;
import com.mycompany.librarymanager.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchBooksServlet")
public class SearchBooksServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the search query from the request
        String query = request.getParameter("query");
        
        // If no query is provided, redirect to ViewBooksServlet
        if (query == null || query.trim().isEmpty()) {
            response.sendRedirect("ViewBooksServlet");
            return;
        }

        // Fetch books matching the search query
        List<Book> books = bookDAO.searchBooks(query.trim());

        // Set the filtered books as a request attribute
        request.setAttribute("books", books);

        // Forward to the view-books.jsp page
        request.getRequestDispatcher("view-books.jsp").forward(request, response);
    }
}
