<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.librarymanager.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Books</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .body_font {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        h1 {
            color: #333;
            font-size: 2.5rem;
            font-weight: 600;
        }
        .table th, .table td {
            vertical-align: middle;
            padding: 12px;
        }
        .table-dark {
            background-color: #212529; /* Dark background for the table header */
            color: white;
        }
        .table-striped tbody tr:nth-child(odd) {
            background-color: #f9f9f9; /* Light grey for odd rows */
        }
        .actions a, .actions button {
            margin-right: 5px;
        }
        .no-books {
            text-align: center;
            font-size: 1.2em;
            color: #777;
        }
        .borrow {
            background-color: #28a745; /* Green for Borrow */
            color: white;
            border-radius: 5px;
            padding: 8px 15px;
            text-decoration: none;
            box-shadow: 0 4px 8px rgba(0, 255, 0, 0.2);
        }
        .borrow:hover {
            opacity: 0.9;
            box-shadow: 0 6px 12px rgba(0, 255, 0, 0.3);
        }
        .delete {
            background-color: #dc3545; /* Red for Delete */
            color: white;
            border-radius: 5px;
            padding: 8px 15px;
            text-decoration: none;
            box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);
        }
        .delete:hover {
            opacity: 0.9;
            box-shadow: 0 6px 12px rgba(255, 0, 0, 0.3);
        }
        .return {
            background-color: #ffc107; /* Yellow for Return */
            color: black;
            border-radius: 5px;
            padding: 8px 15px;
            box-shadow: 0 4px 8px rgba(255, 193, 7, 0.2);
        }
        .return:hover {
            opacity: 0.9;
            box-shadow: 0 6px 12px rgba(255, 193, 7, 0.3);
        }
        .search-form input {
            max-width: 400px;
        }

        /* Navbar Styling (Matching your design colors) */
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

    </style>
</head>
<body>
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
                            <a class="nav-link active" href="ViewBooksServlet">View Books</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="add-book.jsp">Add Book</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="BorrowedBooksServlet">Borrowed Books</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    <!-- Main Content -->
    <div class="container mt-5 body_font">
        <!-- Page Title -->
        <h1 class="text-center mb-4">List of Books</h1>

        <!-- Search Form -->
        <form action="SearchBooksServlet" method="get" class="search-form mb-4 d-flex justify-content-center">
            <input type="text" name="query" class="form-control me-2" placeholder="Search by title, author, or category">
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <!-- Books Table -->
        <table class="table table-striped table-bordered text-center align-middle">
            <thead class="table-dark">
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Availability</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Book> books = (List<Book>) request.getAttribute("books");
                    if (books != null && !books.isEmpty()) {
                        for (Book book : books) {
                %>
                <tr>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td>
                        <span class="badge <%= book.isAvailabile() ? "bg-success" : "bg-danger" %>">
                            <%= book.isAvailabile() ? "Available" : "Not Available" %>
                        </span>
                    </td>
                    <td><%= book.getCategory() %></td>
                    <td class="actions">
                        <% if (book.isAvailabile()) { %>
                            <a href="borrow-book.jsp?id=<%= book.getId() %>" class="borrow btn btn-sm">Borrow</a>
                        <% } else { %>
                            <form action="ReturnBookServlet" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%= book.getId() %>">
                                <button type="submit" class="return btn btn-sm">Return</button>
                            </form>
                        <% } %>
                        <a href="delete-book.jsp?id=<%= book.getId() %>" class="delete btn btn-sm">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="no-books">No books found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer class="text-center py-3" style="background-color: #212529; color: white;">
        <p>&copy; 2024 Library Manager. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
