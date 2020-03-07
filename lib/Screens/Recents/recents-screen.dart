import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zuumm_app/Services/race-service.dart';

@immutable
class RecentsScreen extends StatefulWidget {
  final int id, idProfile;
  RecentsScreen({Key key, this.id, this.idProfile}) : super(key: key);

  @override
  _RecentsScreenState createState() =>
      _RecentsScreenState(this.id, this.idProfile);
}

class _RecentsScreenState extends State<RecentsScreen> {
  RaceService _service = new RaceService();
  List data;
  int userId;
  int idProfile;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

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
        if (idProfile == 2) notificationRacer(context, _message);
      },
      onResume: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['data']['message'];
        print('on message $_message');
        if (idProfile == 2) notificationRacer(context, _message);
      },
      onLaunch: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['data']['message'];
        print('on message $_message');
        if (idProfile == 2) notificationRacer(context, _message);
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

  _RecentsScreenState(this.userId, this.idProfile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[700],
      body: recentsListBuilderFuture(),
    );
  }

  Widget recentsListBuilderFuture() {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Row(children: <Widget>[
          new SizedBox(width: 80.0),
          new Text("Recentes",
              style: TextStyle(
                color: Colors.white,
              )),
        ]),
      ),
      body: Container(
        child: FutureBuilder(
          future: idProfile > 1
              ? this._service.getAllRacesByDriverId(userId)
              : this._service.getAllRacesByUserId(userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Center(child: Text("Não existem corridas recentes."));
            } else {
              return ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                    leading: Icon(
                      Icons.motorcycle,
                      color: Colors.red,
                    ),
                    title: Text(
                      '${snapshot.data[index]["Descricao"]}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.redAccent[700]),
                      textAlign: TextAlign.justify,
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Text('Origem: ${snapshot.data[index]["LocalOrigem"]}'),
                        Text(
                            'Destino: ${snapshot.data[index]["LocalDestino"]}'),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              'Status: ${snapshot.data[index]["StatusCorrida"]}',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.orange[700]),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                                'Valor: ${snapshot.data[index]["ValorCorrida"]}'),
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ));
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget recentsListBuilder() {
    if (data != null && data.length > 0) {
      return new ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, i) => new ListTile(
                leading: Icon(
                  Icons.motorcycle,
                  color: Colors.red,
                ),
                title: Text(
                  data[i]["description"].toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent[700]),
                  textAlign: TextAlign.justify,
                ),
                subtitle: Column(
                  children: <Widget>[
                    Text('Origem: ${data[i]["removal"].toString()}'),
                    Text('Destino: ${data[i]["destination"].toString()}'),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          'Motorista: ${data[i]["driver"].toString()}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text('Valor: ${data[i]["price"].toString()}'),
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.more_vert),
              ));
    } else {
      return new Container(
          child: Center(
        child: Text("Não existem dados para serem exibidos"),
      ));
    }
  }
}
