import 'dart:convert';
import 'package:zuumm_app/Infra/Global.dart';
import 'package:zuumm_app/Models/Race.dart';
import 'package:zuumm_app/Models/Driver.dart';
import 'package:http/http.dart' as http;

class RaceService {
  final bool _debug = Global.isDebug();
  static Race createDeliveryObject() {
    return new Race(
        id: "1",
        userId: 1,
        description: "Entrega de pedal",
        observation: "",
        initialRaceDate: DateTime.now().toString(),
        removal: "Rua José Lungwitz, 26",
        destination: "Rua Pedro Antônio Fernande, 236 - Jardim Ipanema",
        idDriver: 1,
        driver: new Driver(
          name: "José Mattos",
          address: null,
          cep: null,
          city: null,
          cnh: null,
          deviceToken: null,
          email: null,
          idProfile: null,
          neighborhood: null,
          number: null,
          password: null,
          telephone: null,
          vehicles: null,
        ),
        price: 15.47,
        status: ""); //RaceStatus(id: 1, description: "Em progresso"));
  }

  Future<Race> getData(int userId) async {
    var response = await http.get(
        Uri.encodeFull(
            "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId$userId"),
        headers: {"Accept": "application/json"});

    var object = json.decode(response.body);

    if (response.statusCode == 200 && object != null)
      return Race.fromJson(object);

    return null;
  }

  Future<dynamic> getAllRacesByUserId(int userId) async {
    var response = await http.get(
        Uri.encodeFull(_debug
            ? "http://${Global.getServerUrl()}:3000/api/v1/races/client/$userId"
            : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId$userId"),
        headers: {"Accept": "application/json"});

    var object = json.decode(response.body);

    if (response.statusCode == 200 && object != null) return object;

    return null;
  }

  Future<dynamic> getAllRacesByDriverId(int driverId) async {
    var response = await http.get(
        Uri.encodeFull(_debug
            ? "http://${Global.getServerUrl()}:3000/api/v1/races/driver/$driverId"
            : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId$driverId"),
        headers: {"Accept": "application/json"});

    var object = json.decode(response.body);

    if (response.statusCode == 200 && object != null) return object;

    return null;
  }

  Future<bool> putRaceByIdRaceDriver(int raceId) async {
    var response = await http.put(
      Uri.encodeFull(_debug
          ? "http://${Global.getServerUrl()}:3000/api/v1/races?$raceId"
          : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId$raceId"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    return json.decode(response.body);
  }

  Future<bool> postNewRace(Race race) async {
    print(race.toMap());
    var response = await http.post(
        Uri.encodeFull(_debug
            ? "http://${Global.getServerUrl()}:3000/api/v1/races"
            : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId"),
        headers: {
          "accept": "application/json",
        },
        body: json.encode(race.toMap()));

    if (response.statusCode == 200) return true;

    return false;
  }
}
