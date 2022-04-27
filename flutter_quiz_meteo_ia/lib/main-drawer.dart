import 'package:flutter/material.dart';
import './quiz.dart';
import './meteo.dart';
import './gallery.dart';
import './camera.dart';

// Pour Menu
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepOrange, Colors.white])
            ),
            child: Center(
              //Pour image
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/logo.png'),
              ),
            ),
          ),
          ListTile(
            title: Text('Quiz', style: TextStyle(fontSize: 20)),
            onTap: (){
              //Pour fermer menu quand on clique
              Navigator.of(context).pop();
              //Pour aller vers autre page
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
            },
          ),
          Divider(color: Colors.deepOrange,),
          ListTile(
            title: Text('Méteo', style: TextStyle(fontSize: 20)),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Meteo()));
            },
          ),
          Divider(color: Colors.deepOrange,),
          ListTile(
            title: Text('Gallery', style: TextStyle(fontSize: 20)),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Gallery()));
            },
          ),
          Divider(color: Colors.deepOrange,),
          ListTile(
            title: Text('Caméra', style: TextStyle(fontSize: 20)),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
            },
          ),
        ],
      ),
    );
  }
}
