<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.librarymanager.dao.BookDAO" %>
<%@ page import="com.mycompany.librarymanager.model.Book" %>
<%@ page import="java.util.Calendar" %>

<%
    // Fetch the book ID from the URL parameter
    String idParam = request.getParameter("id");
    int bookId = Integer.parseInt(idParam);

    // Use BookDAO to fetch the book details
    BookDAO bookDAO = new BookDAO();
    Book book = bookDAO.getBookById(bookId);

    // Handle case where no book is found or if the book is not available
    if (book == null || !book.isAvailabile()) {
        request.setAttribute("errorMessage", "Book is either not available or does not exist.");
%>
        <jsp:forward page="ViewBooksServlet" />
<%
        return;
    }
    Calendar calendar = Calendar.getInstance();
    java.util.Date borrowDate = calendar.getTime();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Book</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom Styles -->
    <style>
        /* Navigation Bar */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(135deg, #3a1c71, #d76d77, #ffaf7b);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .nav-link.active {
            background: linear-gradient(135deg, #3a1c71, #d76d77);
            color: white !important;
            border-radius: 8px;
        }

        /* Form Styling */
        .container {
            margin-top: 10rem;
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
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Modern Library</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ViewBooksServlet">View Books</a>
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

    <!-- Borrow Book Form Section -->
    <div class="container">
        <h2 class="text-center mb-4">Borrow Book</h2>

        <!-- Book Details Card -->
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <p class="fs-5 text-center">
                    Are you sure you want to borrow the book: <br>
                    <strong>"<%= book.getTitle() %>"</strong> by <strong><%= book.getAuthor() %></strong>?
                </p>
                <p class="text-center mb-4">
                    <strong>Borrow Date:</strong> <%= borrowDate %>
                </p>

                <!-- Borrow Form -->
                <form action="BorrowBookServlet" method="post" class="text-center">
                    <input type="hidden" name="id" value="<%= book.getId() %>">
                    <button type="submit" class="btn btn-success btn-lg me-2">Yes, Borrow Book</button>
                    <a href="ViewBooksServlet" class="btn btn-secondary btn-lg">Cancel</a>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
