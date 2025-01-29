<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.librarymanager.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voir les livres - Bibliothèque Moderne</title>
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
            margin-top: 7rem;
        }

        .page-title {
            color: #2d3436;
            font-weight: 700;
            margin-bottom: 2rem;
            text-align: center;
        }

        .search-form {
            background: white;
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .search-form input {
            border-radius: 8px;
            border: 2px solid #e9ecef;
            padding: 0.8rem 1.2rem;
            transition: all 0.3s ease;
        }

        .search-form input:focus {
            border-color: #3a1c71;
            box-shadow: 0 0 0 3px rgba(58, 28, 113, 0.1);
        }

        .search-form button {
            background: linear-gradient(135deg, #3a1c71, #d76d77);
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .search-form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(58, 28, 113, 0.2);
        }

        .table {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .table th {
            background: linear-gradient(135deg, #3a1c71, #d76d77);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            padding: 1.2rem 1rem;
            border: none;
        }

        .table td {
            padding: 1rem;
            vertical-align: middle;
            border-color: #f1f3f5;
        }

        .badge {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 500;
        }

        .bg-success {
            background: linear-gradient(135deg, #00b09b, #96c93d) !important;
        }

        .bg-danger {
            background: linear-gradient(135deg, #eb3349, #f45c43) !important;
        }

        .btn-action {
            padding: 0.5rem 1.2rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin: 0 0.2rem;
        }

        .borrow {
            background: linear-gradient(135deg, #00b09b, #96c93d);
            color: white;
            border: none;
        }

        .return {
            background: linear-gradient(135deg, #f7b733, #fc4a1a);
            color: white;
            border: none;
        }

        .delete {
            background: linear-gradient(135deg, #eb3349, #f45c43);
            color: white;
            border: none;
        }

        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            color: white;
        }

        .no-books {
            padding: 3rem;
            text-align: center;
            color: #6c757d;
            font-size: 1.2rem;
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
        <h1 class="page-title">Collection de la bibliothèque</h1>

        <form action="SearchBooksServlet" method="get" class="search-form">
            <div class="d-flex gap-3">
                <input type="text" name="query" class="form-control" placeholder="Rechercher par titre, auteur ou catégorie">
                <button type="submit" class="btn btn-primary">Recherche</button>
            </div>
        </form>

        <table class="table text-center">
            <thead>
                <tr>
                    <th>Titre</th>
                    <th>Auteur</th>
                    <th>Disponibilité</th>
                    <th>Catégorie</th>
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
                            <%= book.isAvailabile() ? "Disponible" : "Non disponible" %>
                        </span>
                    </td>
                    <td><%= book.getCategory() %></td>
                    <td class="actions">
                        <% if (book.isAvailabile()) { %>
                            <a href="borrow-book.jsp?id=<%= book.getId() %>" class="borrow btn btn-sm">Emprunter</a>
                        <% } else { %>
                            <form action="ReturnBookServlet" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%= book.getId() %>">
                                <button type="submit" class="return btn btn-sm">Retourner</button>
                            </form>
                        <% } %>
                        <a href="delete-book.jsp?id=<%= book.getId() %>" class="delete btn btn-sm">Supprimer</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="no-books">Aucun livre trouvé.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <footer>
        <p>&copy; 2024 Bibliothèque Moderne. Tous droits réservés.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
