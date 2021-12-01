import 'package:flutter/material.dart';
import 'package:vet_app/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SchedullingLog extends StatefulWidget {
  final DateTime date;
  final String idUser;
  final String userName;
  const SchedullingLog(
      {Key key, @required this.date, this.userName, this.idUser})
      : super(key: key);

  @override
  _SchedullingLogState createState() => _SchedullingLogState();
}

class _SchedullingLogState extends State<SchedullingLog> {
  Future<List> getConsulta() async {
    var url = "http://192.168.0.103/flutter-app/obterConsulta.php";
    var response = await http.post(url, body: {
      "idUser": widget.idUser,
    });

    return json.decode(response.body);
  }

  Future<List> getVetData() async {
    var url = "http://192.168.0.103/flutter-app/obterVeterinario.php";
    var response = await http.get(url);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consultas marcadas",
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
      body: FutureBuilder(
        future: getConsulta(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var list = snapshot.data;

                    return ListTile(
                      title: Text(
                        list[index]['NOME'] +
                            list[index]['DATA_HORA_CONSULTA'] +
                            "${widget.idUser}",
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
