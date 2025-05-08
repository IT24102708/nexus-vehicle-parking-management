package com.example.nexuspark.controller;

import com.example.nexuspark.model.Vehicle;
import com.example.nexuspark.util.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/updatevehicle")
public class UpdateVehicleServlet extends HttpServlet {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // You might want to load vehicle data here for editing, e.g. by plate number param
        request.getRequestDispatcher("/views/update-vehicle.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String plateNumber = request.getParameter("plate");
        String newType = request.getParameter("type");
        String newEntry = request.getParameter("entry");
        String newExit = request.getParameter("exit"); // New exit time param

        if (plateNumber == null || plateNumber.trim().isEmpty()) {
            request.setAttribute("error", "Plate number is required.");
            request.getRequestDispatcher("/views/update-vehicle.jsp").forward(request, response);
            return;
        }

        plateNumber = plateNumber.trim();

        try {
            List<Vehicle> vehicles = FileUtil.readVehicles(getServletContext());
            boolean found = false;

            for (Vehicle v : vehicles) {
                if (v.getPlateNumber().equalsIgnoreCase(plateNumber)) {
                    // Validate and update type if provided
                    if (newType != null && !newType.trim().isEmpty()) {
                        v.setType(newType.trim());
                    }

                    // Validate and update entry time if provided
                    if (newEntry != null && !newEntry.trim().isEmpty()) {
                        DATE_FORMAT.setLenient(false);
                        DATE_FORMAT.parse(newEntry.trim()); // Validate format
                        v.setEntryTime(newEntry.trim());
                    }

                    // Validate and update exit time if provided
                    if (newExit != null && !newExit.trim().isEmpty()) {
                        DATE_FORMAT.setLenient(false);
                        // Parse exit time
                        var exitDate = DATE_FORMAT.parse(newExit.trim());
                        // Parse entry time for comparison
                        var entryDate = DATE_FORMAT.parse(v.getEntryTime());

                        if (exitDate.before(entryDate)) {
                            throw new IllegalArgumentException("Exit time must be after entry time.");
                        }
                        v.setExitTime(newExit.trim());
                    } else {
                        // If exit time is empty, clear exit time
                        v.setExitTime(null);
                    }

                    found = true;
                    break;
                }
            }

            if (!found) {
                request.setAttribute("error", "No vehicle found with plate number: " + plateNumber);
                request.getRequestDispatcher("/views/update-vehicle.jsp").forward(request, response);
                return;
            }

            FileUtil.writeVehicles(vehicles, getServletContext());
            request.getSession().setAttribute("success", "Vehicle updated successfully.");
            response.sendRedirect(request.getContextPath() + "/viewvehicles");

        } catch (IllegalArgumentException | ParseException e) {
            request.setAttribute("error", e.getMessage());
            // Preserve inputs to show back in form
            request.setAttribute("plate", plateNumber);
            request.setAttribute("type", newType);
            request.setAttribute("entry", newEntry);
            request.setAttribute("exit", newExit);
            request.getRequestDispatcher("/views/update-vehicle.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error updating vehicle: " + e.getMessage());
            request.getRequestDispatcher("/views/update-vehicle.jsp").forward(request, response);
        }
    }
}
