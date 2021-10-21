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
    double h = 170.0;
    double w = 160.0;
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
              height: 90.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 10,
                    bottom: 20,
                  ),
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
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
                            "Login",
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
                        return print("Informações detalhadas");
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 30,
                    bottom: 20,
                  ),
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
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
                            "Login",
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
                        return print("Informações detalhadas");
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 10,
                    bottom: 20,
                  ),
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
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
                            "Login",
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
                        return print("Informações detalhadas");
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 30,
                    bottom: 20,
                  ),
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
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
                            "Login",
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
                        return print("Informações detalhadas");
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 5,
              thickness: 5,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

Widget detailedInformations() {
  return Text("teste");
}
