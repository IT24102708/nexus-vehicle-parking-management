package com.example.nexuspark.util;

import com.example.nexuspark.model.Vehicle;
import jakarta.servlet.ServletContext;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    // correct file path define
    private static final String DATA_FILE = "WEB-INF/data/vehicles.txt";


    private static String getFilePath(ServletContext context) throws IOException {
        String absPath = context.getRealPath(DATA_FILE);
        if (absPath == null) {
            throw new IOException("Cannot resolve path for " + DATA_FILE);
        }
        File dataFile = new File(absPath);
        File parent = dataFile.getParentFile();

        if (!parent.exists() && !parent.mkdirs()) {
            throw new IOException("Failed to create directory: " + parent.getAbsolutePath());
        }
        if (!dataFile.exists() && !dataFile.createNewFile()) {
            throw new IOException("Failed to create data file: " + dataFile.getAbsolutePath());
        }
        return absPath;
    }

    public static synchronized List<Vehicle> readVehicles(ServletContext context) throws IOException {
        List<Vehicle> vehicles = new ArrayList<>();
        String filePath = getFilePath(context);

        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(new FileInputStream(filePath), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split(",", 4);
                if (parts.length == 4) {
                    vehicles.add(new Vehicle(parts[0].trim(), parts[1].trim(), parts[2].trim(), parts[3].trim()));
                }
            }
        }
        return vehicles;
    }

    public static synchronized void writeVehicles(List<Vehicle> vehicles, ServletContext context) throws IOException {
        String filePath = getFilePath(context);

        try (BufferedWriter writer = new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(filePath), StandardCharsets.UTF_8))) {
            for (Vehicle v : vehicles) {
                String exitTime = v.getExitTime() == null ? "" : v.getExitTime();
                String line = String.join(",", v.getPlateNumber(), v.getType(), v.getEntryTime(), exitTime);
                writer.write(line);
                writer.newLine();
            }
        }
    }
}
