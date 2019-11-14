import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;

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
                onPressed: () => Navigator.pop(context, false),
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
            height: 25,
          ),
          TextFormField(
            cursorColor: Color.fromRGBO(227, 222, 215, 0.8),
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'Nickname',
              fillColor: Color.fromRGBO(227, 222, 215, 0.8),
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Nickname é requerido';
              }
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
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
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[700],
            ),
            decoration: const InputDecoration(
              labelText: 'CPF',
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'CPF é requerido';
              }
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
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
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
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
                await Future.delayed(
                    const Duration(milliseconds: 3000), () => 42);
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

  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}
