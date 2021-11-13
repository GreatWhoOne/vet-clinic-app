import 'package:flutter/material.dart';
import 'package:vet_app/utils/common.dart';
import 'package:vet_app/utils/consts.dart';
import 'package:flutter/cupertino.dart';

import 'loginPage.dart';

class CreatAccount extends StatefulWidget {
  CreatAccount({Key key}) : super(key: key);

  @override
  _CreatAccountState createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatAccount> {
  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastrar",
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
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 80,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              TextFormField(
                // controller: controlUsuario,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_rounded),
                  labelText: "Nome completo",
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
              TextFormField(
                // controller: controlSenha,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                // controller: controlSenha,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  labelText: "Endereço",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                // controller: controlSenha,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: setHeight(80.0),
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
                          "Cadastrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    onPressed: () {},
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
                  child: Text("Já possui uma conta? Fazer login",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext contex) => LoginPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
