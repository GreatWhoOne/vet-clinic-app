import 'package:flutter/material.dart';
import 'package:vet_app/utils/common.dart';
import 'package:vet_app/utils/consts.dart';

class NewSchedulling extends StatefulWidget {
  NewSchedulling({Key key}) : super(key: key);

  @override
  _NewSchedullingState createState() => _NewSchedullingState();
}

class _NewSchedullingState extends State<NewSchedulling> {
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
      body: Column(
        children: [
          Text(
            "Selecione uma data",
          ),
          Container(
            child: Container(
              height: setHeight(100.0),
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
                      ),
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
                  onPressed: () {
                    // Send to available vet
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext contex) => NewSchedulling(),
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
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
