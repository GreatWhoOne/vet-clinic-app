import 'package:flutter/material.dart';
import 'dart:async';

import 'package:vet_app/pages/main.page.dart';

class Splash extends StatefulWidget {
  final String idUser;

  final String userName;
  Splash({Key key, @required this.idUser, this.userName}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(
            idUser: widget.idUser.toString(),
            userName: widget.userName,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Carregando...",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 11.0,
            ),
          ],
        ),
      ),
    );
  }
}
