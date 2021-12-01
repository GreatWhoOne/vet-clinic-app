import 'package:flutter/material.dart';
import 'package:vet_app/pages/scheduling/selectTime.dart';
import 'package:vet_app/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AvailableVeterinaies extends StatefulWidget {
  final DateTime date;
  final String idUser;
  final String userName;

  const AvailableVeterinaies(
      {Key key, @required this.date, this.userName, this.idUser})
      : super(key: key);

  @override
  _AvailableVeterinaiesState createState() => _AvailableVeterinaiesState();
}

class _AvailableVeterinaiesState extends State<AvailableVeterinaies> {
  Future<List> getVetData() async {
    var url = "http://192.168.0.103/flutter-app/obterVeterinario.php";
    var response = await http.get(url);

    return json.decode(response.body);
  }

  Future<List> getCargo() async {
    var url = "http://192.168.0.103/flutter-app/obterCargo.php";
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
          "Veterinários disponíveis",
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
        future: Future.wait(
          [
            getVetData(),
            getCargo(),
          ],
        ),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var list = snapshot.data[0];
                    var list2 = snapshot.data[1];
                    return ListTile(
                      title: Text(list[index]['NOME'] +
                          '\nCRMV - ' +
                          list2[index]["NUM_CRMV"]),
                      subtitle: Text(
                        list2[index]['NOME'],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext contex) => SelectTime(
                              date: widget.date,
                              idUser: widget.idUser,
                              userName: widget.userName,
                              idVet: list[index]["ID_VETERINARIO"],
                              name: list[index]["NOME"],
                              crmv: list2[index]["NUM_CRMV"],
                              specialty: list2[index]['NOME'],
                            ),
                          ),
                        );
                      },
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
