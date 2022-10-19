import 'dart:async';
import 'package:Cryptonoma/widgets/darkcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          SizedBox(height: 200,),
          // receive data from stream using streambuilder
          StreamBuilder(
              //initial data is optional
              initialData: 0,
              //set streamcontroller stream
              stream: streamController.stream,
              //snap use to receive data
              builder: (context,snap){
              return Text( "Age ${snap.data}",
              style:
              GoogleFonts.comfortaa(
                fontSize: 15,
                color: DarkColor.white,
              ),);

          }),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              //pass data to stream
              streamController.sink.add(++count);
            },
            child: Container(
                color: Colors.white,
                width: 200,
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("PLUS",
                style: GoogleFonts.comfortaa(
                  fontSize: 15,
                  color: DarkColor.black,
                ),),
              ),
            )),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              //pass data to stream
              streamController.sink.add(--count);
            },
            child: Container(
                color: Colors.white,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("MINUS",
                      style: GoogleFonts.comfortaa(
                        fontSize: 15,
                        color: DarkColor.black,
                      ),),
                  ),
                )),
          )

        ],
      ),
    );
  }
}
