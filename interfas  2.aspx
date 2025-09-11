<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Interfazz.aspx.cs" Inherits="CapaServidor.Interfazz" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TIENDA_UC - Sistema de Ventas</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3b7ddd;
            --secondary-color: #6c757d;
            --success-color: #1cbb8c;
            --warning-color: #f7b84b;
            --danger-color: #f06548;
            --dark-color: #343a40;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f6f8;
            color: #495057;
            padding-top: 20px;
        }
        
        .header {
            background: linear-gradient(135deg, var(--primary-color), #2c68c3);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card-header {
            background-color: rgba(59, 125, 221, 0.1);
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            font-weight: 600;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-primary:hover {
            background-color: #2c68c3;
            border-color: #2c68c3;
        }
        
        .nav-tabs .nav-link {
            color: var(--secondary-color);
            font-weight: 500;
        }
        
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            font-weight: 600;
            border-bottom: 3px solid var(--primary-color);
        }
        
        .stat-card {
            text-align: center;
            padding: 20px;
        }
        
        .stat-icon {
            font-size: 32px;
            margin-bottom: 15px;
            color: var(--primary-color);
        }
        
        .stat-number {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: var(--secondary-color);
            font-size: 14px;
        }
        
        .table th {
            font-weight: 600;
            color: #495057;
            background-color: rgba(59, 125, 221, 0.05);
        }
        
        .action-buttons .btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
        
        @media (max-width: 768px) {
            .stat-number {
                font-size: 22px;
            }
            
            .header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header text-center">
            <h1><i class="fas fa-store me-2"></i>TIENDA_UC - Sistema de Ventas</h1>
            <p class="mb-0">Sistema de gestión para tienda universitaria</p>
        </div>
        
        <!-- Navigation Tabs -->
        <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="dashboard-tab" data-bs-toggle="tab" data-bs-target="#dashboard" type="button" role="tab" aria-controls="dashboard" aria-selected="true">
                    <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="clientes-tab" data-bs-toggle="tab" data-bs-target="#clientes" type="button" role="tab" aria-controls="clientes" aria-selected="false">
                    <i class="fas fa-users me-1"></i> Clientes
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="productos-tab" data-bs-toggle="tab" data-bs-target="#productos" type="button" role="tab" aria-controls="productos" aria-selected="false">
                    <i class="fas fa-box me-1"></i> Productos
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="ventas-tab" data-bs-toggle="tab" data-bs-target="#ventas" type="button" role="tab" aria-controls="ventas" aria-selected="false">
                    <i class="fas fa-shopping-cart me-1"></i> Ventas
                </button>
            </li>
        </ul>
        
        <!-- Tab Content -->
        <div class="tab-content" id="myTabContent">
            <!-- Dashboard Tab -->
            <div class="tab-pane fade show active" id="dashboard" role="tabpanel" aria-labelledby="dashboard-tab">
                <div class="row">
                    <!-- Stats Cards -->
                    <div class="col-md-3 col-sm-6">
                        <div class="card stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                            <div class="stat-number">S/ 5,248</div>
                            <div class="stat-label">VENTAS DEL MES</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="card stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stat-number">42</div>
                            <div class="stat-label">CLIENTES REGISTRADOS</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="card stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-box"></i>
                            </div>
                            <div class="stat-number">78</div>
                            <div class="stat-label">PRODUCTOS ACTIVOS</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="card stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div class="stat-number">18%</div>
                            <div class="stat-label">CRECIMIENTO</div>
                        </div>
                    </div>
                </div>
                
                <div class="row mt-4">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Ventas Recientes</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th># Venta</th>
                                                <th>Cliente</th>
                                                <th>Fecha</th>
                                                <th>Total</th>
                                                <th>Estado</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#00125</td>
                                                <td>Juan Pérez</td>
                                                <td>20/09/2023</td>
                                                <td>S/ 256.00</td>
                                                <td><span class="badge bg-success">Completado</span></td>
                                            </tr>
                                            <tr>
                                                <td>#00124</td>
                                                <td>María García</td>
                                                <td>19/09/2023</td>
                                                <td>S/ 420.50</td>
                                                <td><span class="badge bg-success">Completado</span></td>
                                            </tr>
                                            <tr>
                                                <td>#00123</td>
                                                <td>Carlos López</td>
                                                <td>18/09/2023</td>
                                                <td>S/ 185.30</td>
                                                <td><span class="badge bg-success">Completado</span></td>
                                            </tr>
                                            <tr>
                                                <td>#00122</td>
                                                <td>Ana Rodríguez</td>
                                                <td>17/09/2023</td>
                                                <td>S/ 320.00</td>
                                                <td><span class="badge bg-success">Completado</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Productos Populares</h5>
                            </div>
                            <div class="card-body">
                                <div class="list-group">
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-1">Laptop HP 15.6"</h6>
                                            <small class="text-muted">Tecnología</small>
                                        </div>
                                        <span class="badge bg-primary rounded-pill">24 ventas</span>
                                    </div>
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-1">Mouse Inalámbrico</h6>
                                            <small class="text-muted">Accesorios</small>
                                        </div>
                                        <span class="badge bg-primary rounded-pill">18 ventas</span>
                                    </div>
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-1">Teclado Mecánico</h6>
                                            <small class="text-muted">Accesorios</small>
                                        </div>
                                        <span class="badge bg-primary rounded-pill">15 ventas</span>
                                    </div>
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-1">Monitor 24"</h6>
                                            <small class="text-muted">Tecnología</small>
                                        </div>
                                        <span class="badge bg-primary rounded-pill">12 ventas</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Clientes Tab -->
            <div class="tab-pane fade" id="clientes" role="tabpanel" aria-labelledby="clientes-tab">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Gestión de Clientes</h4>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#clienteModal">
                        <i class="fas fa-plus me-1"></i> Nuevo Cliente
                    </button>
                </div>
                
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Email</th>
                                        <th>Teléfono</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>12345678</td>
                                        <td>Juan</td>
                                        <td>Perez Gomez</td>
                                        <td>juan.perez@email.com</td>
                                        <td>987654321</td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>87654321</td>
                                        <td>Maria</td>
                                        <td>Garcia Lopez</td>
                                        <td>maria.garcia@email.com</td>
                                        <td>912345678</td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>45678912</td>
                                        <td>Carlos</td>
                                        <td>Lopez Mendoza</td>
                                        <td>carlos.lopez@email.com</td>
                                        <td>934567890</td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>78912345</td>
                                        <td>Ana</td>
                                        <td>Rodriguez Vargas</td>
                                        <td>ana.rodriguez@email.com</td>
                                        <td>945678901</td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Productos Tab -->
            <div class="tab-pane fade" id="productos" role="tabpanel" aria-labelledby="productos-tab">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Gestión de Productos</h4>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#productoModal">
                        <i class="fas fa-plus me-1"></i> Nuevo Producto
                    </button>
                </div>
                
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/200x150/3b7ddd/ffffff?text=Laptop+HP" class="card-img-top" alt="Producto">
                            <div class="card-body">
                                <h5 class="card-title">Laptop HP 15.6"</h5>
                                <p class="card-text">Intel Core i5, 8GB RAM, 512GB SSD</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="h5 mb-0 text-primary">S/ 2,499</span>
                                    <span class="badge bg-success">En stock</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent">
                                <div class="btn-group w-100">
                                    <button class="btn btn-sm btn-outline-primary">Editar</button>
                                    <button class="btn btn-sm btn-outline-danger">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/200x150/1cbb8c/ffffff?text=Mouse" class="card-img-top" alt="Producto">
                            <div class="card-body">
                                <h5 class="card-title">Mouse Inalámbrico</h5>
                                <p class="card-text">Ergonómico, 2.4GHz, 12 meses de batería</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="h5 mb-0 text-primary">S/ 59.90</span>
                                    <span class="badge bg-success">En stock</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent">
                                <div class="btn-group w-100">
                                    <button class="btn btn-sm btn-outline-primary">Editar</button>
                                    <button class="btn btn-sm btn-outline-danger">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/200x150/f7b84b/000000?text=Teclado" class="card-img-top" alt="Producto">
                            <div class="card-body">
                                <h5 class="card-title">Teclado Mecánico</h5>
                                <p class="card-text">RGB, switches azules, anti-ghosting</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="h5 mb-0 text-primary">S/ 189.90</span>
                                    <span class="badge bg-warning">Poco stock</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent">
                                <div class="btn-group w-100">
                                    <button class="btn btn-sm btn-outline-primary">Editar</button>
                                    <button class="btn btn-sm btn-outline-danger">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/200x150/f06548/ffffff?text=Monitor" class="card-img-top" alt="Producto">
                            <div class="card-body">
                                <h5 class="card-title">Monitor 24"</h5>
                                <p class="card-text">Full HD, 75Hz, IPS, FreeSync</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="h5 mb-0 text-primary">S/ 599.90</span>
                                    <span class="badge bg-success">En stock</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent">
                                <div class="btn-group w-100">
                                    <button class="btn btn-sm btn-outline-primary">Editar</button>
                                    <button class="btn btn-sm btn-outline-danger">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Ventas Tab -->
            <div class="tab-pane fade" id="ventas" role="tabpanel" aria-labelledby="ventas-tab">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Registro de Ventas</h4>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ventaModal">
                        <i class="fas fa-plus me-1"></i> Nueva Venta
                    </button>
                </div>
                
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th># Venta</th>
                                        <th>Fecha</th>
                                        <th>Cliente</th>
                                        <th>Productos</th>
                                        <th>Total</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#00125</td>
                                        <td>20/09/2023</td>
                                        <td>Juan Pérez</td>
                                        <td>Laptop HP, Mouse</td>
                                        <td>S/ 2,558.90</td>
                                        <td><span class="badge bg-success">Completado</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#00124</td>
                                        <td>19/09/2023</td>
                                        <td>María García</td>
                                        <td>Monitor 24", Teclado</td>
                                        <td>S/ 789.80</td>
                                        <td><span class="badge bg-success">Completado</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#00123</td>
                                        <td>18/09/2023</td>
                                        <td>Carlos López</td>
                                        <td>Mouse Inalámbrico</td>
                                        <td>S/ 59.90</td>
                                        <td><span class="badge bg-success">Completado</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#00122</td>
                                        <td>17/09/2023</td>
                                        <td>Ana Rodríguez</td>
                                        <td>Teclado Mecánico</td>
                                        <td>S/ 189.90</td>
                                        <td><span class="badge bg-success">Completado</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Cliente Modal -->
    <div class="modal fade" id="clienteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Agregar Nuevo Cliente</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="dni" class="form-label">DNI</label>
                                <input type="text" class="form-control" id="dni" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" id="telefono" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="nombres" class="form-label">Nombres</label>
                            <input type="text" class="form-control" id="nombres" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="apellidoPaterno" class="form-label">Apellido Paterno</label>
                                <input type="text" class="form-control" id="apellidoPaterno" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="apellidoMaterno" class="form-label">Apellido Materno</label>
                                <input type="text" class="form-control" id="apellidoMaterno" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="direccion" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="distrito" class="form-label">Distrito</label>
                                <input type="text" class="form-control" id="distrito" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" id="fechaNacimiento">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Sexo</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="sexo" id="sexoM" value="M" checked>
                                    <label class="form-check-label" for="sexoM">Masculino</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="sexo" id="sexoF" value="F">
                                    <label class="form-check-label" for="sexoF">Femenino</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Guardar Cliente</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Simulación de datos y funciones básicas
        document.addEventListener('DOMContentLoaded', function () {
            // Aquí iría la lógica para cargar datos desde el backend C#
            console.log('Sistema TIENDA_UC cargado');

            // Ejemplo de funcionalidad para guardar un cliente
            document.querySelector('#clienteModal .btn-primary').addEventListener('click', function () {
                const dni = document.getElementById('dni').value;
                const nombres = document.getElementById('nombres').value;
                const apellidoPaterno = document.getElementById('apellidoPaterno').value;

                if (dni && nombres && apellidoPaterno) {
                    alert(`Cliente ${nombres} ${apellidoPaterno} con DNI ${dni} guardado correctamente.`);
                    bootstrap.Modal.getInstance(document.getElementById('clienteModal')).hide();

                    // Aquí iría la llamada al backend C# para guardar el cliente
                    // fetch('/api/clientes', { method: 'POST', body: JSON.stringify(...) })
                } else {
                    alert('Por favor, complete todos los campos obligatorios.');
                }
            });
        });
    </script>
</body>
</html>
