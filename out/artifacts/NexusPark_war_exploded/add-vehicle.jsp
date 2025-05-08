<form action="${pageContext.request.contextPath}/addvehicle" method="post" class="vehicle-form">
    <div class="form-header">
        <h2>Add New Vehicle</h2>
        <div class="form-icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
            <path d="M3.375 4.5C2.339 4.5 1.5 5.34 1.5 6.375V13.5h12V6.375c0-1.036-.84-1.875-1.875-1.875h-8.25ZM13.5 15h-12v2.625c0 1.035.84 1.875 1.875 1.875h.375a3 3 0 1 1 6 0h3a.75.75 0 0 0 .75-.75V15Z" />
            <path d="M8.25 19.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0ZM15.75 6.75a.75.75 0 0 0-.75.75v11.25c0 .087.015.17.042.248a3 3 0 0 1 5.958.464c.853-.175 1.522-.935 1.464-1.883a18.659 18.659 0 0 0-3.732-10.104 1.837 1.837 0 0 0-1.47-.725H15.75Z" />
            <path d="M19.5 19.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z" />
        </svg>
        </div>
    </div>

    <div class="form-group">
        <label for="plate" class="form-label">Plate Number</label>
        <input type="text" id="plate" name="plate" class="form-input" placeholder="ABC-1234" required>
        <div class="input-underline"></div>
    </div>

    <div class="form-group">
        <label for="type" class="form-label">Vehicle Type</label>
        <select id="type" name="type" class="form-input" required>
            <option value="" disabled selected>Select type</option>
            <option value="Car">Car</option>
            <option value="Motorcycle">Motorcycle</option>
            <option value="Truck">Truck</option>
            <option value="Van">Van</option>
            <option value="SUV">SUV</option>
        </select>
        <div class="input-underline"></div>
    </div>

    <div class="form-group">
        <label for="entry" class="form-label">Entry Time</label>
        <input type="datetime-local" id="entry" name="entry" class="form-input" required>
        <div class="input-underline"></div>
    </div>

    <button type="submit" class="submit-btn">
        <span>Add Vehicle</span>
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </button>
</form>

<style>
    :root {
        --primary: #4361ee;
        --primary-light: #e6ebff;
        --text: #2b2d42;
        --text-light: #8d99ae;
        --background: #f8f9fa;
        --white: #ffffff;
        --border: #e9ecef;
        --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .vehicle-form {
        max-width: 480px;
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
        font-size: 1.75rem;
        width: 48px;
        height: 48px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: var(--primary-light);
        color: var(--primary);
        border-radius: 50%;
    }

    .form-group {
        position: relative;
        margin-bottom: 1.75rem;
    }

    .form-label {
        display: block;
        font-size: 0.875rem;
        font-weight: 500;
        color: var(--text-light);
        margin-bottom: 0.5rem;
        transition: var(--transition);
    }

    .form-input {
        width: 100%;
        padding: 0.75rem 0;
        font-size: 1rem;
        color: var(--text);
        background: transparent;
        border: none;
        border-bottom: 1px solid var(--border);
        outline: none;
        transition: var(--transition);
    }

    .form-input:focus {
        border-color: transparent;
    }

    .form-input:focus + .input-underline {
        transform: scaleX(1);
    }

    .input-underline {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 2px;
        background: var(--primary);
        transform: scaleX(0);
        transform-origin: left;
        transition: var(--transition);
    }

    select.form-input {
        appearance: none;
        background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 0.5rem center;
        background-size: 1rem;
    }

    .submit-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        padding: 0.875rem 1.5rem;
        font-size: 1rem;
        font-weight: 500;
        color: var(--white);
        background: var(--primary);
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: var(--transition);
        overflow: hidden;
    }

    .submit-btn:hover {
        background: #3a56d5;
        transform: translateY(-2px);
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
    }

    .submit-btn svg {
        margin-left: 0.75rem;
        width: 1.25rem;
        height: 1.25rem;
        transition: var(--transition);
    }

    .submit-btn:hover svg {
        transform: translateX(4px);
    }

    /* Animation for form inputs */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .form-group {
        animation: fadeIn 0.4s ease-out forwards;
    }

    .form-group:nth-child(2) {
        animation-delay: 0.1s;
    }

    .form-group:nth-child(3) {
        animation-delay: 0.2s;
    }

    /* Responsive adjustments */
    @media (max-width: 640px) {
        .vehicle-form {
            padding: 1.5rem;
            margin: 1rem;
        }

        .form-header h2 {
            font-size: 1.25rem;
        }
    }
</style>