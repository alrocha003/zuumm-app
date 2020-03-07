import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:zuumm_app/Models/Notification.dart' as notify;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:zuumm_app/Models/Profile.dart';
import 'package:zuumm_app/Models/Race.dart';
import 'package:zuumm_app/Screens/Delivery/routedelivery-screen.dart';
import 'package:zuumm_app/Screens/Profile/profile-screen.dart';
import 'package:zuumm_app/Screens/Recents/recents-screen.dart';

@immutable
class HomeScreen extends StatefulWidget {
  final Profile profile;

  HomeScreen({Key key, this.profile}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState(profile);
}

class _HomeScreenState extends State<HomeScreen> {
  Profile _profile;

  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _originController = new TextEditingController();
  TextEditingController _destinyController = new TextEditingController();
  _HomeScreenState(this._profile);

  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final List<notify.Notification> notifications = [];
  bool _isMotorcycle = true;
  bool _isCar = false;
  bool _isTruck = false;
  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);
  final String kGoogleApiKey = "AIzaSyAECZC7fPj170n6GFXhdYLvFLAKk8dhKBA";
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: "AIzaSyAECZC7fPj170n6GFXhdYLvFLAKk8dhKBA");
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  double price;

  @override
  void initState() {
    super.initState();
    String _message = "";
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['data']['message'];
        print('on message $_message');
        if (_profile.idProfile == 2) notificationRacer(context, _message);
      },
      onResume: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['data']['message'];
        print('on message $_message');
        if (_profile.idProfile == 2) notificationRacer(context, _message);
      },
      onLaunch: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['data']['message'];
        print('on message $_message');
        if (_profile.idProfile == 2) notificationRacer(context, _message);
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  void notificationRacer(BuildContext context, String race) {
    showDialog(
      context: context,
      builder: (BuildContext context) => FancyDialog(
        title: "Corrida encontrada",
        theme: FancyTheme.FLAT,
        animationType: 2,
        gifPath: FancyGif.FUNNY_MAN,
        okColor: Colors.greenAccent[700],
        cancelColor: Colors.orange[400],
        descreption: "Deseja aceitar a corrida? $race",
        okFun: () => null,
        cancelFun: () => null,
      ),
      useRootNavigator: true,
    );
  }

  homeScreenWidget(BuildContext context) {
    final Size responsiveSize = MediaQuery.of(context).size;
    return new Container(
      color: Colors.orange[700],
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "Nova entrega",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "O que você deseja enviar?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 18,
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: new TextFormField(
                  controller: _descriptionController,
                  decoration: new InputDecoration(
                    labelText: "    Insira uma descrição de produto",
                    counterStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Insira uma descrição de objeto";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Porte do veículo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Checkbox(
                    value: _isMotorcycle,
                    onChanged: motorcycleChange,
                    activeColor: Colors.red[700],
                    checkColor: Colors.white,
                  ),
                  Icon(
                    Icons.motorcycle,
                    color: Colors.white,
                    size: 30.0,
                    semanticLabel: 'Motocicleta',
                  ),
                  new Checkbox(
                    value: _isCar,
                    onChanged: carChange,
                    activeColor: Colors.red[700],
                  ),
                  Icon(
                    Icons.drive_eta,
                    color: Colors.white,
                    size: 30.0,
                    semanticLabel: 'Carro',
                  ),
                  new Checkbox(
                    value: _isTruck,
                    onChanged: truckChange,
                    activeColor: Colors.red[700],
                  ),
                  Icon(
                    Icons.tram,
                    color: Colors.white,
                    size: 30.0,
                    semanticLabel: 'Caminhão',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 18,
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: new TextFormField(
                  controller: _originController,
                  decoration: new InputDecoration(
                    labelText: "Saída",
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Insira um endereço de saída";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onTap: () {
                    // _handlePressButton();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 15,
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.black,
                ),
                child: new TextFormField(
                  controller: _destinyController,
                  decoration: new InputDecoration(
                    labelText: "Destino",
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Insira um endereço de destino";
                    } else {
                      return null;
                    }
                  },
                  onTap: () {
                    // _handlePressButton();
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            new Container(
              height: responsiveSize.height / 10,
              width: responsiveSize.width / 1.1,
              child: new FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                color: Colors.black38,
                onPressed: () => navigateToRouteDeliveryScreen(context),
                child: new Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: Text(
                          "Procurar motorista",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void motorcycleChange(previous) {
    setState(() {
      _isMotorcycle = true;
      _isCar = false;
      _isTruck = false;
    });
  }

  void carChange(previous) {
    setState(() {
      _isCar = true;
      _isMotorcycle = false;
      _isTruck = false;
    });
  }

  void truckChange(previous) {
    setState(() {
      _isCar = false;
      _isMotorcycle = false;
      _isTruck = true;
    });
  }

  pageViewWidget() {
    return PageView(
      controller: _controller,
      physics: new AlwaysScrollableScrollPhysics(),
      children: _profile?.idProfile == 1
          ? <Widget>[
              RecentsScreen(id: _profile.id, idProfile: _profile.idProfile),
              homeScreenWidget(context),
              ProfileScreen(profile: _profile)
            ]
          : <Widget>[
              RecentsScreen(id: _profile.id, idProfile: _profile.idProfile),
              ProfileScreen(profile: _profile)
            ],
      scrollDirection: Axis.horizontal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange[700],
      body: pageViewWidget(),
      bottomNavigationBar: new Container(
        height: MediaQuery.of(context).size.height / 13,
        child: CurvedNavigationBar(
          initialIndex: 1,
          backgroundColor: Colors.white,
          items: _profile?.idProfile == 1
              ? <Widget>[
                  Icon(Icons.access_time, size: 30),
                  Icon(Icons.home, size: 30),
                  Icon(Icons.person, size: 30)
                ]
              : <Widget>[
                  Icon(Icons.access_time, size: 30),
                  Icon(Icons.person, size: 30)
                ],
          onTap: (index) {
            if (index == 0)
              gotoRecents();
            else if (index == 1)
              gotoHome();
            else if (index == 2) gotoProfile();
          },
        ),
      ),
    );
  }

  gotoRecents() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceOut,
    );
  }

  gotoHome() {
    _controller.animateToPage(
      1,
      duration: Duration(microseconds: 500),
      curve: Curves.bounceOut,
    );
  }

  gotoProfile() {
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 1000),
      curve: Curves.bounceOut,
    );
  }

  Future<void> _handlePressButton() async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: Mode.fullscreen,
      language: "pt",
      components: [Component(Component.country, "br")],
    );

    displayPrediction(p, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;

      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
    }
  }

  void navigateToRouteDeliveryScreen(BuildContext _context) async {
    if (_formKey.currentState.validate()) {
      var race = new Race(
          description: _descriptionController.value.text,
          destination: _destinyController.value.text,
          initialRaceDate: DateTime.now().toString(),
          price: getRacePrice(),
          removal: _originController.value.text,
          userId: _profile.id);

      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RouteDeliveryScreen(
                    race: race,
                  )));
    }
  }

  double getRacePrice() {
    if (_isMotorcycle) {
      return 5.0 + (1.49 * 17);
    } else if (_isCar) {
      return 10.0 + (3.50 * 17);
    } else if (_isTruck) {
      return 10.0 + (5.0 * 17);
    }
    return 0.0;
  }
}
