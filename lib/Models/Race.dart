import 'package:flutter/material.dart';
import 'package:zuumm_app/Models/Driver.dart';

class Race {
  final String id;
  final int userId;
  final String description;
  final String removal;
  final String destination;
  final String observation;
  final int idDriver;
  final Driver driver;
  final double price;
  final String status;
  final String initialRaceDate;
  final String finalRaceDate;
  const Race(
      {this.id,
      @required this.userId,
      @required this.description,
      @required this.removal,
      @required this.destination,
      @required this.price,
      this.initialRaceDate,
      this.observation,
      this.idDriver,
      this.status,
      this.finalRaceDate,
      this.driver});

  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(
      id: json['id'],
      userId: json['IdCLiente'],
      description: json['Descricao'],
      removal: json['LocalOrigem'],
      destination: json['LocalDestino'],
      observation: json['Observacao'],
      idDriver: json['IdMotorista'],
      price: json['ValorCorrida'],
      status: json['StatusCorrida'],
      initialRaceDate: json['DtInicioCorrida'],
      finalRaceDate: json['DtFinalCorrida'],
    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["IdCliente"] = userId;
    map["LocalOrigem"] = removal;
    map["LocalDestino"] = destination;
    map["Descricao"] = description;
    map["ValorCorrida"] = price;
    return map;
  }
}

class RaceStatus {
  final int id;
  final String description;
  const RaceStatus({@required this.id, @required this.description});
}
