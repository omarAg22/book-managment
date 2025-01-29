<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.librarymanager.dao.BookDAO" %>
<%@ page import="com.mycompany.librarymanager.model.Book" %>

<%
    // Fetch the book ID from the URL parameter
    String idParam = request.getParameter("id");
    int bookId = Integer.parseInt(idParam);

    // Use BookDAO to fetch the book details
    BookDAO bookDAO = new BookDAO();
    Book book = bookDAO.getBookById(bookId);

    // Handle case where no book is found
    if (book == null) {
        request.setAttribute("errorMessage", "No book found with the specified ID (" + bookId + ").");
%>
        <jsp:forward page="ViewBooksServlet" />
<%
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Book</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom Styles -->
    <style>
        /* Navigation Bar */
        .navbar-brand {
            font-size: 1.8rem;
            font-family: sans-serif;
            font-weight: bold;
            color: red !important;
        }

        .nav-link.active {
            background-color: red;
            color: white !important;
            border-radius: 5px;
        }

        /* Form Styling */
        .container {
            margin-top: 30px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-lg {
            font-size: 1.2rem;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Online Library</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewBooksServlet">View Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="add-book.jsp">Add Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="BorrowedBooksServlet">Borrow History</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Delete Book Form Section -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Delete Book</h2>

        <!-- Book Details Card -->
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <p class="fs-5 text-center">
                    Are you sure you want to delete the book: <br>
                    <strong>"<%= book.getTitle() %>"</strong> by <strong><%= book.getAuthor() %></strong>?
                </p>

                <!-- Delete Confirmation Form -->
                <form action="DeleteBookServlet" method="post" class="text-center">
                    <input type="hidden" name="id" value="<%= book.getId() %>">
                    <button type="submit" class="btn btn-danger btn-lg me-2">Yes, Delete Book</button>
                    <a href="ViewBooksServlet" class="btn btn-secondary btn-lg">Cancel</a>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
