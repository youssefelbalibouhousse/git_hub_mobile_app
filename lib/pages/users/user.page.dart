import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User'),),
      body: Center( // permet de centrer le texte child
        child: Text('User', style:Theme.of(context).textTheme.headline2,),
      ),
    );
  }

}