import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vet_app/utils/common.dart';
import 'package:vet_app/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'availableVeterinaries.dart';

class NewSchedulling extends StatefulWidget {
  final String idUser;
  final String userName;
  NewSchedulling({Key key, @required this.idUser, this.userName})
      : super(key: key);

  @override
  _NewSchedullingState createState() => _NewSchedullingState();
}

class _NewSchedullingState extends State<NewSchedulling> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nova Consulta",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Seleciona a data desejada para ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: ' \nconsulta',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Adicionar Date picker

            SizedBox(
              height: setHeight(100.0),
            ),

            Text(
              _dateTime == null
                  ? 'Nenhuma data selecionada ainda'
                  // : DateFormat('yyyy-MM-dd').format(_dateTime),
                  : DateFormat('dd-MM-yyyy').format(_dateTime),

              // : _dateTime.toString(),
            ),

            RaisedButton(
                child: Text('Selecionar data'),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2023),
                  ).then((date) => {
                        setState(() => {_dateTime = date}),
                      });
                }),

            SizedBox(
              height: setHeight(150.0),
            ),

            Center(
              child: Container(
                height: setHeight(60.0),
                width: setWidth(300.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(2, 4),
                      color: Colors.grey.shade300,
                    ),
                  ],
                  color: AppConsts.blueBasic,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            "Pesquisar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    onPressed: () async {
                      print(_dateTime);
                      if (_dateTime == null) {
                        Fluttertoast.showToast(
                          msg: "Escolha uma data",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext contex) =>
                                AvailableVeterinaies(
                              date: _dateTime,
                              idUser: widget.idUser,
                              userName: widget.userName,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
