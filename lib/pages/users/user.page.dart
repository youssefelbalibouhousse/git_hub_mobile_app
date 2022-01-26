import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UsersPage extends StatefulWidget{

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  // objet qui controle la zone de texte (effacer ou ajouter et stocker du texte saisi dans query)
  TextEditingController querytextEditingController = new TextEditingController();
   bool notVisible = false;
   String query = "";
   dynamic data; // objet dynamic ou on peut stocker les reponses htpp ou json


//methode qui permet de faire la requete http vers la partie backend et recuperer les données
  void _search(String query) {

    var url = Uri.parse("https://api.github.com/search/users?q=${query}&per-page=20&page=0;");
    print(url);
    http.get(url)
        .then((response){
          setState(() { // pour rafraichir grace stateful

            // ici le fichier dynamic data se voit decoder son fichier json recuperer et stocker dans un ficher dart
            this.data=json.decode(response.body);

          });
          print(response.body); // du texte a stocker dans un objet de type dart


    })


        .catchError((err){
          print(err);

    });

  }


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
                                icon : Icon(
                                    notVisible==true? Icons.visibility : Icons.visibility_off
                                ),
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
                    _search(query);// commencer par un underscore permet de rendre l'attribut privée

                  });
                }

                )

              ],
            ),
            ListView.builder( //fais une boucle sur le nombre d'element et appeler la fonction itembuilder

                itemCount: (data==null)?0:data['items'].lenght, // comme data est dynamic alors on peut recuperer directement les données
                itemBuilder: (context,index){
                  return  ListTile(
                    title: Text("${data['items'][index]['login']}"), //ici on boucle sur items et sur son index
                  );
                }
            )

          ],
        )
      ),
    );
  }


}