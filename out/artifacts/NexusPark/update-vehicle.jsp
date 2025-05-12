<form action="updatevehicle" method="post" class="vehicle-update-form">
    <div class="form-header">
        <h2>Update Vehicle Details</h2>
        <div class="form-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
            </svg>
        </div>
    </div>

    <div class="form-group">
        <label for="plate" class="form-label">Plate Number</label>
        <input type="text" id="plate" name="plate" class="form-input" required placeholder="Enter current plate number">
        <div class="input-hint">Enter the plate number of the vehicle to update</div>
    </div>

    <div class="form-group">
        <label for="type" class="form-label">New Vehicle Type</label>
        <select id="type" name="type" class="form-input">
            <option value="">Select new type (optional)</option>
            <option value="Car">Car</option>
            <option value="Motorcycle">Motorcycle</option>
            <option value="Truck">Truck</option>
            <option value="Van">Van</option>
            <option value="SUV">SUV</option>
        </select>
    </div>

    <div class="form-group">
        <label for="entry" class="form-label">New Entry Time</label>
        <input type="datetime-local" id="entry" name="entry" class="form-input">
    </div>

    <div class="form-actions">
        <button type="submit" class="btn-submit">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M19 21H5C4.46957 21 3.96086 20.7893 3.58579 20.4142C3.21071 20.0391 3 19.5304 3 19V5C3 4.46957 3.21071 3.96086 3.58579 3.58579C3.96086 3.21071 4.46957 3 5 3H16L21 8V19C21 19.5304 20.7893 20.0391 20.4142 20.4142C20.0391 20.7893 19.5304 21 19 21Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M17 21V13H7V21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M7 3V8H15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Update Vehicle
        </button>
    </div>
</form>

<style>
    :root {
        --primary: #4361ee;
        --primary-light: #e6ebff;
        --danger: #dc2626;
        --success: #10b981;
        --text: #2b2d42;
        --text-light: #6b7280;
        --border: #e5e7eb;
        --bg: #f8f9fa;
        --white: #ffffff;
        --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .vehicle-update-form {
        max-width: 500px;
        margin: 2rem auto;
        padding: 2rem;
        background: var(--white);
        border-radius: 12px;
        box-shadow: var(--shadow);
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    }

    .form-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 2rem;
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
        background: var(--primary-light);
        color: var(--primary);
        border-radius: 50%;
    }

    .form-icon svg {
        width: 24px;
        height: 24px;
    }

    .form-group {
        margin-bottom: 1.5rem;
        position: relative;
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
        padding: 0.75rem;
        font-size: 0.875rem;
        border: 1px solid var(--border);
        border-radius: 8px;
        transition: var(--transition);
        background-color: var(--bg);
    }

    .form-input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
    }

    .input-hint {
        font-size: 0.75rem;
        color: var(--text-light);
        margin-top: 0.25rem;
    }

    select.form-input {
        appearance: none;
        background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 0.75rem center;
        background-size: 1rem;
        padding-right: 2rem;
    }

    .form-actions {
        display: flex;
        justify-content: flex-end;
        margin-top: 2rem;
    }

    .btn-submit {
        display: inline-flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.75rem 1.5rem;
        background: var(--primary);
        color: var(--white);
        border: none;
        border-radius: 8px;
        font-weight: 500;
        cursor: pointer;
        transition: var(--transition);
    }

    .btn-submit:hover {
        background: #3a56d5;
        transform: translateY(-2px);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-submit svg {
        width: 1rem;
        height: 1rem;
    }

    /* Responsive adjustments */
    @media (max-width: 640px) {
        .vehicle-update-form {
            padding: 1.5rem;
            margin: 1rem;
        }

        .form-header h2 {
            font-size: 1.25rem;
        }

        .btn-submit {
            width: 100%;
            justify-content: center;
        }
    }
</style>