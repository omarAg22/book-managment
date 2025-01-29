<%@page import="java.util.List"%>
<%@page import="com.mycompany.librarymanager.model.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Livres empruntés</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Custom Styles -->
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
                margin-top: 7rem;
            }
            .page-title {
            color: #2d3436;
            font-weight: 700;
            margin-bottom: 2rem;
            text-align: center;
        }

            /* Table Styling */
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

            .no-books {
                text-align: center;
                color: #777;
                font-size: 1.2em;
            }

            /* Button Styling */
            .btn-back {
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

            .btn-back:hover {
                transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(58, 28, 113, 0.2);
            }
        </style>
    </head>
    <body>
        <!-- Navigation Bar -->
       <nav class="navbar navbar-expand-lg navbar-light">
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
                        <a class="nav-link" href="ViewBooksServlet">Voir les livres</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="add-book.jsp">Ajouter des livres</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="BorrowedBooksServlet">Historique des emprunts</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

        <!-- Main Content -->
        <div class="container">
            <h2 class="page-title">Livres actuellement empruntés</h2>

            <!-- Borrowed Books Table -->
            <table class="table text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Titre</th>
                        <th>Auteur</th>
                        <th>Catégorie</th>
                        <th>Date d'emprunt</th>
                        <th>Date de retour</th>
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
                        <td colspan="5" class="no-books">Aucun livre n'est actuellement emprunté.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <!-- Back Button -->
            <div class="text-center mt-4">
                <a href="ViewBooksServlet" class="btn btn-back btn-lg">Retour à tous les livres</a>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
