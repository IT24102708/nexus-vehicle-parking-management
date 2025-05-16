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

@WebServlet("/viewvehicles")
public class ViewVehiclesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Vehicle> vehicles = FileUtil.readVehicles();
        request.setAttribute("vehicles", vehicles);

        request.getRequestDispatcher("views/view-vehicles.jsp").forward(request, response);
    }
}
