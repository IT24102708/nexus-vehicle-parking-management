<form action="${pageContext.request.contextPath}/viewvehicles" method="get" class="vehicle-view-form">
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
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M11 4H4C3.46957 4 2.96086 4.21071 2.58579 4.58579C2.21071 4.96086 2 5.46957 2 6V20C2 20.5304 2.21071 21.0391 2.58579 21.4142C2.96086 21.7893 3.46957 22 4 22H18C18.5304 22 19.0391 21.7893 19.4142 21.4142C19.7893 21.0391 20 20.5304 20 20V13" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M18.5 2.5C18.8978 2.10217 19.4374 1.87868 20 1.87868C20.5626 1.87868 21.1022 2.10217 21.5 2.5C21.8978 2.89782 22.1213 3.43739 22.1213 4C22.1213 4.56261 21.8978 5.10217 21.5 5.5L12 15L8 16L9 12L18.5 2.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            Edit
                        </a>
                        <a href="${pageContext.request.contextPath}/deletevehicle?plate=${vehicle.plateNumber}" class="btn-delete">Delete</a>
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M3 6H5H21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M8 6V4C8 3.46957 8.21071 2.96086 8.58579 2.58579C8.96086 2.21071 9.46957 2 10 2H14C14.5304 2 15.0391 2.21071 15.4142 2.58579C15.7893 2.96086 16 3.46957 16 4V6M19 6V20C19 20.5304 18.7893 21.0391 18.4142 21.4142C18.0391 21.7893 17.5304 22 17 22H7C6.46957 22 5.96086 21.7893 5.58579 21.4142C5.21071 21.0391 5 20.5304 5 20V6H19Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="form-footer">
        <button type="submit" class="btn-refresh">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M23 4V10H17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M1 20V14H7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M3.51 9C4.01717 7.56678 4.87913 6.2854 6.01547 5.27542C7.1518 4.26543 8.52547 3.55976 10 3.22C11.4745 2.88024 13.0046 2.9159 14.4634 3.32389C15.9222 3.73188 17.2635 4.50059 18.36 5.56L23 10M1 14L5.64 18.44C6.7365 19.4994 8.07784 20.2681 9.53661 20.6761C10.9954 21.0841 12.5255 21.1198 14 20.78C15.4745 20.4402 16.8482 19.7346 17.9845 18.7246C19.1209 17.7146 19.9828 16.4332 20.49 15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Refresh Vehicles
        </button>
    </div>
</form>

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

    .vehicle-table-form {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        color: var(--text);
        max-width: 100%;
        margin: 2rem auto;
    }

    .table-container {
        overflow-x: auto;
        border-radius: 12px;
        box-shadow: var(--shadow);
        background: var(--white);
        margin-bottom: 1.5rem;
    }

    .vehicle-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 0.875rem;
    }

    .vehicle-table thead {
        background-color: var(--primary);
        color: var(--white);
    }

    .vehicle-table th {
        padding: 1rem;
        text-align: left;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.05em;
    }

    .vehicle-table td {
        padding: 1rem;
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
        font-size: 0.75rem;
        font-weight: 500;
    }

    .vehicle-type.car {
        background: var(--primary-light);
        color: var(--primary);
    }

    .vehicle-type.motorcycle {
        background: var(--warning-light);
        color: var(--warning);
    }

    .vehicle-type.truck {
        background: var(--success-light);
        color: var(--success);
    }

    .vehicle-type.van,
    .vehicle-type.suv {
        background: #e0f2fe;
        color: #0369a1;
    }

    .actions {
        display: flex;
        gap: 0.75rem;
    }

    .btn-update, .btn-delete {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.5rem 0.75rem;
        border-radius: 6px;
        font-size: 0.75rem;
        font-weight: 500;
        text-decoration: none;
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

    .btn-refresh {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.75rem 1.5rem;
        background: var(--primary);
        color: var(--white);
        border: none;
        border-radius: 8px;
        font-weight: 500;
        cursor: pointer;
        transition: var(--transition);
    }

    .btn-refresh:hover {
        background: #3a56d5;
        transform: translateY(-2px);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .form-footer {
        display: flex;
        justify-content: flex-end;
    }

    /* Responsive table */
    @media (max-width: 768px) {
        .vehicle-table {
            display: block;
        }

        .vehicle-table thead {
            display: none;
        }

        .vehicle-table tbody tr {
            display: block;
            padding: 1rem;
            border-bottom: 1px solid var(--border);
        }

        .vehicle-table td {
            display: flex;
            justify-content: space-between;
            padding: 0.5rem 1rem;
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