import 'package:flutter/material.dart';
import './main-drawer.dart';

void main() {
  runApp(MyApp());
}

//  envelopper notre widget avec MaterialApp()
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Home() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}


class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('My App'), backgroundColor: Colors.deepOrange,),
      body: Center(child:
        Text('Hello', style: TextStyle(fontSize: 22,  color: Colors.deepOrange),)),
    );
  }
}
