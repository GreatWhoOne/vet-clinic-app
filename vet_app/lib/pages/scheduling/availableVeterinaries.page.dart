import 'package:cloud_firestore/cloud_firestore.dart';
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

    var snapshots = Firestore.instance
        .collection('veterinarios')
        .where('isAvailable', isEqualTo: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consultas disponíveis",
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
      body: StreamBuilder(
        stream: snapshots,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data.documents.length == 0) {
            return Center(
              child: Text('Nenhuma consulta disponível para esta data'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int i) {
              var item = snapshot.data.documents[i].data;

              return Container(
                height: setHeight(120.0),
                width: setWidth(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:
                      (i % 2 == 0) ? AppConsts.pinkBasic : AppConsts.blueBasic,
                ),
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: ListTile(
                  title: Text(
                    item['nome'] + ' ' + item['sobrenome'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  subtitle: Text(
                    'CRMV:' +
                        ' ' +
                        item['crmv'].toString() +
                        ' ' +
                        '\n' +
                        'horario disponível:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
