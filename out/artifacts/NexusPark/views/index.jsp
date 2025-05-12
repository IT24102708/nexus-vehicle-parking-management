<html>
<head>
    <title>NexusPark - Parking Management</title>
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

        /* Header Styles */
        header {
            background-color: var(--bg);
            box-shadow: var(--shadow);
            padding: 1rem 0;
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 1.5rem;
        }

        .nav-link {
            color: var(--text-light);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        .nav-link:hover {
            color: var(--primary);
        }

        /* Login Modal */
        .login-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .login-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .close-btn {
            float: right;
            font-size: 1.5rem;
            cursor: pointer;
        }

        /* Main Content */
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

        /* Form Styles */
        .form-container {
            background-color: var(--bg-secondary);
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: var(--shadow);
            margin-bottom: 1.5rem;
        }

        .form-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--text);
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--text);
            margin-bottom: 0.5rem;
        }

        .form-input {
            width: 100%;
            padding: 0.5rem 0.75rem;
            border: 1px solid var(--border);
            border-radius: 6px;
            font-size: 0.875rem;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            text-align: center;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
        }

        .btn-danger {
            background-color: var(--danger);
            color: white;
        }

        .btn-danger:hover {
            background-color: var(--danger-hover);
        }

        .btn-warning {
            background-color: var(--warning);
            color: white;
        }

        .btn-warning:hover {
            background-color: var(--warning-hover);
        }

        .btn-success {
            background-color: var(--success);
            color: white;
        }

        .btn-success:hover {
            background-color: var(--success-hover);
        }

        .btn-block {
            width: 100%;
            padding: 0.625rem;
        }

        /* Table Styles */
        .table-container {
            overflow-x: auto;
            margin-bottom: 2rem;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.875rem;
            margin-bottom: 1rem;
        }

        .table th {
            background-color: var(--bg-secondary);
            text-align: left;
            padding: 0.75rem 1rem;
            font-weight: 600;
            color: var(--text-light);
            border-bottom: 1px solid var(--border);
        }

        .table td {
            padding: 1rem;
            border-bottom: 1px solid var(--border);
            color: var(--text-light);
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        /* Link Styles */
        .action-link {
            font-weight: 500;
            text-decoration: none;
            margin: 0 0.25rem;
        }

        .action-link-primary {
            color: var(--primary);
        }

        .action-link-primary:hover {
            color: var(--primary-hover);
        }

        .action-link-danger {
            color: var(--danger);
        }

        .action-link-danger:hover {
            color: var(--danger-hover);
        }

        /* Layout */
        .form-grid {
            display: grid;
            gap: 1.5rem;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        }

        /* User Info */
        .user-info {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .user-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .nav-links {
                gap: 1rem;
            }
        }
    </style>
    <!-- Include Inter font from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div class="header-container">
        <a href="#" class="logo">NexusPark</a>
        <div class="nav-links">
            <!-- These links would be shown to all users -->
            <a href="#" class="nav-link">Home</a>
            <a href="#parking" class="nav-link">Parking</a>

            <!-- These would be shown conditionally based on login status -->
            <span id="loginSection">
                    <a href="#" class="nav-link" onclick="showLoginModal()">Login</a>
                    <a href="#" class="nav-link" onclick="showRegisterModal()">Register</a>
                </span>
            <span id="userSection" style="display:none">
                    <div class="user-info">
                        <div class="user-avatar" id="userAvatar">U</div>
                        <span id="usernameDisplay">User</span>
                    </div>
                    <a href="#" class="nav-link" onclick="logout()">Logout</a>
                </span>

            <!-- Admin link (shown only to admins) -->
            <a href="#admin" class="nav-link" id="adminLink" style="display:none">Admin</a>
        </div>
    </div>
</header>

<!-- Login Modal -->
<div id="loginModal" class="login-modal">
    <div class="login-container">
        <span class="close-btn" onclick="hideLoginModal()">&times;</span>
        <h2 class="login-title">Login to NexusPark</h2>
        <form id="loginForm" onsubmit="handleLogin(event)">
            <div class="form-group">
                <label class="form-label">Username:</label>
                <input type="text" id="loginUsername" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label">Password:</label>
                <input type="password" id="loginPassword" class="form-input" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
        <p style="text-align: center; margin-top: 1rem;">
            Don't have an account? <a href="#" onclick="showRegisterModal()" style="color: var(--primary);">Register</a>
        </p>
    </div>
</div>

<!-- Register Modal -->
<div id="registerModal" class="login-modal">
    <div class="login-container">
        <span class="close-btn" onclick="hideRegisterModal()">&times;</span>
        <h2 class="login-title">Register for NexusPark</h2>
        <form id="registerForm" onsubmit="handleRegister(event)">
            <div class="form-group">
                <label class="form-label">Username:</label>
                <input type="text" id="registerUsername" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label">Email:</label>
                <input type="email" id="registerEmail" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label">Password:</label>
                <input type="password" id="registerPassword" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label">Confirm Password:</label>
                <input type="password" id="registerConfirmPassword" class="form-input" required>
            </div>
            <button type="submit" class="btn btn-success btn-block">Register</button>
        </form>
        <p style="text-align: center; margin-top: 1rem;">
            Already have an account? <a href="#" onclick="showLoginModal()" style="color: var(--primary);">Login</a>
        </p>
    </div>
</div>

<div class="main-container">
    <h1 class="page-title">Welcome to NexusPark</h1>

    <!-- Parking Management Content -->
    <div id="parkingContent">
        <div class="form-grid">
            <!-- Add Vehicle Form -->
            <div class="form-container">
                <h2 class="form-title">Add Vehicle</h2>
                <form action="add-vehicle.jsp" method="post">
                    <div class="form-group">
                        <label class="form-label">Plate Number:</label>
                        <input type="text" name="plate" class="form-input" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Type:</label>
                        <input type="text" name="type" class="form-input" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Entry Time:</label>
                        <input type="text" name="entry" class="form-input" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Add Vehicle</button>
                </form>
            </div>

            <!-- Delete Vehicle Form -->
            <div class="form-container">
                <h2 class="form-title">Delete Vehicle</h2>
                <form action="delete-vehicle.jsp" method="get">
                    <div class="form-group">
                        <label class="form-label">Plate Number:</label>
                        <input type="text" name="plate" class="form-input" required>
                    </div>
                    <button type="submit" class="btn btn-danger btn-block">Delete Vehicle</button>
                </form>
            </div>
        </div>

        <!-- Update Vehicle Form -->
        <div class="form-container">
            <h2 class="form-title">Update Vehicle</h2>
            <form action="update-vehicle.jsp" method="post">
                <div class="form-group">
                    <label class="form-label">Plate Number:</label>
                    <input type="text" name="plate" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label">New Type:</label>
                    <input type="text" name="type" class="form-input">
                </div>
                <div class="form-group">
                    <label class="form-label">New Entry Time:</label>
                    <input type="text" name="entry" class="form-input">
                </div>
                <button type="submit" class="btn btn-warning btn-block">Update Vehicle</button>
            </form>
        </div>

        <!-- View Vehicles -->
        <div class="form-container">
            <h2 class="form-title">Vehicle List</h2>
            <form action="view-vehicles.jsp" method="post">
                <div class="table-container">
                    <table class="table">
                        <tr>
                            <th>Plate Number</th>
                            <th>Type</th>
                            <th>Entry Time</th>
                            <th>Exit Time</th>
                            <th>Actions</th>
                        </tr>
                        <c:forEach var="vehicle" items="${vehicles}">
                            <tr>
                                <td>${vehicle.plateNumber}</td>
                                <td>${vehicle.type}</td>
                                <td>${vehicle.entryTime}</td>
                                <td>${vehicle.exitTime}</td>
                                <td>
                                    <a href="update-vehicle.jsp?plate=${vehicle.plateNumber}" class="action-link action-link-primary">Update</a> |
                                    <a href="delete-vehicle.jsp?plate=${vehicle.plateNumber}" class="action-link action-link-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <button type="submit" class="btn btn-primary btn-block">View Vehicles</button>
            </form>
        </div>
    </div>

    <!-- Admin Content (hidden by default) -->
    <div id="adminContent" style="display:none">
        <div class="form-container">
            <h2 class="form-title">Admin Dashboard</h2>
            <p>This section would contain admin-specific functionality like user management, reports, etc.</p>
            <!-- Add admin-specific content here -->
        </div>
    </div>
</div>

<script>
    // Simple user management (in a real app, this would be server-side)
    let currentUser = null;

    // Modal control functions
    function showLoginModal() {
        document.getElementById('loginModal').style.display = 'flex';
    }

    function hideLoginModal() {
        document.getElementById('loginModal').style.display = 'none';
    }

    function showRegisterModal() {
        hideLoginModal();
        document.getElementById('registerModal').style.display = 'flex';
    }

    function hideRegisterModal() {
        document.getElementById('registerModal').style.display = 'none';
    }

    // Login handler
    function handleLogin(event) {
        event.preventDefault();
        const username = document.getElementById('loginUsername').value;
        const password = document.getElementById('loginPassword').value;

        // In a real app, you would send this to your server for authentication
        // This is just a simulation
        if (username && password) {
            currentUser = {
                username: username,
                isAdmin: username.toLowerCase() === 'admin' // Simulate admin user
            };
            updateUIAfterLogin();
            hideLoginModal();
            alert('Login successful!');
        } else {
            alert('Please enter both username and password');
        }
    }

    // Registration handler
    function handleRegister(event) {
        event.preventDefault();
        const username = document.getElementById('registerUsername').value;
        const email = document.getElementById('registerEmail').value;
        const password = document.getElementById('registerPassword').value;
        const confirmPassword = document.getElementById('registerConfirmPassword').value;

        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return;
        }

        // In a real app, you would send this data to your server
        alert(`Registration successful for ${username}! You can now login.`);
        hideRegisterModal();
        showLoginModal();
    }

    // Logout handler
    function logout() {
        currentUser = null;
        document.getElementById('loginSection').style.display = 'block';
        document.getElementById('userSection').style.display = 'none';
        document.getElementById('adminLink').style.display = 'none';
        document.getElementById('adminContent').style.display = 'none';
        document.getElementById('parkingContent').style.display = 'block';
    }

    // Update UI after login
    function updateUIAfterLogin() {
        document.getElementById('loginSection').style.display = 'none';
        document.getElementById('userSection').style.display = 'flex';
        document.getElementById('usernameDisplay').textContent = currentUser.username;
        document.getElementById('userAvatar').textContent = currentUser.username.charAt(0).toUpperCase();

        if (currentUser.isAdmin) {
            document.getElementById('adminLink').style.display = 'block';
        }
    }

    // Admin link click handler
    document.getElementById('adminLink').addEventListener('click', function(e) {
        e.preventDefault();
        document.getElementById('parkingContent').style.display = 'none';
        document.getElementById('adminContent').style.display = 'block';
    });

    // Close modals when clicking outside
    window.onclick = function(event) {
        if (event.target.className === 'login-modal') {
            event.target.style.display = 'none';
        }
    }
</script>
</body>
</html>