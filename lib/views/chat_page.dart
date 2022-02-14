import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/discussion_tile.dart';
import 'package:lasylab_mobile_app/components/teacher_tile.dart';
import 'package:lasylab_mobile_app/forms/message_widget.dart';
import 'package:lasylab_mobile_app/models/message.dart';
import 'package:lasylab_mobile_app/models/user.dart';
import 'package:lasylab_mobile_app/services/auth_service.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:lasylab_mobile_app/views/discussion_page.dart';
import 'package:logger/logger.dart';
import 'package:transparent_image/transparent_image.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  AnimationController? animationcontroller;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarColor: HexColor("#235390"),
        statusBarIconBrightness: Brightness.light, // status bar color
      ),
    );
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  Usermodel? myuser;
  Usermodel? currentuser = DBService().getLocalUser();
  @override
  void dispose() {
    animationcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          //backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
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
                title: Text(
                  "DISCUSSION",
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      top: 8.0,
                    ),
                    child: SizedBox(
                      height: 26,
                      width: 26,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          "assets/images/Search.png",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      top: 5.0,
                      right: 20.0,
                      bottom: 5.0,
                    ),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.of(context).pushNamed("/profil");
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset("assets/images/avatar.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                bottom: TabBar(
                  padding: EdgeInsets.all(15),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white.withOpacity(0.77),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Text(
                      "Discussions",
                      maxLines: 1,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Privee",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Groupe",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Fichiers",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: ListView(
            children: [
              Container(
                height: screen.height * 0.9,
                width: screen.width,
                child: TabBarView(
                  children: [
                    //teachet chat ui (only UI)
                    TeacherTile(),
                    //partie dicussion avec les enseignants

                    // StreamBuilder<List<Usermodel>>(
                    //     stream: DBService().getDiscussionUser(),
                    //     builder: (_, s) {
                    //       final users = s.data;
                    //       if (s.hasData) {
                    //         //get the last discussion
                    //         return StreamBuilder<List<Message>>(
                    //           stream: DBService().getLastReceivedMessage(),
                    //           builder: (context, s1) {
                    //             if (s1.hasData) {
                    //               return StreamBuilder<List<Message>>(
                    //                 stream: DBService().getLastSentMessage(),
                    //                 builder: (context, s2) {
                    //                   if (s2.hasData) {
                    //                     //on a recupéré les messages des deux parties
                    //                     var messages = [...s1.data!, ...s2.data!];
                    //                     Logger().d(messages);
                    //                     messages.sort((i, j) =>
                    //                         i.createdAt!.compareTo(j.createdAt!));
                    //                     messages = messages.reversed.toList();
                    //                     Map<String, dynamic> conversations = {};
                    //                     var id = (AuthService().user != null
                    //                         ? AuthService().user!.uid
                    //                         : currentuser!.id);
                    //                     for (int j = 0; j < messages.length; j++) {
                    //                       var message = messages[j];
                    //                       var correspondentid =
                    //                           message.senderUid != id
                    //                               ? message.senderUid
                    //                               : message.receiverUid;
                    //                       if (!conversations
                    //                           .containsKey(correspondentid)) {
                    //                         conversations[correspondentid!] = message;
                    //                       }
                    //                     }
                    //                     var usersIWroteTo = [];
                    //                     var conversationList =
                    //                         conversations.keys.toList();
                    //                     for (var i = 0;
                    //                         i < conversationList.length;
                    //                         i++) {
                    //                       var uss = users!
                    //                           .where((element) =>
                    //                               conversationList[i] == element.id)
                    //                           .toList();
                    //                       if (uss.length != 0) {
                    //                         usersIWroteTo.add(uss[0]);
                    //                       }
                    //                     }
                    //                     var usersIDidntwriteTo = users!
                    //                         .where((element) => !conversations.keys
                    //                             .contains(element.id))
                    //                         .toList();
                    //                     var usersClassified = [
                    //                       ...usersIWroteTo,
                    //                       ...usersIDidntwriteTo
                    //                     ];
                    //                     return users.length == 0
                    //                         ? Center(
                    //                             child: Text(
                    //                               "Aucune discussion",
                    //                               style: GoogleFonts.nunito(
                    //                                 color: HexColor("#235390"),
                    //                                 textStyle: TextStyle(
                    //                                   fontSize: 20,
                    //                                   fontWeight: FontWeight.bold,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           )
                    //                         : ListView.builder(
                    //                             shrinkWrap: true,
                    //                             scrollDirection: Axis.vertical,
                    //                             physics: BouncingScrollPhysics(),
                    //                             itemCount: usersClassified.length,
                    //                             itemBuilder: (context, index) {
                    //                               final user = usersClassified[index];
                    //                               bool hasChatted = conversations
                    //                                   .containsKey(user.id);
                    //                               var lastmessage = hasChatted
                    //                                   ? conversations[user.id]
                    //                                   : null;
                    //                               var date = hasChatted
                    //                                   ? lastmessage.createdAt!
                    //                                       .toLocal()
                    //                                   : null;
                    //                               return GestureDetector(
                    //                                 onTap: () {
                    //                                   Navigator.of(context).push(
                    //                                       MaterialPageRoute(
                    //                                           builder: (context) =>
                    //                                               DiscussionPage(
                    //                                                 user: user,
                    //                                               )));
                    //                                 },
                    //                                 child: DiscussionTile(
                    //                                   teacherName: user.nom! +
                    //                                       " " +
                    //                                       user.prenom!,
                    //                                   backgroundColor: "#FF760D",
                    //                                   illustration:
                    //                                       "assets/images/Female_Memojis.png",
                    //                                   teacherCourse: "MATHS",
                    //                                   lastMessage: hasChatted
                    //                                       ? (lastmessage.type ==
                    //                                               "texte"
                    //                                           ? lastmessage.content!
                    //                                           : "Fichier ...")
                    //                                       : "Aucun Message",
                    //                                   sendHour: hasChatted
                    //                                       ? "${date.hour}h ${date.minute}"
                    //                                       : "",
                    //                                 ),
                    //                               );
                    //                             });
                    //                   } else {
                    //                     return Center(
                    //                       child: SpinKitWave(
                    //                         color: HexColor("#235390"),
                    //                         size: 25,
                    //                         controller: animationcontroller,
                    //                       ),
                    //                     );
                    //                   }
                    //                 },
                    //               );
                    //             } else {
                    //               return Center(
                    //                 child: SpinKitWave(
                    //                   color: HexColor("#235390"),
                    //                   size: 25,
                    //                   controller: animationcontroller,
                    //                 ),
                    //               );
                    //             }
                    //           },
                    //         );
                    //       } else {
                    //         return Center(
                    //           child: SpinKitWave(
                    //             color: HexColor("#235390"),
                    //             size: 25,
                    //             controller: animationcontroller,
                    //           ),
                    //         );
                    //       }
                    //     }),

                    //partie privée
                    StreamBuilder<List<Usermodel>>(
                        stream: DBService().getDiscussionUser(type: "user"),
                        builder: (_, s) {
                          final users = s.data;
                          if (s.hasData) {
                            //get the last discussion
                            return StreamBuilder<List<Message>>(
                              stream: DBService().getLastReceivedMessage(),
                              builder: (context, s1) {
                                if (s1.hasData) {
                                  return StreamBuilder<List<Message>>(
                                    stream: DBService().getLastSentMessage(),
                                    builder: (context, s2) {
                                      if (s2.hasData) {
                                        //on a recupéré les messages des deux parties
                                        var messages = [
                                          ...s1.data!,
                                          ...s2.data!
                                        ];
                                        Logger().d(messages);
                                        messages.sort((i, j) => i.createdAt!
                                            .compareTo(j.createdAt!));
                                        messages = messages.reversed.toList();
                                        Map<String, dynamic> conversations = {};
                                        var id = (AuthService().user != null
                                            ? AuthService().user!.uid
                                            : currentuser!.id);
                                        for (int j = 0;
                                            j < messages.length;
                                            j++) {
                                          var message = messages[j];
                                          var correspondentid =
                                              message.senderUid != id
                                                  ? message.senderUid
                                                  : message.receiverUid;
                                          if (!conversations
                                              .containsKey(correspondentid)) {
                                            conversations[correspondentid!] =
                                                message;
                                          }
                                        }

                                        var usersIWroteTo = [];
                                        var conversationList =
                                            conversations.keys.toList();
                                        for (var i = 0;
                                            i < conversationList.length;
                                            i++) {
                                          var uss = users!
                                              .where((element) =>
                                                  conversationList[i] ==
                                                  element.id)
                                              .toList();
                                          if (uss.length != 0) {
                                            usersIWroteTo.add(uss[0]);
                                          }
                                        }
                                        var usersIDidntwriteTo = users!
                                            .where((element) => !conversations
                                                .keys
                                                .contains(element.id))
                                            .toList();

                                        var usersClassified = [
                                          ...usersIWroteTo,
                                          ...usersIDidntwriteTo
                                        ];

                                        return users.length == 0
                                            ? Center(
                                                child: Text(
                                                  "Aucune discussion",
                                                  style: GoogleFonts.nunito(
                                                    color: HexColor("#235390"),
                                                    textStyle: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemCount:
                                                    usersClassified.length,
                                                itemBuilder: (context, index) {
                                                  final user =
                                                      usersClassified[index];
                                                  bool hasChatted =
                                                      conversations
                                                          .containsKey(user.id);
                                                  var lastmessage = hasChatted
                                                      ? conversations[user.id]
                                                      : null;
                                                  var date = hasChatted
                                                      ? lastmessage.createdAt!
                                                          .toLocal()
                                                      : null;
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DiscussionPage(
                                                                    user: user,
                                                                  )));
                                                    },
                                                    child: DiscussionTile(
                                                      teacherName: user.nom! +
                                                          " " +
                                                          user.prenom!,
                                                      backgroundColor:
                                                          "#FF760D",
                                                      illustration:
                                                          "assets/images/Female_Memojis.png",
                                                      teacherCourse: "MATHS",
                                                      lastMessage: hasChatted
                                                          ? (lastmessage.type ==
                                                                  "texte"
                                                              ? lastmessage
                                                                  .content!
                                                              : "Fichier ...")
                                                          : "Aucun Message",
                                                      sendHour: hasChatted
                                                          ? "${date.hour}h ${date.minute}"
                                                          : "",
                                                    ),
                                                  );
                                                });
                                      } else {
                                        return Center(
                                          child: SpinKitWave(
                                            color: HexColor("#235390"),
                                            size: 25,
                                            controller: animationcontroller,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: SpinKitWave(
                                      color: HexColor("#235390"),
                                      size: 25,
                                      controller: animationcontroller,
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            return Center(
                              child: SpinKitWave(
                                color: HexColor("#235390"),
                                size: 25,
                                controller: animationcontroller,
                              ),
                            );
                          }
                        }),
                    Container(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: StreamBuilder<List<Message>>(
                        stream: DBService().getMySentFiles(),
                        builder: (context, s1) {
                          if (s1.hasData) {
                            return StreamBuilder<List<Message>>(
                              stream: DBService().getMyReceivedFiles(),
                              builder: (context, s2) {
                                if (s2.hasData) {
                                  //on a recupéré les messages emis et recus
                                  var messages = [...s1.data!, ...s2.data!];
                                  messages.sort((i, j) =>
                                      i.createdAt!.compareTo(j.createdAt!));
                                  messages = messages.reversed.toList();
                                  List<Message> files = messages
                                      .where(
                                          (element) => element.type != "texte")
                                      .toList();
                                  return files.length == 0
                                      ? Center(
                                          child: Text(
                                            "Aucun fichier",
                                            style: GoogleFonts.nunito(
                                              color: HexColor("#235390"),
                                              textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      : StaggeredGridView.countBuilder(
                                          staggeredTileBuilder: (index) {
                                            return StaggeredTile.count(
                                              1,
                                              index.isEven ? 1.2 : 1.8,
                                            );
                                          },
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 12,
                                          mainAxisSpacing: 14,
                                          itemCount: files.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (_) {
                                                  return DetailImage(
                                                    image:
                                                        files[index].content!,
                                                  );
                                                }));
                                              },
                                              child: Hero(
                                                tag: "imageHero",
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15))),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    child: FadeInImage
                                                        .memoryNetwork(
                                                      placeholder:
                                                          kTransparentImage,
                                                      image:
                                                          files[index].content!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                } else {
                                  return Center(
                                    child: SpinKitWave(
                                      color: HexColor("#235390"),
                                      size: 25,
                                      controller: animationcontroller,
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            return Center(
                              child: SpinKitWave(
                                color: HexColor("#235390"),
                                size: 25,
                                controller: animationcontroller,
                              ),
                            );
                          }
                        },
                      ),
                    ),

                    /*ListView(
                      shrinkWrap: true,
                      children: List.generate(10, (index) => ProfileShimmer()),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/discussions");
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  "assets/images/Edit.png",
                ),
              ),
            ),
            backgroundColor: HexColor("#235390"),
          ),
        ),
      ),
    );
  }
}
