<!DOCTYPE html>
<html>
<head>
    <title>NexusPark - Vehicle Management</title>
    <style>
        /* Base Styles */
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --danger: #dc2626;
            --danger-hover: #b91c1c;
            --warning: #d97706;
            --warning-hover: #b45309;
            --success: #10b981;
            --success-hover: #059669;
            --text: #1f2937;
            --text-light: #6b7280;
            --bg: #ffffff;
            --bg-secondary: #f9fafb;
            --border: #e5e7eb;
            --shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            line-height: 1.5;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        /* Main Container */
        .main-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text);
            text-align: center;
            margin-bottom: 2rem;
        }

        /* Form Grid Layout */
        .form-grid {
            display: grid;
            gap: 1.5rem;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        }

        /* Form Container Styles */
        .form-container {
            background-color: var(--bg-secondary);
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: var(--shadow);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .form-container:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--text);
            text-align: center;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            text-align: center;
            text-decoration: none;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        .btn-danger {
            background-color: var(--danger);
            color: white;
        }

        .btn-danger:hover {
            background-color: var(--danger-hover);
            transform: translateY(-1px);
        }

        .btn-warning {
            background-color: var(--warning);
            color: white;
        }

        .btn-warning:hover {
            background-color: var(--warning-hover);
            transform: translateY(-1px);
        }

        .btn-success {
            background-color: var(--success);
            color: white;
        }

        .btn-success:hover {
            background-color: var(--success-hover);
            transform: translateY(-1px);
        }

        .btn-block {
            width: 100%;
            display: block;
            padding: 0.75rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .page-title {
                font-size: 1.75rem;
            }
        }

        /* Animation for buttons */
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .btn:hover {
            animation: pulse 0.5s ease;
        }

        /* Header Styles (if you want to add later) */
        header {
            background-color: var(--bg);
            box-shadow: var(--shadow);
            padding: 1rem 0;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            text-decoration: none;
        }
    </style>
    <!-- Include Inter font from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="main-container">
    <h1 class="page-title">Welcome to NexusPark</h1>
    <div class="form-grid">
        <!-- Add Vehicle Link -->
        <div class="form-container" style="text-align:center; border-top: 4px solid var(--primary);">
            <h2 class="form-title">Add Vehicle</h2>
            <a href="add-vehicle.jsp" class="btn btn-primary btn-block">Go to Add Vehicle</a>
        </div>
        <!-- Delete Vehicle Link -->
        <div class="form-container" style="text-align:center; border-top: 4px solid var(--danger);">
            <h2 class="form-title">Delete Vehicle</h2>
            <a href="delete-vehicle.jsp" class="btn btn-danger btn-block">Go to Delete Vehicle</a>
        </div>
        <!-- Update Vehicle Link -->
        <div class="form-container" style="text-align:center; border-top: 4px solid var(--warning);">
            <h2 class="form-title">Update Vehicle</h2>
            <a href="update-vehicle.jsp" class="btn btn-warning btn-block">Go to Update Vehicle</a>
        </div>
        <!-- View Vehicles Link -->
        <div class="form-container" style="text-align:center; border-top: 4px solid var(--success);">
            <h2 class="form-title">View Vehicles</h2>
            <a href="view-vehicles.jsp" class="btn btn-success btn-block">Go to View Vehicles</a>
        </div>
    </div>
</div>
</body>
</html>