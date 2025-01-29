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

@WebServlet("/BorrowedBooksServlet")
public class BorrowedBooksServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all books that are currently borrowed (availability = false)
        List<Book> borrowedBooks = bookDAO.getBorrowedBooks();

        // Pass the borrowed books to the JSP
        request.setAttribute("borrowedBooks", borrowedBooks);

        // Forward the request to the borrowed-books.jsp page
        request.getRequestDispatcher("borrowed-books.jsp").forward(request, response);
    }
}
