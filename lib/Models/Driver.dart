import 'package:flutter/material.dart';

class Driver {
  final String name;
  final String email;
  final int idProfile;
  final String city;
  final String password;
  final String address;
  final int number;
  final String neighborhood;
  final String telephone;
  final String cep;
  final String deviceToken;
  final int cnh;
  final List<dynamic> vehicles;
  const Driver(
      {@required this.name,
      @required this.email,
      @required this.idProfile,
      @required this.city,
      @required this.password,
      @required this.address,
      @required this.number,
      @required this.neighborhood,
      @required this.telephone,
      @required this.cep,
      @required this.deviceToken,
      @required this.cnh,
      @required this.vehicles});

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      name: json['Nome'],
      email: json['Email'],
      idProfile: json['IdProfile'],
      city: json['Cidade'],
      password: json['Senha'],
      address: json['Endereco'],
      number: json['NumeroResidencia'],
      neighborhood: json['Bairro'],
      telephone: json['Telefone'],
      cep: json['Cep'],
      deviceToken: json['DeviceToken'],
      cnh: json['Cnh'],
      vehicles: json['Veiculos'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["Nome"] = name;
    map["Email"] = email;
    map["IdProfile"] = idProfile;
    map["Cidade"] = city;
    map["Senha"] = password;
    map["Endereco"] = address;
    map["NumeroResidencia"] = number;
    map["Bairro"] = neighborhood;
    map["Telefone"] = telephone;
    map["Cep"] = cep;
    map["DeviceToken"] = deviceToken;
    map["Cnh"] = cnh;
    map["Veiculos"] = vehicles;
    return map;
  }
}
