import 'package:flutter/material.dart';

class Vehicle {
  final String licensePlate;
  final String model;
  final String color;
  final int year;
  final String renavan;
  final double maximumLoad;

  const Vehicle(
      {@required this.licensePlate,
      @required this.model,
      @required this.color,
      @required this.year,
      @required this.renavan,
      @required this.maximumLoad});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
        licensePlate: json['Placa'],
        model: json['Modelo'],
        color: json['Cor'],
        year: json['Ano'],
        renavan: json['Renavan'],
        maximumLoad: json['CargaMaximaKg']);
  }

  Map<String, dynamic> toJson() {
    return {
      "Placa": this.licensePlate,
      "Modelo": this.model,
      "Cor": this.color,
      "Ano": this.year,
      "Renavan": this.renavan,
      "CargaMaximaKg": this.maximumLoad
    };
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["Placa"] = licensePlate;
    map["Modelo"] = model;
    map["Cor"] = color;
    map["Ano"] = year;
    map["Renavan"] = renavan;
    map["CargaMaximaKg"] = maximumLoad;
    return map;
  }
}
