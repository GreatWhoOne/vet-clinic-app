import 'package:flutter/material.dart';
import 'package:vet_app/utils/common.dart';
import 'package:vet_app/utils/consts.dart';

class AvailableVeterinaies extends StatefulWidget {
  AvailableVeterinaies({Key key}) : super(key: key);

  @override
  _AvailableVeterinaiesState createState() => _AvailableVeterinaiesState();
}

class _AvailableVeterinaiesState extends State<AvailableVeterinaies> {
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
      body: Text("Listar todos os veterinários"),
    );
  }
}

// var url = "http://192.168.0.103/flutter-app/obterVeterinario.php";
