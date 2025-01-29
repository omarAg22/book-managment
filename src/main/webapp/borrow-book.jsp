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
    <title>Emprunter un livre - Bibliothèque Moderne</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

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

        .container {
            flex: 1;
            margin-top: 8rem;
        }

        .card {
            background-color: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: #2d3436;
        }

        .card-text {
            font-size: 1rem;
            margin-bottom: 1.5rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #3a1c71, #d76d77);
            border: none;
            padding: 0.8rem 2rem;
            font-size: 1rem;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(58, 28, 113, 0.2);
        }
        
        .btn-secondary {
            font-size: 1rem;
            padding: 0.8rem 2rem;
            border-radius: 10px;
        }

        footer {
            background: linear-gradient(135deg, #3a1c71, #d76d77);
            color: white;
            padding: 1.5rem 0;
            margin-top: 3rem;
            text-align: center;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Bibliothèque Moderne</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ViewBooksServlet">Voir les livres</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="add-book.jsp">Ajouter des livres</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="BorrowedBooksServlet">Historique des emprunts</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card mx-auto" style="max-width: 600px;">
            <h1 class="card-title">Emprunter un livre</h1>
            <p class="card-text"><strong>Titre:</strong> <%= book.getTitle() %></p>
            <p class="card-text"><strong>Auteur:</strong> <%= book.getAuthor() %></p>
            <p class="card-text"><strong>Catégorie:</strong> <%= book.getCategory() %></p>
            <p class="card-text"><strong>Date d'emprunt:</strong> <%= borrowDate %></p>
            <form action="BorrowBookServlet" method="post">
                <input type="hidden" name="id" value="<%= book.getId() %>">
                <button type="submit" class="btn btn-primary">Confirmer l'emprunt</button>
                <a href="ViewBooksServlet" class="btn btn-secondary">Annuler</a>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Bibliothèque Moderne. Tous droits réservés.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
