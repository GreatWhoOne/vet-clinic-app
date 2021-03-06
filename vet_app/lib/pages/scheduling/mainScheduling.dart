import 'package:flutter/material.dart';
import 'package:vet_app/pages/scheduling/schedullingLog.dart';
import 'package:vet_app/utils/common.dart';
import 'package:vet_app/utils/consts.dart';

import 'newScheduling.dart';

class MainSchedulling extends StatefulWidget {
  final String idUser;
  final String userName;
  MainSchedulling({Key key, @required this.idUser, this.userName})
      : super(key: key);

  @override
  _MainSchedullingState createState() => _MainSchedullingState();
}

class _MainSchedullingState extends State<MainSchedulling> {
  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agendamentos",
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: setHeight(180.0),
              width: setWidth(150.0),
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          child: Image.asset("assets/icons/calendar.png"),
                          height: 48,
                          width: 48,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "Nova Consulta",
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => NewSchedulling(
                          idUser: widget.idUser,
                          userName: widget.userName,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: setHeight(30.0),
          ),
          Center(
            child: Container(
              height: setHeight(180.0),
              width: setWidth(150.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(2, 4),
                    color: Colors.grey.shade300,
                  ),
                ],
                color: AppConsts.pinkBasic,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          child: Image.asset("assets/icons/calendar.png"),
                          height: 48,
                          width: 48,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Registro de consultas",
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SchedullingLog(
                          idUser: widget.idUser,
                          userName: widget.userName,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
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
            label: 'Home',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
