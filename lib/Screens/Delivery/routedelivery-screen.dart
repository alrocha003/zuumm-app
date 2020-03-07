import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zuumm_app/Models/Race.dart';
import 'package:zuumm_app/Services/race-service.dart';

class RouteDeliveryScreen extends StatefulWidget {
  final Race race;
  const RouteDeliveryScreen({Key key, this.race}) : super(key: key);

  @override
  _RouteDeliveryScreenState createState() => _RouteDeliveryScreenState(race);
}

class _RouteDeliveryScreenState extends State<RouteDeliveryScreen> {
  final Race race;

  TextEditingController _observationController = new TextEditingController();
  _RouteDeliveryScreenState(this.race);

  final RaceService _service = new RaceService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: deliveryScreenWidget(context),
    );
  }

  createMaps() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: GoogleMap(
        indoorViewEnabled: true,
        mapType: MapType.normal,
        mapToolbarEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(20.688841, -24.044015),
          zoom: 11,
        ),
      ),
    );
  }

  deliveryScreenWidget(BuildContext _context) {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
              Text(
                "Confirmar pedido de entrega",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Container(
            decoration: new BoxDecoration(
                color: Colors.white24,
                borderRadius: new BorderRadius.all(
                  Radius.circular(10.0),
                )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
            ),
            padding: EdgeInsets.only(
              left: 10,
              top: 10,
              bottom: 20,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Descrição do objeto:",
                      style: _style(),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      race.description,
                      style: TextStyle(
                        fontSize: race.description.length > 38 ? 10 : 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Retirada:",
                      style: _style(),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(race.removal,
                        style: TextStyle(
                            fontSize: race.removal.length > 30 ? 14 : 16)),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Entrega:",
                      style: _style(),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      race.destination,
                      style: TextStyle(
                          fontSize: race.destination.length > 30 ? 12 : 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Valor:",
                      style: _style(),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(race.price.toString()),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: new TextFormField(
                controller: _observationController,
                decoration: new InputDecoration(
                  labelText: "Observação",
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
                    return "É necessário informar uma observação";
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
          Divider(
            color: Colors.grey,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.8,
            margin: EdgeInsets.all(10),
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(40.688841, -74.044015),
                zoom: 11,
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(
                  Radius.circular(20.0),
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            margin: EdgeInsets.only(left: 30.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: ProgressButton(
                    color: Colors.green,
                    progressWidget: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    borderRadius: 14,
                    onPressed: () async {
                      await Future.delayed(Duration(milliseconds: 3000),
                          () => confirmDelivery());
                    },
                    defaultWidget: new Text(
                      "Confirmar pedido",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Marker homeMarker = Marker(
    markerId: MarkerId('home'),
    position: LatLng(40.729640, -73.983510),
    infoWindow: InfoWindow(title: 'Casa'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

  TextStyle _style() {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white);
  }

  void confirmDelivery() {
    if (_formKey.currentState.validate()) {
      _service.postNewRace(new Race(
          userId: race.userId,
          description: race.description,
          removal: race.removal,
          destination: race.destination,
          observation: _observationController.value.text,
          price: race.price));

      notification(context, "Pedido de entrega enviado com sucesso");
    }
  }

  void notification(BuildContext context, String race) {
    showDialog(
      context: context,
      builder: (BuildContext context) => FancyDialog(
        title: "Pedido enviado",
        theme: FancyTheme.FANCY,
        animationType: 2,
        gifPath: FancyGif.SUBMIT,
        okColor: Colors.greenAccent[700],
        descreption: "$race",
        okFun: () => Navigator.pop(context, false),
      ),
      useRootNavigator: true,
    );
  }
}
