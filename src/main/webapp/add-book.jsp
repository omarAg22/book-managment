<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Book</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom Styles -->
        <style>

            /* Highlighted Navigation */
            .nav-link.active {
                background-color: red;
                color: white !important;
                border-radius: 5px;
                padding-left: 5px;
            }

            .navbar-brand {
                font-size: 1.8rem;
                font-family: 'Arial', sans-serif;
                font-weight: bold;
                color: red !important;
            }

            .nav-link {
                font-weight: 500;
            }

            /* Form Styling */
            .container {
                margin-top: 30px;
            }

            .form-container {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                
               
            }

            .form-label {
                font-weight: bold;
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
                            <a class="nav-link active" href="add-book.jsp">Add Books</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="BorrowedBooksServlet">Borrow History</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Add Book Form Section -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">Add Book to the Library</h2>

            <!-- Form Card -->
            <div class="form-container">
                <form action="addBook" method="post">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" id="title" name="title" class="form-control" placeholder="Enter book title" required>
                    </div>

                    <div class="mb-3">
                        <label for="author" class="form-label">Author</label>
                        <input type="text" id="author" name="author" class="form-control" placeholder="Enter book author" required>
                    </div>

                    <div class="mb-3 form-check">
                        <input type="checkbox" id="availability" name="availability" value="true" class="form-check-input">
                        <label for="availability" class="form-check-label">Available</label>
                    </div>

                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <input type="text" id="category" name="category" class="form-control" placeholder="Enter book category" required>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-lg">Add Book</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
