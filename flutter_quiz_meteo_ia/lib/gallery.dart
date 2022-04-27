import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gallery-data-page.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword="";
  TextEditingController editingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,title: Text(keyword),),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              style: TextStyle(fontSize: 22),
              onChanged: (value){
                setState(() {
                  this.keyword=value;
                });
              },
              controller: editingController,
              decoration: InputDecoration(hintText: 'Tape a place'),
              onSubmitted: (value){
                this.keyword=value;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDataPage(this.keyword)));
                editingController.text="";
                },
            ),padding: EdgeInsets.all(10),
          ),Container(width:double.infinity,child: RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDataPage(keyword)));
              editingController.text="";
              },
            color: Colors.deepOrange,
            padding: EdgeInsets.all(10),
            child: Text("Get Images", style: TextStyle(fontSize: 22, color: Colors.white),),
          )),
        ],
      )
    );
  }
}






