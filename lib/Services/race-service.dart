import 'dart:convert';
import 'package:zuumm_app/Infra/Global.dart';
import 'package:zuumm_app/Models/Race.dart';
import 'package:zuumm_app/Models/Driver.dart';
import 'package:http/http.dart' as http;

class RaceService {
  final bool _debug = Global.isDebug();

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
    try {
      var response = await http.get(
          Uri.encodeFull(_debug
              ? "http://${Global.getServerUrl()}:3000/api/v1/races/driver/$driverId"
              : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId$driverId"),
          headers: {"Accept": "application/json"});

      var object = json.decode(response.body);

      if (response.statusCode == 200 && object != null) return object;

      return null;
    } catch (ex) {
      print(ex);
    }
  }

  Future<bool> putRaceByIdRaceDriver(String raceId, int driverId) async {
    try {
      var response = await http.put(
        Uri.encodeFull(_debug
            ? "http://${Global.getServerUrl()}:3000/api/v1/races/$raceId?status=SetRaceFoundStrategy&motorista=$driverId"
            : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId$raceId"),
        headers: {
          "accept": "application/json",
        },
      );
      return true;
    } catch (ex) {
      return false;
    }
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
