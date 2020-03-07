import 'package:http/http.dart';
import 'package:zuumm_app/Infra/Global.dart';
import 'package:zuumm_app/Models/Profile.dart';
import 'dart:convert';

class LoginService {
  bool debug = Global.isDebug();

  Future<Profile> verifyLogin(String username, String pass) async {
    String loginUrl = debug
        ? '''http://${Global.getServerUrl()}:5000/api/login/${username?.trim()}/$pass'''
        : '''https://my-json-server.typicode.com/alrocha003/zuum-json-api/Clientes?Email=$username&Senha=$pass''';

    Response res = await post(loginUrl);
    var object = json.decode(res.body);
    if (res.statusCode == 200 && (object != null && object.length > 0))
      return Profile.fromJson(object);
    else
      return null;
  }

  Future<Profile> _createObjLogin(body) async {
    return new Profile(
        idProfile: body[2],
        name: body[0],
        email: body[1],
        password: body[4],
        address: body[5],
        language: "",
        profession: "",
        since: DateTime.now(),
        orders: null,
        assessments: null,
        urlImg: "",
        cep: body[8],
        city: body[3],
        deviceToken: body[9],
        neighborhood: body[6],
        number: null,
        telephone: body[7]);
  }
}
