import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vet_app/pages/scheduling/confirmationScreen.dart';
import 'package:vet_app/utils/consts.dart';
import 'package:vet_app/utils/common.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class SelectTime extends StatefulWidget {
  final DateTime date;
  final String name;
  final String specialty;
  final String crmv;
  final String idUser;
  final String userName;
  final String idVet;

  SelectTime({
    this.date,
    this.name,
    this.crmv,
    this.specialty,
    this.idVet,
    this.idUser,
    this.userName,
  });

  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  Future registerTimeandDate(dateTime, idProp, idVet, time) async {
    var url = "http://192.168.0.103/flutter-app/insertDateTimeConsult.php";
    final response = await http.post(
      url,
      body: {
        "dateTime": dateTime,
        "idProp": idProp,
        "idVet": idVet,
      },
    );

    var data = json.decode(response.body);
    if (data == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext contex) => ConfirmationScreen(
            idUser: widget.idUser,
            userName: widget.userName,
            date: widget.date,
            time: time,
          ),
        ),
      );
      // Fluttertoast.showToast(
      //   msg: "Erro ao marcar consulta",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.CENTER,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );
    } else {
      Fluttertoast.showToast(
        msg: "Ruim",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);

    // Hours
    String time_8 = "8:00";
    String time_1030 = "10:30";
    String time_15 = "15:00";
    String time_1530 = "15:30";
    String time_1630 = "16:30";
    String time_1730 = "17:30";
    String resultTime;
    String resultDate;
    String resultDateTimeFormattedBd;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Horários disponíveis",
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
          Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Container(
                height: setHeight(100.0),
                width: setWidth(300.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(2, 4),
                      color: Colors.grey.shade300,
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                        child: Text(
                          "Dr(a). ${widget.name}\n " +
                              "${widget.specialty}\n" +
                              "CRMV: ${widget.crmv}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
                      time_8,
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
                  resultTime = time_8;
                  resultDate = DateFormat('yyyy-MM-dd').format(widget.date);
                  resultDateTimeFormattedBd =
                      resultDate + ' ' + resultTime + ":00";

                  print("ID_PROPRIETARIO = " + widget.idUser);
                  print("ID_VETERINARIO = " + widget.idVet);

                  print(resultDateTimeFormattedBd);

                  registerTimeandDate(
                    resultDateTimeFormattedBd,
                    widget.idUser,
                    widget.idVet,
                    resultTime,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: setHeight(10.0),
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
                      time_1030,
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
                  resultTime = time_1030;
                  resultDate = DateFormat('yyyy-MM-dd').format(widget.date);
                  resultDateTimeFormattedBd =
                      resultDate + ' ' + resultTime + ":00";

                  print("ID_PROPRIETARIO = " + widget.idUser);
                  print("ID_VETERINARIO = " + widget.idVet);

                  print(resultDateTimeFormattedBd);

                  registerTimeandDate(
                    resultDateTimeFormattedBd,
                    widget.idUser,
                    widget.idVet,
                    resultTime,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: setHeight(10.0),
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
                      time_15,
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
                  resultTime = time_15;
                  resultDate = DateFormat('yyyy-MM-dd').format(widget.date);
                  resultDateTimeFormattedBd =
                      resultDate + ' ' + resultTime + ":00";

                  print("ID_PROPRIETARIO = " + widget.idUser);
                  print("ID_VETERINARIO = " + widget.idVet);

                  print(resultDateTimeFormattedBd);

                  registerTimeandDate(
                    resultDateTimeFormattedBd,
                    widget.idUser,
                    widget.idVet,
                    resultTime,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: setHeight(10.0),
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
                      time_1530,
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
                  resultTime = time_1530;
                  resultDate = DateFormat('yyyy-MM-dd').format(widget.date);
                  resultDateTimeFormattedBd =
                      resultDate + ' ' + resultTime + ":00";

                  print("ID_PROPRIETARIO = " + widget.idUser);
                  print("ID_VETERINARIO = " + widget.idVet);

                  print(resultDateTimeFormattedBd);

                  registerTimeandDate(
                    resultDateTimeFormattedBd,
                    widget.idUser,
                    widget.idVet,
                    resultTime,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: setHeight(10.0),
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
                      time_1630,
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
                  resultTime = time_1630;
                  resultDate = DateFormat('yyyy-MM-dd').format(widget.date);
                  resultDateTimeFormattedBd =
                      resultDate + ' ' + resultTime + ":00";

                  print("ID_PROPRIETARIO = " + widget.idUser);
                  print("ID_VETERINARIO = " + widget.idVet);

                  print(resultDateTimeFormattedBd);

                  registerTimeandDate(
                    resultDateTimeFormattedBd,
                    widget.idUser,
                    widget.idVet,
                    resultTime,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: setHeight(10.0),
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
                      time_1730,
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
                  resultTime = time_1730;
                  resultDate = DateFormat('yyyy-MM-dd').format(widget.date);
                  resultDateTimeFormattedBd =
                      resultDate + ' ' + resultTime + ":00";

                  print("ID_PROPRIETARIO = " + widget.idUser);
                  print("ID_VETERINARIO = " + widget.idVet);

                  print(resultDateTimeFormattedBd);

                  registerTimeandDate(
                    resultDateTimeFormattedBd,
                    widget.idUser,
                    widget.idVet,
                    resultTime,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: setHeight(10.0),
          ),
        ],
      ),
    );
  }
}
