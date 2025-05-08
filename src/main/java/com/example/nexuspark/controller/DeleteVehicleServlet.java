package com.example.nexuspark.controller;

import com.example.nexuspark.model.Vehicle;
import com.example.nexuspark.util.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet("/deletevehicle") // annotations
public class DeleteVehicleServlet extends HttpServlet {

    // Handle GET requests: show the delete form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to delete form JSP
        request.getRequestDispatcher("/views/delete-vehicle.jsp").forward(request, response);
    }

    // Handle POST requests: perform deletion
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String plateNumber = request.getParameter("plate");
        if (plateNumber == null || plateNumber.trim().isEmpty()) {
            request.setAttribute("error", "Plate number is required for deletion.");
            request.getRequestDispatcher("/views/delete-vehicle.jsp").forward(request, response);
            return;
        }
        plateNumber = plateNumber.trim();

        List<Vehicle> vehicles = FileUtil.readVehicles(getServletContext());
        boolean removed = false;
        Iterator<Vehicle> iterator = vehicles.iterator();
        while (iterator.hasNext()) {
            Vehicle v = iterator.next();
            if (v.getPlateNumber().equalsIgnoreCase(plateNumber)) {
                iterator.remove();
                removed = true;
                break;
            }
        }

        if (!removed) {
            request.setAttribute("error", "No vehicle found with plate number: " + plateNumber);
            request.getRequestDispatcher("/views/delete-vehicle.jsp").forward(request, response);
            return;
        }

        FileUtil.writeVehicles(vehicles, getServletContext());
        request.getSession().setAttribute("success", "Vehicle deleted successfully.");
        response.sendRedirect(request.getContextPath() + "/viewvehicles");
    }
}
