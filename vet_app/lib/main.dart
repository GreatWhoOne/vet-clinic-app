import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/pages/login.page.dart';
import 'package:vet_app/pages/main.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firestore.instance.collection('agendamentos').getDocuments().then(
          (value) => {
            value.documents.forEach((element) => {print(element.data)})
          },
        );

    return MaterialApp(
      title: 'VetApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(),
    );
  }
}
