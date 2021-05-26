import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayBlog extends StatefulWidget {
  var title;

  var song;

  var description;

  var image;

  DisplayBlog({
    Key key,this.title, this.song, this.description, this.image,

  }) : super(key: key);
  @override
  _DisplayBlogState createState() => _DisplayBlogState();
}

class _DisplayBlogState extends State<DisplayBlog> {
  bool isLoaded = false;
  String loginType = "";
  String token = "";

  bool isLoadedComment = false;
  final TextEditingController _commentCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  get ScaffoldMessenger => null;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                            expandedHeight:
                                MediaQuery.of(context).size.height * 0.3,
                            floating: true,
                            pinned: true,
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                elevation: 2.0,
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                shape: CircleBorder(),
                              ),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 2,
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: false,
                              stretchModes: <StretchMode>[
                                StretchMode.zoomBackground,
                              ],
                              background: Center(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                    widget.image),
                                  ),
                                ),
                              )

                            )),
                      ];
                    },
                    body: Container(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text("Title :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(
                                      widget.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Text("Description :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        widget.description,
                                        style: TextStyle(
                                            fontSize: 10),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],),
                                ),  SizedBox(
                                  height: 10,
                                ),
                                Text("Title :"+widget.song,style: TextStyle(fontWeight: FontWeight.bold),),
                                // ListView.builder(
                                //     padding: const EdgeInsets.all(8),
                                //     itemCount: 9,
                                //     itemBuilder: (BuildContext context, int index) {
                                //       return Container(
                                //           height: MediaQuery.of(context).size.height,child:Column(children:[
                                //             Text(widget.song[index].toString())
                                //           ]));
                                //     })
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
