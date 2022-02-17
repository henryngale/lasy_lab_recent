import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class TeacherChat extends StatefulWidget {
  const TeacherChat({
    Key? key,
    required this.name,
    required this.appbarcolor,
    required this.subject,
    required this.image,
  }) : super(key: key);
  final String name;
  final Color appbarcolor;
  final String subject;
  final String image;
  @override
  _TeacherChatState createState() => _TeacherChatState();
}

class _TeacherChatState extends State<TeacherChat> {
  var message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(175.0),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 0,
            ),
            height: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              color: widget.appbarcolor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                //profil image
                Container(
                  width: 110,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 110,
                      alignment: Alignment.center,
                      child: Text(
                        widget.subject,
                        style: TextStyle(
                          color: Colors.lightBlue.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.lightBlue.shade100,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Text(
                          "en Ligne",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 96,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 70,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          height: screen.height,
          width: screen.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Hier",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: screen.width * 0.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Wrap(
                            children: [
                              Text(
                                  "Bonjour monsieur, j'aimerais s'avoir\n comment on ressoudre une equation de second degree "),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: screen.width * 0.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Wrap(
                            children: [
                              Text("as tu lu ton cours ?"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 100,
                  width: screen.width * 0.9,
                  //color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: message,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.image),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: 40,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Message",
                            fillColor: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 3,
                          ),
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("Tapped micro");
                          },
                          icon: Icon(
                            Icons.mic,
                            color: Colors.grey,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
