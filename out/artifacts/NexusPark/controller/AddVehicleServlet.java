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

@WebServlet("/addvehicle")
public class AddVehicleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String plateNumber = request.getParameter("plate");
        String type = request.getParameter("type");
        String entryTime = request.getParameter("entry");

        Vehicle newVehicle = new Vehicle(plateNumber, type, entryTime, "-");

        List<Vehicle> vehicles = FileUtil.readVehicles();
        vehicles.add(newVehicle);
        FileUtil.writeVehicles(vehicles);

        // Use context path for absolute redirect
        response.sendRedirect(request.getContextPath() + "/viewvehicles");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Correct path to match your project structure
        request.getRequestDispatcher("views/add-vehicle.jsp").forward(request, response);
    }
}