package util;

import model.Vehicle;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    private static final String FILE_NAME = "vehicles.txt";

    // Read all vehicles from the file
    public static List<Vehicle> readVehicles() throws IOException {
        List<Vehicle> vehicles = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                vehicles.add(new Vehicle(parts[0], parts[1], parts[2], parts[3]));
            }
        }
        return vehicles;
    }

    // Write all vehicles to the file
    public static void writeVehicles(List<Vehicle> vehicles) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME))) {
            for (Vehicle vehicle : vehicles) {
                writer.write(vehicle.getPlateNumber() + "," + vehicle.getType() + "," +
                        vehicle.getEntryTime() + "," + vehicle.getExitTime());
                writer.newLine();
            }
        }
    }
}
