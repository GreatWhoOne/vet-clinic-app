import 'package:flutter/material.dart';
import 'package:vet_app/utils/consts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Funcoes
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // render
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Drawer(
          child: ListView(children: [
            ListTile(title: Text('page 1')),
            Divider(thickness: 2),
            ListTile(title: Text('page 2')),
            Divider(thickness: 2),
            ListTile(title: Text('page 3')),
            Divider(thickness: 2),
          ]),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 50.0,
                  color: Colors.black,
                  onPressed: () {
                    _globalKey.currentState.openDrawer();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person_rounded),
                  iconSize: 50.0,
                  onPressed: () {},
                ),
              ],
            ),
            Text("Olá Jenny"),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 4),
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              width: 350.0,
              height: 100.0,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  width: 150.0,
                  height: 100.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      color: AppConsts.black),
                  width: 150.0,
                  height: 100.0,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  width: 150.0,
                  height: 100.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  width: 150.0,
                  height: 100.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
