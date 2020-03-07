import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zuumm_app/Infra/Global.dart';
import 'package:zuumm_app/Models/Driver.dart';
import 'package:zuumm_app/Models/User.dart';

class SignupService {
  final bool debug = Global.isDebug();
  
  Future<bool> signupClient(User user) async {
    var uri = Uri.encodeFull(debug
        ? "http://${Global.getServerUrl()}:5000/api/usuario/cliente"
        : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId");
    var map = user.toMap();
    var response = await http.post(uri,
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(map));

    if (response.statusCode == 200) return true;

    return false;
  }

  Future<bool> signupDriver(Driver driver) async {
    try {
      var url = Uri.encodeFull(debug
          ? "http://${Global.getServerUrl()}:5000/api/usuario/motorista"
          : "https://my-json-server.typicode.com/alrocha003/zuum-json-api/races?userId");
      var map = driver.toMap();
      var parameters = utf8.encode(jsonEncode(map));
      var response = await http.post(url,
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: parameters);

      if (response.statusCode == 200) return true;

      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
