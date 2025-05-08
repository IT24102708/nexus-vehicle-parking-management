package com.example.nexuspark.controller;

import com.example.nexuspark.model.Vehicle;
import com.example.nexuspark.util.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewvehicles")
public class ViewVehiclesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Vehicle> vehicles = FileUtil.readVehicles(getServletContext());
        request.setAttribute("vehicles", vehicles);

        HttpSession session = request.getSession(false);
        if (session != null) {
            Object success = session.getAttribute("success");
            if (success != null) {
                request.setAttribute("success", success);
                session.removeAttribute("success");
            }
        }

        request.getRequestDispatcher("/views/view-vehicles.jsp").forward(request, response);
    }
}
