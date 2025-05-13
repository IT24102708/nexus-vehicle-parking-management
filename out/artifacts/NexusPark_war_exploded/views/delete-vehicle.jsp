<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Remove Vehicle</title>
    <style>
        :root {
            --danger: #dc2626;
            --danger-light: #fee2e2;
            --danger-dark: #b91c1c;
            --text: #2b2d42;
            --text-light: #6b7280;
            --border: #e5e7eb;
            --bg: #f8f9fa;
            --white: #ffffff;
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .delete-vehicle-form {
            max-width: 500px;
            margin: 2rem auto;
            padding: 2rem;
            background: var(--white);
            border-radius: 12px;
            box-shadow: var(--shadow);
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            border-top: 4px solid var(--danger);
        }

        .form-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }

        .form-header h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text);
            margin: 0;
        }

        .form-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--danger-light);
            color: var(--danger);
            border-radius: 50%;
        }

        .form-icon svg {
            width: 24px;
            height: 24px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--text);
            margin-bottom: 0.5rem;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-light);
        }

        .form-input {
            width: 100%;
            padding: 0.75rem 0.75rem 0.75rem 40px;
            font-size: 0.875rem;
            border: 1px solid var(--border);
            border-radius: 8px;
            transition: var(--transition);
            background-color: var(--bg);
        }

        .form-input:focus {
            outline: none;
            border-color: var(--danger);
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1);
        }

        .input-hint {
            font-size: 0.75rem;
            color: var(--text-light);
            margin-top: 0.25rem;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            margin: 2rem 0 1.5rem;
        }

        .btn-delete {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1.5rem;
            background: var(--danger);
            color: var(--white);
            border: none;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn-delete:hover {
            background: var(--danger-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-delete svg {
            width: 1rem;
            height: 1rem;
        }

        .form-warning {
            display: flex;
            gap: 0.75rem;
            padding: 1rem;
            background: var(--danger-light);
            border-radius: 8px;
            color: var(--danger-dark);
            font-size: 0.875rem;
            align-items: flex-start;
        }

        .form-warning svg {
            flex-shrink: 0;
            margin-top: 2px;
        }

        /* Responsive adjustments */
        @media (max-width: 640px) {
            .delete-vehicle-form {
                padding: 1.5rem;
                margin: 1rem;
            }

            .form-header h2 {
                font-size: 1.25rem;
            }

            .btn-delete {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>

<form action="${pageContext.request.contextPath}/deletevehicle" method="post" class="delete-vehicle-form">
    <div class="form-header">
        <h2>Remove Vehicle</h2>
        <div class="form-icon">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                <path d="M3 6h18"/>
                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/>
                <path d="M10 11v6"/>
                <path d="M14 11v6"/>
            </svg>
        </div>
    </div>

    <c:if test="${not empty error}">
        <div class="error-message" style="background-color: var(--danger); color: var(--white); padding: 0.75rem 1rem; border-radius: 6px; margin-bottom: 1.5rem; font-size: 0.875rem; font-weight: 500; text-align: center;">
                ${error}
        </div>
    </c:if>

    <div class="form-group">
        <label for="plate" class="form-label">Plate Number to Remove</label>
        <div class="input-wrapper">
            <svg class="input-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg">
                <path d="M3 11C3 7.22876 3 5.34315 4.17157 4.17157C5.34315 3 7.22876 3 11 3H13C16.7712 3 18.6569 3 19.8284 4.17157C21 5.34315 21 7.22876 21 11V13C21 16.7712 21 18.6569 19.8284 19.8284C18.6569 21 16.7712 21 13 21H11C7.22876 21 5.34315 21 4.17157 19.8284C3 18.6569 3 16.7712 3 13V11Z"/>
                <path d="M8 7H16"/>
                <path d="M7 11H17"/>
                <path d="M7 15H13"/>
            </svg>
            <input type="text" id="plate" name="plate" class="form-input" required placeholder="ABC-1234" value="${param.plate}">
        </div>
        <div class="input-hint">Enter the exact plate number to confirm deletion</div>
    </div>

    <div class="form-actions">
        <button type="submit" class="btn-delete">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg">
                <path d="M19 7L18.1327 19.1425C18.0579 20.1891 17.187 21 16.1378 21H7.86224C6.81296 21 5.94208 20.1891 5.86732 19.1425L5 7"/>
                <path d="M10 11V17"/>
                <path d="M14 11V17"/>
                <path d="M15 7V4C15 3.44772 14.5523 3 14 3H10C9.44772 3 9 3.44772 9 4V7"/>
                <path d="M4 7H20"/>
            </svg>
            Confirm Deletion
        </button>
    </div>

    <div class="form-warning">
        <svg width="20" height="20" fill="none" stroke="#DC2626" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 9V11"/>
            <path d="M12 15H12.01"/>
            <path d="M5.07183 19H18.9282C20.4678 19 21.4301 17.3333 20.6603 16L13.7321 4C12.9623 2.66667 11.0378 2.66667 10.268 4L3.33978 16C2.56998 17.3333 3.53223 19 5.07183 19Z"/>
        </svg>
        <p>Warning: This action cannot be undone. All vehicle data will be permanently deleted.</p>
    </div>
</form>

</body>
</html>
