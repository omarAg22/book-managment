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

@WebServlet("/ViewBooksServlet")
public class ViewBooksServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the list of books
        List<Book> books = bookDAO.getAllBooks();
        
        
        // Set the books in the request scope
        request.setAttribute("books", books);
        
        // Forward to the view-books.jsp page
        request.getRequestDispatcher("view-books.jsp").forward(request, response);
    }
}
