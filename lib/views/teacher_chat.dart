import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class TeacherChat extends StatefulWidget {
  const TeacherChat({
    Key? key,
    required this.name,
    required this.appbarcolor,
    required this.subject,
  }) : super(key: key);
  final String name;
  final Color appbarcolor;
  final String subject;
  @override
  _TeacherChatState createState() => _TeacherChatState();
}

class _TeacherChatState extends State<TeacherChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.0),
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 230, 187, 123),
                  Color.fromARGB(255, 248, 150, 3),
                ],
              ),
            ),
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Container(
                child: Column(
                  children: [
                    Text("${widget.name}"),
                    Text("${widget.subject}"),
                    Text("en Ligne"),
                  ],
                ),
              ),
              actions: [],
            ),
          ),
        ),
        body: Container(
          child: Text("data"),
        ),
      ),
    );
  }
}
