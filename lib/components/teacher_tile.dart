import 'package:flutter/material.dart';
import 'package:lasylab_mobile_app/models/teacher.dart';
import 'package:lasylab_mobile_app/views/teacher_chat.dart';
//import 'package:lasylab_mobile_app/models/teacher.dart';

class TeacherTile extends StatefulWidget {
  const TeacherTile({Key? key}) : super(key: key);

  @override
  _TeacherTileState createState() => _TeacherTileState();
}

class _TeacherTileState extends State<TeacherTile> {
  final List<Color> palete = [
    Colors.orange,
    Color.fromARGB(255, 153, 90, 211),
    Color.fromARGB(255, 10, 129, 129),
    Color.fromARGB(255, 10, 129, 129),
    Color.fromARGB(255, 9, 180, 32),
  ];
  final List<Teacher> teachers = [
    Teacher(
      "Prof VANESSA",
      "Maths",
      "assets/images/Female_Memojis.png",
      "Equation est un de second",
      true,
      color: Colors.orange,
    ),
    Teacher(
      "Prof JULIETTE",
      "Francais",
      "assets/images/Female_thug_Memojis.png",
      "C'est excellent",
      false,
      color: Color.fromARGB(255, 153, 90, 211),
    ),
    Teacher(
      "Prof MIREILLE",
      "Anglais",
      "assets/images/mother_Memojis.png",
      "Tell me what is your purpose",
      false,
      color: Color.fromARGB(255, 10, 129, 129),
    ),
    Teacher(
      "Prof AUDREY",
      "Science",
      "assets/images/girl_Memojis.png",
      "La photosythese est un\n phenomene",
      false,
      color: Color.fromARGB(255, 21, 176, 223),
    ),
    Teacher(
      "Prof ARNOLD",
      "Histoire",
      "assets/images/men_memoji.png",
      "Les consequence de la premier guerre",
      false,
      color: Color.fromARGB(255, 9, 180, 32),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      //height: screen.height,
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: screen.height * 0.7,
            child: ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherChat(
                                name: teachers[index].name,
                                appbarcolor: palete[index],
                                subject: teachers[index].subject)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: 139,
                            child: Row(
                              children: [
                                //face and subject section
                                Container(
                                  width: 110,
                                  height: 139,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: palete[index],
                                  ),
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        width: 120,
                                        child: Image.asset(
                                          teachers[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 30,
                                          width: 110,
                                          alignment: Alignment.center,
                                          child: Text(
                                            teachers[index].subject,
                                            style: TextStyle(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Colors.lightBlue.shade100,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //name and message section
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                teachers[index].name,
                                                style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "10:02",
                                                style: TextStyle(
                                                  color: teachers[index].recent
                                                      ? Colors.green
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                  teachers[index].text,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: teachers[index].recent,
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.green,
                                                  ),
                                                  child: Text(
                                                    "1",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                                //time and amount of message section section
                              ],
                            ),
                          ),
                          SizedBox(height: 0.5),
                          Divider(
                            height: 1,
                            thickness: 2,
                            color: Colors.grey.shade300,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
