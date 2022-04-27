import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDataPage extends StatefulWidget {
  String keyword;

  GalleryDataPage(this.keyword);
  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  int currentPage = 1;
  int size = 10;
  int totalPages;
  ScrollController _scrollController=new ScrollController();
  List<dynamic> hits=[];
  var galleryData;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(currentPage<totalPages){
          ++currentPage;
          this.getData();
        }
      }
    });
  }

  getData() {
    String url =
        "https://pixabay.com/api/?key3D5832566-81dc7429a93c86e3b707d04298q=${widget.keyword}&page=${currentPage}&per_page=${size}";
    http.get(url).then((resp) {
      //envoyer requete
      setState(() {
        galleryData = json.decode(resp.body);
        hits.addAll(galleryData['hits']);
        if(galleryData['totalHits']%size==0)
          totalPages=galleryData['totalHits']~/size;
        else
          totalPages=1+(galleryData['totalHits']/size).floor();
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.keyword}, Page ${currentPage}/${totalPages}"),
          backgroundColor: Colors.deepOrange,
        ),
        body: (galleryData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: (galleryData == null ? 0 : hits.length),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width:double.infinity,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Card(
                          child: Padding(padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              hits[index]['tags'],
                              style: TextStyle(fontSize: 22, color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          ),
                          color: Colors.deepOrange,
                        ),
                        ),
                      Container(
                        child: Card(
                          child: Image.network(hits[index]['webFormatURL']
                            ,fit: BoxFit.fitWidth,),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      )
                    ],
                  );
                })));
  }
}
