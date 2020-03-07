import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:zuumm_app/Models/Profile.dart';
import 'package:fancy_dialog/fancy_dialog.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.profile}) : super(key: key);
  final Profile profile;

  @override
  _ProfileScreenState createState() => _ProfileScreenState(profile);
}

class _ProfileScreenState extends State<ProfileScreen> {
  _ProfileScreenState(this.profile);
  final Profile profile;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    String _message = "";
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else {
          _message = msg['notification']['data']['message'];
          _message = _message.isEmpty ? msg['data']['message'] : _message;
        }
        print('on message $_message');
        if (profile.idProfile == 2) notificationRacer(context, _message);
      },
      onResume: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['data']['message'];
        _message = _message.isEmpty ? msg['data']['message'] : _message;
        print('on message $_message');
        if (profile.idProfile == 2) notificationRacer(context, _message);
      },
      onLaunch: (Map<String, dynamic> msg) async {
        if (Theme.of(context).platform == TargetPlatform.iOS)
          _message = msg['aps']['alert'];
        else
          _message = msg['notification']['data']['message'];
        _message = _message.isEmpty ? msg['data']['message'] : _message;
        print('on message $_message');
        if (profile.idProfile == 2) notificationRacer(context, _message);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Perfil",
      home: ProfilePage(profile: profile),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({this.profile});
  Profile profile;

  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return profileWidget();
  }

  Widget profileWidget() {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Nome",
              style: _style(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              profile.name ?? "",
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "E-mail",
              style: _style(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(profile.email ?? ""),
            SizedBox(
              height: 8,
            ),
            Text(
              "Endereço",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(profile.address ?? ""),
            SizedBox(
              height: 8,
            ),
            Text(
              "Nº",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Bairro",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(profile.neighborhood ?? ""),
            SizedBox(
              height: 8,
            ),
            Text(
              "Cidade",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(profile.city ?? ""),
            SizedBox(
              height: 8,
            ),
            Text(profile.number ?? ""),
            SizedBox(
              height: 8,
            ),
            Text(
              "CEP",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(profile.cep ?? ""),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Telefone",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(profile.telephone ?? ""),
            SizedBox(
              height: 8,
            ),
            profile.idProfile == 2
                ? Text(
                    "CNH",
                    style: _style(),
                  )
                : Text(""),
            SizedBox(
              height: 4,
            ),
            profile.idProfile == 2 ? Text(profile.since.toString()) : Text(''),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

final url = "https://photos.app.goo.gl/aJpPTi4g4ZtVEjtC7";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.maxFinite, 250);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 3),
        decoration: BoxDecoration(color: Colors.orange[700], boxShadow: [
          BoxShadow(
              color: Colors.orangeAccent[700],
              blurRadius: 20,
              offset: Offset(0, 0))
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "Perfil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  width: 190,
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    logout(context);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      // margin: EdgeInsets.only(left: 20),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://picsum.photos/250?image=9"))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Pedidos Realizados:",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "8",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Avaliações",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "4",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 16,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  print("//TODO: button clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Container(
                    width: 140,
                    height: 40,
                    child: Center(
                      child: Text("Configurações"),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 20)
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => FancyDialog(
        title: "Logout",
        theme: FancyTheme.FANCY,
        animationType: 2,
        okColor: Colors.greenAccent[700],
        cancelColor: Colors.orange[400],
        descreption: "Deseja fazer logout da aplicação?",
        okFun: () => Navigator.pop(context, false),
        cancelFun: () => null,
      ),
      useRootNavigator: true,
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height - 40);
    p.lineTo(size.width, size.height / .55);

    p.lineTo(size.width, 10);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
