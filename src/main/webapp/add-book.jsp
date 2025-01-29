<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - Modern Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
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

        .container {
            padding-top: 7rem;
        }

        .form-container {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
        }

        .page-title {
            color: #2d3436;
            font-weight: 700;
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-label {
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 0.5rem;
        }

        .form-control {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 0.8rem 1.2rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #3a1c71;
            box-shadow: 0 0 0 3px rgba(58, 28, 113, 0.1);
        }

        .form-check-input {
            width: 1.2em;
            height: 1.2em;
            margin-top: 0.25em;
            cursor: pointer;
        }

        .form-check-input:checked {
            background-color: #3a1c71;
            border-color: #3a1c71;
        }

        .btn-submit {
            background: linear-gradient(135deg, #3a1c71, #d76d77);
            border: none;
            padding: 1rem 2rem;
            border-radius: 10px;
            font-weight: 600;
            color: white;
            width: 40%;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(58, 28, 113, 0.2);
        }

        .form-floating {
            margin-bottom: 1.5rem;
        }

        .form-floating label {
            padding-left: 1.2rem;
        }

        .availability-section {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 10px;
            margin: 1rem 0;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .form-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
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

    <div class="container">
        <div class="form-container">
            <h2 class="page-title">Add New Book</h2>
            
            <form action="addBook" method="post">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="title" name="title" placeholder="Book Title" required>
                    <label for="title">Book Title</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="author" name="author" placeholder="Author Name" required>
                    <label for="author">Author Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="category" name="category" placeholder="Book Category" required>
                    <label for="category">Book Category</label>
                </div>

                <div class="availability-section">
                    <div class="form-check">
                        <input type="checkbox" id="availability" name="availability" value="true" class="form-check-input">
                        <label class="form-check-label" for="availability">
                            Available for Borrowing
                        </label>
                    </div>
                </div>

                <div class="text-center mt-4">
                <button type="submit" class="btn btn-submit">Add Book to Library</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>