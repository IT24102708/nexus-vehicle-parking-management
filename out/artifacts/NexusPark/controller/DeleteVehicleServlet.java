package controller;

import model.Vehicle;
import util.FileUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/deletevehicle")
public class DeleteVehicleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String plateNumber = request.getParameter("plate");
        List<Vehicle> vehicles = FileUtil.readVehicles();

        vehicles.removeIf(vehicle -> vehicle.getPlateNumber().equals(plateNumber));
        FileUtil.writeVehicles(vehicles);

        response.sendRedirect("view-vehicles.jsp");
    }
}
