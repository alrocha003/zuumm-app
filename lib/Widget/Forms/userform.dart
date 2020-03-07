import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:zuumm_app/Models/User.dart';
import 'package:zuumm_app/Services/signup-service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({Key key}) : super(key: key);

  @override
  _UserRegisterFormState createState() => _UserRegisterFormState();
}

class _UserRegisterFormState extends State<UserRegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  final _address = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _city = TextEditingController();
  final _neighboor = TextEditingController();
  final _number = TextEditingController();
  final _cep = TextEditingController();
  final _phone = TextEditingController();
  String _token = "";
  bool isComplete = false;
  final SignupService _service = new SignupService();
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
    return isComplete
        ? Center(
            child: Column(
            children: <Widget>[
              Icon(
                const IconData(59675, fontFamily: 'MaterialIcons'),
                color: Colors.white,
                size: 40.0,
              ),
              Text("Cadastro realizado com sucesso"),
            ],
          ))
        : Form(
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
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/initial'),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "Cadastrar Usuário",
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
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _name,
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
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _password,
                  cursorColor: Color.fromRGBO(227, 222, 215, 0.8),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange[700],
                  ),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    fillColor: Color.fromRGBO(227, 222, 215, 0.8),
                    hintText: '*********',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'O campo senha é requerido';
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _email,
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
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
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
                      return 'O campo cidade é requerido';
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
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
                      return 'O campo endereço é requerido';
                    }
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
                    labelText: 'Nº',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'O campo nº é requerido';
                    }
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
                      return 'O campo bairro é requerido';
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _phone,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange[700],
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'O campo telefone é requerido';
                    }
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
                      return 'O campo cep é requerido';
                    }
                  },
                ),
                SizedBox(height: 30.0),
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
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: ProgressButton(
                    color: Color.fromRGBO(251, 163, 23, 0.9),
                    progressWidget: CircularProgressIndicator(
                      backgroundColor: Colors.teal,
                    ),
                    width: 300,
                    height: 40,
                    onPressed: () async {
                      await Future.delayed(const Duration(milliseconds: 3000),
                          () => {_submit()});
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
    try {
      if (_formKey.currentState.validate())
        _service.signupClient(new User(
          name: _name.value.text,
          email: _email.value.text,
          idProfile: 1,
          city: _city.value.text,
          password: _password.value.text,
          address: _address.value.text,
          number: _number.value.text,
          neighborhood: _neighboor.value.text,
          telephone: _phone.value.text,
          cep: _cep.value.text,
          deviceToken: _token,
        ));
      // .whenComplete(() => (data) {
      //       if (data) {
      //         Scaffold.of(context).showSnackBar(SnackBar(
      //             content: Text('Usuário cadastrado com sucesso')));
      //       }
      //       Navigator.of(context).pushNamed('/Login');
      //     })
      // .catchError(() => () {
      //       Scaffold.of(context).showSnackBar(SnackBar(
      //           content: Text('Houve um erro ao cadastrar o usuário')));
      //     });
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Usuário cadastrado com sucesso')));
      Navigator.of(context).pushNamed('/Login');
    } catch (ex) {
      print(ex);
    }
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}
