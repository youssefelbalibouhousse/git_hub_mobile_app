import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      drawer: Drawer(),//reserver pour le menu
      body: Center( // permet de centrer le texte child
        child: Text('Home'),
      ),
    );
  }

}