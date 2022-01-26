import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget{

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  // objet qui controle la zone de texte (effacer ou ajouter et stocker du texte saisi dans query)
  TextEditingController querytextEditingController = new TextEditingController();
   bool notVisible = false;
   String query = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User=> ${query}'),),
      body: Center( // permet de centrer le texte child
        child: Column(
          children: [
            Row(
              children: [// debut de ligne
                Expanded( //pour occuper la largeur de toute la page
                  child: Container( //Ici l'emploi du container sur TextFormFields permet de manipuler un bloc et le centrer via padding
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: notVisible,
                        controller: querytextEditingController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton( //icone de masquage a droite du formulaire avec modif de l'etat via setState()
                              onPressed: (){
                                setState(() {
                                  notVisible =! notVisible;

                                });
                              },
                                icon : Icon(Icons.visibility),
                            ),
                            //icon: Icon(Icons.local_cafe), icone a gauche
                            contentPadding: EdgeInsets.all(10), //espace entre texte et bordure
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), //arrondie du formulaire
                                borderSide: BorderSide(
                                    width: 1 , color: Colors.indigo
                                )
                            )
                        ),
                      )
                  ),
                ),
                IconButton(
                icon: Icon(Icons.search , color: Colors.indigo),
                onPressed: (){
                  setState(() {
                    this.query = querytextEditingController.text;

                  });
                }

                )

              ],
            )

          ],
        )
      ),
    );
  }
}