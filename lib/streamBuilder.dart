import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getx_demo_app/repository/fireStore.dart';

import 'modelClass/dataReceive.dart';

class FlutterStreamBuilder extends StatelessWidget {

  double _height=0.0;
  double _width=0.0;

  final imgStream = StreamController<List<Book>>();
  List<Book> valueData=[];
  int Counter = -1;


  @override
  void dispose() {
    imgStream.close();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: imgStream.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                         backgroundColor:Colors.red,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {}

                  return Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount:valueData.length ,
                      itemBuilder:(context,index){
                        return Row(
                          children: [
                            Text(snapshot.data[index].title),
                            Text(snapshot.data[index].description)
                          ],
                        );
                      } ,
                    ),
                  );
                }),

            ElevatedButton(
              style: new ButtonStyle(

              ),
              onPressed: () async{
                // valueData=  await _fire_Store.getData();
                // if (valueData.isNotEmpty) {
                //   imgStream.sink.add(valueData);
                // } else {
                //   imgStream.close();
                // }

              },

              child: Text("  view  ".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
            ),
          ],
        ),
      ),
    );
  }
}