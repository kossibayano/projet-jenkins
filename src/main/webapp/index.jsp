<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.management.ManagementFactory" %>
<%@ page import="java.lang.management.MemoryMXBean" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard d'Administration | Jenkins CI/CD</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .sidebar { min-height: 100vh; background: #2c3e50; color: white; }
        .sidebar .nav-link { color: #ecf0f1; border-radius: 5px; margin-bottom: 5px; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { background: #34495e; color: #3498db; }
        .card-custom { border: none; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); transition: transform 0.2s; }
        .card-custom:hover { transform: translateY(-3px); }
        .icon-box { width: 50px; height: 50px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 24px; }
        .bg-gradient-primary { background: linear-gradient(45deg, #0d6efd, #0dcaf0); }
        .status-badge { font-size: 0.85rem; padding: 0.4em 0.8em; border-radius: 20px; }
    </style>
</head>
<body>

<%
    // Variables Java exécutées côté serveur par Tomcat
    MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
    long usedMemory = memoryBean.getHeapMemoryUsage().getUsed() / (1024 * 1024);
    long maxMemory = memoryBean.getHeapMemoryUsage().getMax() / (1024 * 1024);
    String hostName = InetAddress.getLocalHost().getHostName();
    String ipAddress = InetAddress.getLocalHost().getHostAddress();
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar Navigation -->
        <div class="col-md-3 col-lg-2 sidebar p-3 d-none d-md-block">
            <div class="d-flex align-items-center mb-4 text-white text-decoration-none">
                <i class="fa-solid fa-server fa-2x me-2 text-primary"></i>
                <span class="fs-5 fw-bold">DevOps Portal</span>
            </div>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="#" class="nav-link active"><i class="fa-solid fa-chart-line me-2"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#" class="nav-link"><i class="fa-solid fa-cubes me-2"></i> Applications</a>
                </li>
                <li>
                    <a href="#" class="nav-link"><i class="fa-solid fa-gears me-2"></i> Configuration</a>
                </li>
                <li>
                    <a href="#" class="nav-link"><i class="fa-solid fa-shield-halved me-2"></i> Sécurité</a>
                </li>
            </ul>
            <hr>
            <div class="small text-muted">
                Déployé via <strong>Jenkins CI/CD</strong>
            </div>
        </div>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <!-- Header -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-3 mb-4 border-bottom">
                <div>
                    <h1 class="h2 mb-0">Supervision du Serveur</h1>
                    <small class="text-muted">Application Java webapp déployée sur Apache Tomcat</small>
                </div>
                <div>
                    <span class="badge bg-success status-badge"><i class="fa-solid fa-circle-check me-1"></i> Déploiement Actif</span>
                    <button class="btn btn-sm btn-outline-secondary ms-2" onclick="location.reload();"><i class="fa-solid fa-rotate me-1"></i> Actualiser</button>
                </div>
            </div>

            <!-- Metric Cards Row -->
            <div class="row g-3 mb-4">
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-primary text-white me-3">
                                <i class="fa-brands fa-java"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Environnement Java</div>
                                <div class="fs-5 fw-bold"><%= System.getProperty("java.version") %></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-success text-white me-3">
                                <i class="fa-solid fa-microchip"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Mémoire Heap</div>
                                <div class="fs-5 fw-bold"><%= usedMemory %> MB / <%= maxMemory %> MB</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-warning text-dark me-3">
                                <i class="fa-solid fa-server"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Serveur Web</div>
                                <div class="fs-5 fw-bold"><%= application.getServerInfo().split("/")[0] %></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-info text-white me-3">
                                <i class="fa-solid fa-network-wired"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Adresse IP Host</div>
                                <div class="fs-6 fw-bold"><%= ipAddress %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Details Section -->
            <div class="row g-3">
                <div class="col-md-8">
                    <div class="card card-custom p-4">
                        <h5 class="card-title mb-3"><i class="fa-solid fa-circle-info text-primary me-2"></i> Informations du Conteneur Tomcat</h5>
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>Nom d'hôte (Host)</th>
                                    <td><code><%= hostName %></code></td>
                                </tr>
                                <tr>
                                    <th>Version exacte Tomcat</th>
                                    <td><%= application.getServerInfo() %></td>
                                </tr>
                                <tr>
                                    <th>Système d'exploitation</th>
                                    <td><%= System.getProperty("os.name") %> (<%= System.getProperty("os.arch") %>)</td>
                                </tr>
                                <tr>
                                    <th>Heure du serveur</th>
                                    <td><%= new java.util.Date() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-custom p-4 bg-gradient-primary text-white">
                        <h5 class="card-title mb-3"><i class="fa-solid fa-rocket me-2"></i> Pipeline CI/CD</h5>
                        <p class="small">Cette application a été construite automatiquement par Jenkins avec Maven et déployée sur le serveur cible via le Manager Tomcat.</p>
                        <hr class="border-light">
                        <div class="d-flex justify-content-between align-items-center">
                            <span>Statut Build :</span>
                            <span class="badge bg-light text-primary">#SUCCESS</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>
EOFcat << 'EOF' > src/main/webapp/index.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.management.ManagementFactory" %>
<%@ page import="java.lang.management.MemoryMXBean" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard d'Administration | Jenkins CI/CD</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .sidebar { min-height: 100vh; background: #2c3e50; color: white; }
        .sidebar .nav-link { color: #ecf0f1; border-radius: 5px; margin-bottom: 5px; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { background: #34495e; color: #3498db; }
        .card-custom { border: none; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); transition: transform 0.2s; }
        .card-custom:hover { transform: translateY(-3px); }
        .icon-box { width: 50px; height: 50px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 24px; }
        .bg-gradient-primary { background: linear-gradient(45deg, #0d6efd, #0dcaf0); }
        .status-badge { font-size: 0.85rem; padding: 0.4em 0.8em; border-radius: 20px; }
    </style>
</head>
<body>

<%
    // Variables Java exécutées côté serveur par Tomcat
    MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
    long usedMemory = memoryBean.getHeapMemoryUsage().getUsed() / (1024 * 1024);
    long maxMemory = memoryBean.getHeapMemoryUsage().getMax() / (1024 * 1024);
    String hostName = InetAddress.getLocalHost().getHostName();
    String ipAddress = InetAddress.getLocalHost().getHostAddress();
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar Navigation -->
        <div class="col-md-3 col-lg-2 sidebar p-3 d-none d-md-block">
            <div class="d-flex align-items-center mb-4 text-white text-decoration-none">
                <i class="fa-solid fa-server fa-2x me-2 text-primary"></i>
                <span class="fs-5 fw-bold">DevOps Portal</span>
            </div>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="#" class="nav-link active"><i class="fa-solid fa-chart-line me-2"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#" class="nav-link"><i class="fa-solid fa-cubes me-2"></i> Applications</a>
                </li>
                <li>
                    <a href="#" class="nav-link"><i class="fa-solid fa-gears me-2"></i> Configuration</a>
                </li>
                <li>
                    <a href="#" class="nav-link"><i class="fa-solid fa-shield-halved me-2"></i> Sécurité</a>
                </li>
            </ul>
            <hr>
            <div class="small text-muted">
                Déployé via <strong>Jenkins CI/CD</strong>
            </div>
        </div>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <!-- Header -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-3 mb-4 border-bottom">
                <div>
                    <h1 class="h2 mb-0">Supervision du Serveur</h1>
                    <small class="text-muted">Application Java webapp déployée sur Apache Tomcat</small>
                </div>
                <div>
                    <span class="badge bg-success status-badge"><i class="fa-solid fa-circle-check me-1"></i> Déploiement Actif</span>
                    <button class="btn btn-sm btn-outline-secondary ms-2" onclick="location.reload();"><i class="fa-solid fa-rotate me-1"></i> Actualiser</button>
                </div>
            </div>

            <!-- Metric Cards Row -->
            <div class="row g-3 mb-4">
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-primary text-white me-3">
                                <i class="fa-brands fa-java"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Environnement Java</div>
                                <div class="fs-5 fw-bold"><%= System.getProperty("java.version") %></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-success text-white me-3">
                                <i class="fa-solid fa-microchip"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Mémoire Heap</div>
                                <div class="fs-5 fw-bold"><%= usedMemory %> MB / <%= maxMemory %> MB</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-warning text-dark me-3">
                                <i class="fa-solid fa-server"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Serveur Web</div>
                                <div class="fs-5 fw-bold"><%= application.getServerInfo().split("/")[0] %></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card card-custom p-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-info text-white me-3">
                                <i class="fa-solid fa-network-wired"></i>
                            </div>
                            <div>
                                <div class="text-muted small">Adresse IP Host</div>
                                <div class="fs-6 fw-bold"><%= ipAddress %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Details Section -->
            <div class="row g-3">
                <div class="col-md-8">
                    <div class="card card-custom p-4">
                        <h5 class="card-title mb-3"><i class="fa-solid fa-circle-info text-primary me-2"></i> Informations du Conteneur Tomcat</h5>
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>Nom d'hôte (Host)</th>
                                    <td><code><%= hostName %></code></td>
                                </tr>
                                <tr>
                                    <th>Version exacte Tomcat</th>
                                    <td><%= application.getServerInfo() %></td>
                                </tr>
                                <tr>
                                    <th>Système d'exploitation</th>
                                    <td><%= System.getProperty("os.name") %> (<%= System.getProperty("os.arch") %>)</td>
                                </tr>
                                <tr>
                                    <th>Heure du serveur</th>
                                    <td><%= new java.util.Date() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-custom p-4 bg-gradient-primary text-white">
                        <h5 class="card-title mb-3"><i class="fa-solid fa-rocket me-2"></i> Pipeline CI/CD</h5>
                        <p class="small">Cette application a été construite automatiquement par Jenkins avec Maven et déployée sur le serveur cible via le Manager Tomcat.</p>
                        <hr class="border-light">
                        <div class="d-flex justify-content-between align-items-center">
                            <span>Statut Build :</span>
                            <span class="badge bg-light text-primary">#SUCCESS</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>
