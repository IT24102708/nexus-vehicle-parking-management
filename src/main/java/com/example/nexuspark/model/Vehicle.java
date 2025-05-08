package com.example.nexuspark.model;

public class Vehicle {
    private String plateNumber;   // encapsulated attributes
    private String type;
    private String entryTime;
    private String exitTime;

    // parameterized constructor
    public Vehicle(String plateNumber, String type, String entryTime, String exitTime) {
        this.plateNumber = plateNumber;
        this.type = type;
        this.entryTime = entryTime;
        this.exitTime = exitTime;

    }

    public String getPlateNumber() { // getters
        return plateNumber;
    }
    public void setPlateNumber(String plateNumber) { // setters
        this.plateNumber = plateNumber;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getEntryTime() {
        return entryTime;
    }
    public void setEntryTime(String entryTime) {
        this.entryTime = entryTime;
    }

    public String getExitTime() {
        return exitTime;
    }
    public void setExitTime(String exitTime) {
        this.exitTime = exitTime;

    }

}
