import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vet_app/pages/main.page.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vet_app/pages/login/createAccount.dart';

class LoginPage extends StatefulWidget {
  List idUser;

  String formattedIdUser;
  String formattedIdUserName;
  LoginPage({Key key, @required this.formattedIdUser, this.idUser})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controlUsuario = new TextEditingController();
  TextEditingController controlSenha = new TextEditingController();

  Future getUsers() async {
    var url = "http://192.168.0.103/flutter-app/obterUsuario.php";
    final response = await http.post(
      url,
      body: {
        "email": controlUsuario.text,
        "senha": controlSenha.text,
      },
    );

    if (response.body == "CORRETO") {
      Fluttertoast.showToast(
        msg: "Logado com sucesso",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(
              idUser: widget.formattedIdUser.toString(),
              userName: widget.formattedIdUserName),
        ),
      );
    } else if (response.body == "ERROR") {
      Fluttertoast.showToast(
        msg: "Email ou senha incorretos",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future getUserId() async {
    var url = "http://192.168.0.103/flutter-app/obterIdProprietario.php";
    final response = await http.post(
      url,
      body: {
        "email": controlUsuario.text,
      },
    );

    var idUser = json.decode(response.body);

    widget.formattedIdUser = idUser[0]["ID_PROPRIETARIO"];
  }

  Future getUserName() async {
    var url = "http://192.168.0.103/flutter-app/userName.php";
    final response = await http.post(
      url,
      body: {
        "email": controlUsuario.text,
      },
    );

    var idUser = json.decode(response.body);

    widget.formattedIdUserName = idUser[0]["NOME"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: controlUsuario,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controlSenha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              // color: Colors.black38,
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Colors.black54,
                    Colors.black12,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
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
                    getUsers();
                    getUserId();
                    getUserName();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text("Não possui uma conta? Registrar",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext contex) => CreatAccount(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
