import 'dart:async';
import 'package:flutter/material.dart';

class streams extends StatefulWidget {
   const streams({Key key}) : super(key: key);

  @override
  State<streams> createState() => _streamsState();
}

class _streamsState extends State<streams> {

  final StreamController<int> streamController = new StreamController<int>();
  int count = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //close the stram controller
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // receive data from stream using streambuilder
          StreamBuilder(
              //initial data is optional
              initialData: 0,
              //set streamcontroller stream
              stream: streamController.stream,
              //snap use to receive data
              builder: (context,snap){
              return Text( "Age ${snap.data}");

          }),
          GestureDetector(
            onTap: (){
              //pass data to stream
              streamController.sink.add(++count);
            },
            child: Text("up"),
          )

        ],
      ),
    );
  }
}
