import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/Data%20Screen/Details.dart';
import 'package:untitled3/Data%20Screen/dataApi.dart';
import 'package:untitled3/Model/SucessModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Random random = new Random(10);
  List<SucessModel> _dataSucess = [];
  List<Albums> _dataAlbum = [];
  List<Albums> _Sucessdata1 = [];
  SucessModel _sucess;
  bool _isLoading = false;

  var titles;
  var songs;
  var descrp;
  var images;

  void abc;

  @override
  void initState() {
    _getConn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
        ),
        body: (_isLoading)
            ? Container(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _Sucessdata1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 80,
                          child: GestureDetector(
                            onTap: () {
                              titles = _Sucessdata1.elementAt(index)
                                  .title
                                  .toString();
                              songs = _Sucessdata1.elementAt(index)
                                  .songs
                                  .toString();
                              descrp = _Sucessdata1.elementAt(index)
                                  .description
                                  .toString();

                              images=_Sucessdata1.elementAt(index).image;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DisplayBlog(
                                          title: titles,
                                          song: songs,
                                          description: descrp,image:images)));
                            },
                            child: Card(
                              color: Colors.yellow[200],
                              child: Column(children: [
                                ListTile(
                                  title:
                                      Text(_Sucessdata1.elementAt(index).title,style: TextStyle(fontWeight: FontWeight.w500),),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        _Sucessdata1.elementAt(index).image),
                                  ),
                                )
                              ]),
                            ),
                          ));
                    }))
            : Container(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ));
  }

  _getConn() async {
    AllConnectionsAPI _api = new AllConnectionsAPI();
    _sucess = await _api.getAllConnectionsData();
    _dataAlbum.addAll(_sucess.albums);
    _Sucessdata1.addAll(_dataAlbum);
    if (this.mounted) {
      setState(() {
        _isLoading = true;
      });
      print("Data Was:" + _Sucessdata1.elementAt(0).image);
    }
  }
}
