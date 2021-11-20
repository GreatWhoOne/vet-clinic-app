import 'package:flutter/material.dart';
import 'package:vet_app/pages/scheduling/mainScheduling.dart';
import 'package:vet_app/utils/common.dart';
import 'package:vet_app/utils/consts.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class MainPage extends StatefulWidget {
  final String text;
  MainPage({Key key, @required this.text}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Funcoes
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // For the carousel_slider
  // List<String> photos = [];

  // render
  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);

    // Variables for buttons
    double h = setHeight(180.0);
    double w = setWidth(150.0);

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
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 30.0,
          right: 30.0,
          bottom: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu_rounded),
                  iconSize: 50.0,
                  color: Colors.grey.shade800,
                  onPressed: () {
                    _globalKey.currentState.openDrawer();
                  },
                ),
                // CircleAvatar(
                //   radius: 40.0,
                //   backgroundImage: AssetImage("assets/images/man.jpeg"),
                // ),
                IconButton(
                  icon: Icon(Icons.person_rounded),
                  iconSize: 50.0,
                  onPressed: () {},
                ),
              ],
            ),
            // userName(),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Text(
                "Olá, ${widget.text}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.grey,
                ),
              ),
            ),
            summaryInformations(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailedInformationButton(
                  h,
                  w,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10.0,
                  ),
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
                                "Agendamentos",
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
                              builder: (BuildContext contex) =>
                                  MainSchedulling(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                medicineButton(
                  h,
                  w,
                ),
                vaccineButton(
                  h,
                  w,
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

// Widget buildProfileImage() {
//   return CircleAvatar(
//     radius: 50.0,
//     backgroundImage: AssetImage("assets/woman.png"),
//   );
// }

// Widget userName() {
//   return Padding(
//     padding: EdgeInsets.only(
//       bottom: 10.0,
//     ),
//     child: Text(
//       name,
//       "Olá, ",
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 25.0,
//         color: Colors.grey,
//       ),
//     ),
//   );
// }

Widget summaryInformations() {
  return Padding(
    padding: EdgeInsets.only(
      bottom: 25.0,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(3, 4),
            color: Colors.grey.shade300,
          ),
        ],
      ),

      width: setWidth(350.0),
      height: setHeight(70.0),
      // child: CarouselSlider(
      //   options: Options
      // ),
    ),
  );
}

Widget vaccineButton(h, w) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: 15.0,
    ),
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: AppConsts.pinkBasic,
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
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  child: Image.asset("assets/icons/vaccine.png"),
                  height: 48,
                  width: 48,
                ),
              ),
              FittedBox(
                child: Text(
                  "Vacinas",
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
            return print("Vacinas");
          },
        ),
      ),
    ),
  );
}

Widget medicineButton(h, w) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: 15.0,
    ),
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(2, 4),
            color: Colors.grey.shade300,
          ),
        ],
        color: AppConsts.purpleBasic,
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
                  child: Image.asset("assets/icons/medicine.png"),
                  height: 48,
                  width: 48,
                ),
              ),
              FittedBox(
                child: Text(
                  "Medicamentos",
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
            return print("Medicamentos");
          },
        ),
      ),
    ),
  );
}

// Widget schedulingButton(h, w) {
//   return Padding(
//     padding: EdgeInsets.only(
//       bottom: 10.0,
//     ),
//     child: Container(
//       height: h,
//       width: w,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             spreadRadius: 3,
//             blurRadius: 5,
//             offset: Offset(2, 4),
//             color: Colors.grey.shade300,
//           ),
//         ],
//         color: AppConsts.blueBasic,
//         borderRadius: BorderRadius.all(
//           Radius.circular(10),
//         ),
//       ),
//       child: SizedBox.expand(
//         child: FlatButton(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(bottom: 10),
//                 child: SizedBox(
//                   child: Image.asset("assets/icons/calendar.png"),
//                   height: 48,
//                   width: 48,
//                 ),
//               ),
//               FittedBox(
//                 child: Text(
//                   "Agendamentos",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 17,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               )
//             ],
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (BuildContext contex) => MainPage(),
//               ),
//             );
//           },
//         ),
//       ),
//     ),
//   );
// }

Widget detailedInformationButton(h, w) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: 10.0,
    ),
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(2, 4),
            color: Colors.grey.shade300,
          ),
        ],
        color: AppConsts.orangeBasic,
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
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: SizedBox(
                  child: Image.asset("assets/icons/paw.png"),
                  height: 48,
                  width: 48,
                ),
              ),
              Flexible(
                child: Text(
                  "Informações detalhadas",
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
            return print("Informações detalhadas");
          },
        ),
      ),
    ),
  );
}
