<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Déploiement réussi</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; background-color: #f4f4f9; }
        .card { background: white; padding: 30px; border-radius: 8px; display: inline-block; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; }
        p { color: #7f8c8d; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Application déployée avec succès !</h1>
        <p>Ce fichier JSP est exécuté directement par Apache Tomcat.</p>
        <hr>
        <p><strong>Date du serveur :</strong> <%= new java.util.Date() %></p>
        <p><strong>Version de Java :</strong> <%= System.getProperty("java.version") %></p>
    </div>
</body>
</html>
