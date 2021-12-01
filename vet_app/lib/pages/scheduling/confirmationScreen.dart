import 'package:flutter/material.dart';
import 'package:vet_app/pages/main.page.dart';
import 'package:vet_app/utils/consts.dart';
import 'package:vet_app/utils/common.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'newScheduling.dart';

class ConfirmationScreen extends StatefulWidget {
  final String idUser;
  final String userName;
  final DateTime date;
  final String time;
  ConfirmationScreen({this.idUser, this.userName, this.date, this.time});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    String dateFormatterd = DateFormat('dd/MM/yyyy').format(widget.date);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirmação de agendamento",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppConsts.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(
              30.0,
            ),
            child: Container(
              height: setHeight(120.0),
              width: setWidth(300.0),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        "Sr(a). ${widget.userName}\n\n" +
                            "Sua consulta ficou agendada para às ${widget.time} no dia $dateFormatterd.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/okImage.png",
              height: setHeight(200.0),
              // width: setWidth(20.0),
            ),
          ),
          SizedBox(
            height: setHeight(30.0),
          ),
          Container(
            height: setHeight(50.0),
            width: setWidth(300.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [
                  Colors.black54,
                  Colors.black12,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Agendar outra consulta",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewSchedulling(
                        idUser: widget.idUser,
                        userName: widget.userName,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: setHeight(20.0),
          ),
          Container(
            height: setHeight(50.0),
            width: setWidth(300.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [
                  Colors.black54,
                  Colors.black12,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Voltar ao início",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext contex) => MainPage(
                        userName: widget.userName,
                        idUser: widget.idUser,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
