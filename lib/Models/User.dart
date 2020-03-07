import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final int idProfile;
  final String city;
  final String password;
  final String address;
  final String number;
  final String neighborhood;
  final String telephone;
  final String cep;
  final String deviceToken;
  const User({
    @required this.name,
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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
    return map;
  }
}
