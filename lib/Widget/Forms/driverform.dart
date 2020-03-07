import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:zuumm_app/Models/Driver.dart';
import 'package:zuumm_app/Models/Veichle.dart';
import 'package:zuumm_app/Services/signup-service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  final SignupService _service = new SignupService();
  final _name = TextEditingController();
  final _cargamax = TextEditingController();
  final _cnh = TextEditingController();
  final _city = TextEditingController();
  final _password = TextEditingController();
  final _address = TextEditingController();
  final _number = TextEditingController();
  final _neighboor = TextEditingController();
  final _phone = TextEditingController();
  final _cep = TextEditingController();
  final _mail = TextEditingController();
  final _placa = TextEditingController();
  final _model = TextEditingController();
  final _color = TextEditingController();
  final _year = TextEditingController();
  final _renavam = TextEditingController();
  String _token = "";

  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  void initState() {
    super.initState();
    String _message = "";
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['body'];
        print('on message $_message');
      },
      onResume: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['body'];
        print('on message $_message');
      },
      onLaunch: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['body'];
        print('on message $_message');
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.getToken().then((token) {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.orange[700],
                ),
                onPressed: () => Navigator.of(context).pushNamed('/initial'),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                "Cadastrar Motorista",
                style: TextStyle(
                  color: Colors.orange[700],
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _name,
            maxLength: 30,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Nome Completo',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Nome Completo é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _cnh,
            maxLength: 10,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'CNH',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'CNH é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            maxLength: 50,
            controller: _city,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Cidade',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Cidade é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            maxLength: 120,
            controller: _password,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Senha',
              hintText: '*********',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Senha é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            maxLength: 150,
            controller: _address,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Endereço',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Endereço é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Nº Residencial',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Nº Residencial é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _neighboor,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Bairro',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Bairro é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _phone,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Telefone',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Telefone é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _cep,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Cep',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Cep é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _mail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Email é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _placa,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Placa',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Placa é requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _model,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Modelo',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Modelo é requerido';
              }
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _color,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Cor',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Cor é requerido';
              }
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _year,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Ano',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Ano é requerido';
              }
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _renavam,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Renavam',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Renavam é requerido';
              }
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _cargamax,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Carga Máxima (em kg)',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Carga Máxima é requerido';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: _agreedToTOS,
                  onChanged: _setAgreedToTOS,
                ),
                GestureDetector(
                  onTap: () => _setAgreedToTOS(!_agreedToTOS),
                  child: Text(
                    'Eu aceito os termos de serviço',
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50),
            child: ProgressButton(
              color: Color.fromRGBO(251, 163, 23, 0.9),
              progressWidget: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.teal,
                  )),
              width: 300,
              height: 40,
              onPressed: () async {
                await Future.delayed(
                    const Duration(milliseconds: 3000), () => {_submit()});
                return () {};
              },
              defaultWidget: new Text(
                "Cadastrar",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _service.signupDriver(new Driver(
        address: _address.value.text,
        cep: _cep.value.text,
        city: _city.value.text,
        cnh: int.tryParse(_cnh.value.text),
        deviceToken: _token,
        email: _mail.value.text,
        idProfile: 2,
        name: _name.value.text,
        neighborhood: _neighboor.value.text,
        number: int.tryParse(_number.value.text),
        password: _password.value.text,
        telephone: _phone.value.text,
        vehicles: encodeToJson([
          new Vehicle(
              licensePlate: _placa.value.text,
              model: _model.value.text,
              color: _model.value.text,
              year: int.tryParse(_year.value.text),
              renavan: _renavam.value.text,
              maximumLoad: double.tryParse(_cargamax.value.text))
        ]),
      ));
      // .whenComplete(() => (data) {
      //       Scaffold.of(context).showSnackBar(SnackBar(
      //           content: Text('Motorista cadastrado com sucesso')));
      //       Navigator.of(context).pushNamed('/Login');
      //     })
      // .catchError(() => () {
      //       Scaffold.of(context).showSnackBar(SnackBar(
      //           content: Text('Houve um erro ao cadastrar o motorista')));
      //     });
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Motorista cadastrado com sucesso')));
      Navigator.of(context).pushNamed('/Login');
    }
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }

  static List encodeToJson(List<Vehicle> list) {
    List jsonList = List();
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }
}
