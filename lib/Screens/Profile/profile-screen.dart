import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Perfil",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
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
            Text("Nome"),
            SizedBox(
              height: 4,
            ),
            Text(
              "Alex Rocha",
              style: _style(),
            ),
            Text(
              "E-mail",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("alrocha003@gmail.com"),
            SizedBox(
              height: 16,
            ),
            Text(
              "Localização",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Sorocaba, São Paulo, BRA"),
            SizedBox(
              height: 16,
            ),
            Text(
              "Idioma",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Português, Inglês"),
            SizedBox(
              height: 16,
            ),
            Text(
              "Profissão",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Analista de Sistemas"),
            SizedBox(
              height: 16,
            ),
            Text(
              "Usuário desde",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("29/11/2019"),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

final String url = "https://photos.app.goo.gl/aJpPTi4g4ZtVEjtC7";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.maxFinite, 200);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(color: Colors.orangeAccent[700], boxShadow: [
          BoxShadow(
              color: Colors.orangeAccent[700],
              blurRadius: 20,
              offset: Offset(0, 0))
        ]),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Perfil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(url))),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Alex Rocha",
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Pedidos Realizados: ",
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
                Column(
                  children: <Widget>[
                    Text(
                      "Savings",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "20K",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
                SizedBox(
                  width: 32,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "July Goals",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("50K",
                        style: TextStyle(color: Colors.white, fontSize: 24))
                  ],
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  print("//TODO: button clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
                  child: Transform.rotate(
                    angle: (math.pi * 0.05),
                    child: Container(
                      width: 110,
                      height: 32,
                      child: Center(
                        child: Text("Edit Profile"),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height - 60);
    p.lineTo(size.width, size.height / 1.05);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
