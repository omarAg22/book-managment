<%@page import="java.util.List"%>
<%@page import="com.mycompany.librarymanager.model.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Borrowed Books</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom Styles -->
        <style>
            /* Navbar and Navigation Styles */
            .navbar {
                background-color: #fff;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .navbar-brand {
                font-size: 1.8rem;
                font-family: 'Arial', sans-serif;
                font-weight: bold;
                color: red !important;
            }

            .nav-link {
                color: grey !important;
                font-weight: 500;
            }

            .nav-link:hover {
                color: black !important;
            }

            .nav-link.active {
                background-color: red;
                color: white !important;
                border-radius: 5px;
                padding-left: 5px;
            }

            .container {
                margin-top: 30px;
            }

            /* Table Styling */
            .table {
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .table th, .table td {
                vertical-align: middle;
            }

            .no-books {
                text-align: center;
                color: #777;
                font-size: 1.2em;
            }

            /* Button Styling */
            .btn-back {
                background-color: #6c757d;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 1.2rem;
            }

            .btn-back:hover {
                background-color: #5a6268;
            }
        </style>
    </head>
    <body>
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light">
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
                            <a class="nav-link" href="add-book.jsp">Add Book</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="BorrowedBooksServlet">Borrowed Books</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">Currently Borrowed Books</h2>

            <!-- Borrowed Books Table -->
            <table class="table table-striped table-bordered table-hover text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Borrow Date</th>
                        <th>Return Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Book> borrowedBooks = (List<Book>) request.getAttribute("borrowedBooks");
                        if (borrowedBooks != null && !borrowedBooks.isEmpty()) {
                            for (Book book : borrowedBooks) {
                    %>
                    <tr>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td><%= book.getCategory() %></td>
                        <td><%= book.getBorrowDate() %></td>
                        <td><%= book.getReturnDate() != null ? book.getReturnDate() : "N/A" %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="no-books">No books are currently borrowed.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <!-- Back Button -->
            <div class="text-center mt-4">
                <a href="ViewBooksServlet" class="btn btn-back btn-lg">Back to All Books</a>
            </div>
        </div>

    </body>
</html>
