package com.mycompany.librarymanager.servlet;

import com.mycompany.librarymanager.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Calendar;
import java.util.*;

@WebServlet("/BorrowBookServlet")
public class BorrowBookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Set the availability to false (book is borrowed)
        Calendar calendar = Calendar.getInstance();
        java.util.Date borrowDate = calendar.getTime();
                    calendar.add(Calendar.DAY_OF_MONTH, 7);
            Date returnDate = calendar.getTime();
        
        // Update the book availability and dates in the database
        bookDAO.updateAvailabilityAndDates(id, false, borrowDate, returnDate);
       
        // Redirect to the View Books page
        response.sendRedirect("ViewBooksServlet");
    }
}
