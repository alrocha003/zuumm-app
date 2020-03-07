import 'package:flutter/material.dart';

class Profile {
  final int id;
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
  final int cnh;
  final List<dynamic> vehicles;
  final String language;
  final String profession;
  final int assessments;
  final int orders;
  final String urlImg;
  final DateTime since;

  const Profile({
    this.id,
    this.cnh,
    this.vehicles,
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
    this.assessments,
    this.orders,
    this.urlImg,
    this.since,
    this.profession,
    this.language,
  });

  static Profile fromJson(json) {
    return new Profile(
      id: json["Id"] ?? 0,
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
      cnh: json['Cnh'] ?? 0,
    );
  }
}
