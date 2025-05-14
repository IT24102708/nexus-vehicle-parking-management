<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vehicles List</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #e6ebff;
            --danger: #dc2626;
            --danger-light: #fee2e2;
            --success: #10b981;
            --success-light: #d1fae5;
            --warning: #f59e0b;
            --warning-light: #fef3c7;
            --text: #2b2d42;
            --text-light: #6b7280;
            --border: #e5e7eb;
            --bg: #f8f9fa;
            --white: #ffffff;
            --shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            background: var(--bg);
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--text);
            margin: 0;
            padding: 0;
        }

        .table-container {
            max-width: 900px;
            margin: 2rem auto;
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: var(--shadow);
            background: var(--white);
        }

        .vehicle-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
        }

        .vehicle-table thead {
            background-color: var(--primary);
            color: var(--white);
        }

        .vehicle-table th, .vehicle-table td {
            padding: 1rem;
            text-align: left;
        }

        .vehicle-table th {
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.05em;
        }

        .vehicle-table td {
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
        }

        .vehicle-table tbody tr:last-child td {
            border-bottom: none;
        }

        .vehicle-table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .vehicle-type {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 100px;
            font-size: 0.85rem;
            font-weight: 500;
        }
        .vehicle-type.car { background: var(--primary-light); color: var(--primary);}
        .vehicle-type.motorcycle { background: var(--warning-light); color: var(--warning);}
        .vehicle-type.truck { background: var(--success-light); color: var(--success);}
        .vehicle-type.van,
        .vehicle-type.suv { background: #e0f2fe; color: #0369a1; }

        .actions {
            display: flex;
            gap: 0.5rem;
        }

        .btn-update, .btn-delete {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.5rem 0.9rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: var(--transition);
        }
        .btn-update {
            background: var(--primary-light);
            color: var(--primary);
        }
        .btn-update:hover {
            background: var(--primary);
            color: var(--white);
        }
        .btn-delete {
            background: var(--danger-light);
            color: var(--danger);
        }
        .btn-delete:hover {
            background: var(--danger);
            color: var(--white);
        }

        .success-message {
            background-color: var(--success-light);
            color: var(--success);
            padding: 0.75rem 1rem;
            border-radius: 6px;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 500;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
        }
        .no-vehicles {
            text-align: center;
            color: var(--text-light);
            font-size: 1.1rem;
            padding: 2rem 0;
        }

        .add-btn {
            display: inline-block;
            margin: 2rem auto 0 auto;
            padding: 0.75rem 1.5rem;
            background: var(--primary);
            color: var(--white);
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            box-shadow: var(--shadow);
        }
        .add-btn:hover {
            background: #3a56d5;
        }

        /* Responsive table */
        @media (max-width: 768px) {
            .table-container {
                padding: 0;
            }
            .vehicle-table {
                display: block;
            }
            .vehicle-table thead {
                display: none;
            }
            .vehicle-table tbody tr {
                display: block;
                margin-bottom: 1.5rem;
                border-radius: 10px;
                background: var(--white);
                box-shadow: var(--shadow);
            }
            .vehicle-table td {
                display: flex;
                justify-content: space-between;
                padding: 0.75rem 1rem;
                border-bottom: none;
            }
            .vehicle-table td::before {
                content: attr(data-label);
                font-weight: 600;
                color: var(--text-light);
                margin-right: 1rem;
            }
            .actions {
                justify-content: flex-end;
            }
        }
    </style>
</head>
<body>

<c:if test="${not empty success}">
    <div class="success-message">${success}</div>
</c:if>

<div class="table-container">
    <table class="vehicle-table">
        <thead>
        <tr>
            <th>Plate Number</th>
            <th>Type</th>
            <th>Entry Time</th>
            <th>Exit Time</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty vehicles}">
                <c:forEach var="vehicle" items="${vehicles}">
                    <tr>
                        <td data-label="Plate Number">${vehicle.plateNumber}</td>
                        <td data-label="Type">
                            <span class="vehicle-type ${vehicle.type.toLowerCase()}">${vehicle.type}</span>
                        </td>
                        <td data-label="Entry Time">${vehicle.entryTime}</td>
                        <td data-label="Exit Time">${vehicle.exitTime}</td>
                        <td data-label="Actions" class="actions">
                            <a href="${pageContext.request.contextPath}/updatevehicle?plate=${vehicle.plateNumber}" class="btn-update">Edit</a>
                            <a href="${pageContext.request.contextPath}/deletevehicle?plate=${vehicle.plateNumber}" class="btn-delete"
                               onclick="return confirm('Are you sure you want to delete this vehicle?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" class="no-vehicles">No vehicles found.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

<div style="text-align:center;">
    <a href="${pageContext.request.contextPath}/addvehicle" class="add-btn">Add New Vehicle</a>
</div>

</body>
</html>
