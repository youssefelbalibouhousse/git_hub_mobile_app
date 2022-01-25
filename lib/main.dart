import 'package:flutter/material.dart';
import 'package:git_hub_mobile_app/pages/home/home.page.dart';
import 'package:git_hub_mobile_app/pages/users/user.page.dart';


void main() {
  runApp(MyApp()); //Instanciation de l'application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      routes: {
        "/": (context)=>HomePage(),//appel du dart homepage
        "/users":(context)=>UsersPage()//appel du dart user.page
      },
      initialRoute: "/users",

    );
  }
}




