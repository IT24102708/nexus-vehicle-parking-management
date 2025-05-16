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

@WebServlet("/updatevehicle")
public class UpdateVehicleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String plateNumber = request.getParameter("plate");
        String newType = request.getParameter("type");
        String newEntryTime = request.getParameter("entry");

        List<Vehicle> vehicles = FileUtil.readVehicles();
        for (Vehicle vehicle : vehicles) {
            if (vehicle.getPlateNumber().equals(plateNumber)) {
                vehicle.setType(newType);
                vehicle.setEntryTime(newEntryTime);
                break;
            }
        }
        FileUtil.writeVehicles(vehicles);

        response.sendRedirect("views/view-vehicles.jsp");
    }
}
