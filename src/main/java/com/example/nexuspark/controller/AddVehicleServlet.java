package com.example.nexuspark.controller;

import com.example.nexuspark.model.Vehicle;
import com.example.nexuspark.util.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/addvehicle")
public class AddVehicleServlet extends HttpServlet {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set current datetime as default for entry time
        String currentDateTime = DATE_FORMAT.format(new Date());
        request.setAttribute("currentDateTime", currentDateTime);
        request.getRequestDispatcher("/views/add-vehicle.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Validate and get parameters
            String plate = validatePlate(request.getParameter("plate"));
            String type = validateType(request.getParameter("type"));
            String entry = validateDateTime(request.getParameter("entry"));
            String exit = request.getParameter("exit"); // Can be null/empty

            // Validate exit time if provided
            Date exitDate = null;
            if (exit != null && !exit.trim().isEmpty()) {
                exitDate = DATE_FORMAT.parse(exit.trim());
                Date entryDate = DATE_FORMAT.parse(entry);

                // Check if exit time is after entry time
                if (exitDate.before(entryDate)) {
                    throw new IllegalArgumentException("Exit time must be after entry time.");
                }
                exit = exit.trim();
            } else {
                exit = null;
            }

            // Check for duplicate active plate number
            List<Vehicle> vehicles = FileUtil.readVehicles(getServletContext());
            if (isDuplicatePlate(vehicles, plate)) {
                throw new IllegalArgumentException("Vehicle with this plate number is already parked.");
            }

            // Create new vehicle (exit time can be null)
            Vehicle newVehicle = new Vehicle(plate, type, entry, exit);

            // Add to list and save
            vehicles.add(newVehicle);
            FileUtil.writeVehicles(vehicles, getServletContext());

            // Set success message and redirect
            request.getSession().setAttribute("success", "Vehicle " + (exit != null ? "added with exit time" : "added") + " successfully.");
            response.sendRedirect(request.getContextPath() + "/viewvehicles");

        } catch (IllegalArgumentException | ParseException e) {
            // Handle validation errors
            request.setAttribute("error", e.getMessage());
            // Preserve form inputs on error
            preserveFormInputs(request);
            request.getRequestDispatcher("/views/add-vehicle.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle unexpected errors
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            preserveFormInputs(request);
            request.getRequestDispatcher("/views/add-vehicle.jsp").forward(request, response);
        }
    }

    private void preserveFormInputs(HttpServletRequest request) {
        request.setAttribute("plate", request.getParameter("plate"));
        request.setAttribute("type", request.getParameter("type"));
        request.setAttribute("entry", request.getParameter("entry"));
        request.setAttribute("exit", request.getParameter("exit"));
    }


    private String validatePlate(String plate) {
        if (plate == null || plate.trim().isEmpty()) {
            throw new IllegalArgumentException("Plate number is required.");
        }
        String trimmed = plate.trim().toUpperCase();
        if (!trimmed.matches("[A-Z0-9]{3,10}")) {
            throw new IllegalArgumentException("Invalid plate number format (3-10 alphanumeric characters).");
        }
        return trimmed;
    }

    private String validateType(String type) {
        if (type == null || type.trim().isEmpty()) {
            throw new IllegalArgumentException("Vehicle type is required.");
        }
        String trimmed = type.trim();
        if (trimmed.length() > 20) {
            throw new IllegalArgumentException("Vehicle type is too long (max 20 characters).");
        }
        return trimmed;
    }

    private String validateDateTime(String dateTime) throws ParseException {
        if (dateTime == null || dateTime.trim().isEmpty()) {
            throw new IllegalArgumentException("Entry time is required.");
        }
        DATE_FORMAT.parse(dateTime.trim());
        return dateTime.trim();
    }

    private boolean isDuplicatePlate(List<Vehicle> vehicles, String plate) {
        return vehicles.stream()
                .anyMatch(v -> v.getPlateNumber().equalsIgnoreCase(plate) && v.getExitTime() == null);

    }
}