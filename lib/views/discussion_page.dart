import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lasylab_mobile_app/forms/message_widget.dart';
import 'package:lasylab_mobile_app/models/message.dart';
import 'package:lasylab_mobile_app/models/user.dart';
import 'package:lasylab_mobile_app/services/auth_service.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({Key? key, this.user}) : super(key: key);
  final Usermodel? user;
  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage>
    with TickerProviderStateMixin {
  AnimationController? animationcontroller;
  final _controller = TextEditingController();
  String message = '';
  String imageUrl = '';
  void sendMessage() async {
    FocusScope.of(context).unfocus();
    var msg = Message(
      content: _controller.text.isEmpty ? imageUrl : _controller.text,
      createdAt: DateTime.now(),
      receiverUid: widget.user!.id,
      type: _controller.text.isEmpty ? "image" : "texte",
      senderUid: AuthService().user != null
          ? AuthService().user!.uid
          : DBService().getLocalUser()!.id,
    );

    await DBService().sendMessage(msg);
    Logger().d("message envoyé");
    _controller.clear();
  }

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
    Logger().d(AuthService().user);
  }

  @override
  void dispose() {
    animationcontroller!.dispose();
    super.dispose();
  }

  File? imageFile;
  Future getImage() async {
    _controller.clear();
    ImagePicker _picker = ImagePicker();
    await _picker.pickImage(source: ImageSource.gallery).then((xFile) async {
      if (xFile != null) {
        setState(() {
          imageFile = File(xFile.path);
        });
        await uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    Logger().d("Begin send image");

    var ref =
        FirebaseStorage.instance.ref().child("images").child("$fileName.jpg");
    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
      //supprimer le fichier
    });

    imageUrl = await uploadTask.ref.getDownloadURL();

    sendMessage();
    Logger().d("End send image");
    Logger().d("Image URL " + imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: SafeArea(
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              elevation: 0,
              // backgroundColor: Colors.orange,
              leading: BackButton(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor(
                            "#FF760D",
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child:
                              Image.asset("assets/images/Female_Memojis.png"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.user!.nom! + " " + widget.user!.prenom!,
                          maxLines: 2,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "MATHS",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: HexColor("#1CB1FB"),
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    top: 8.0,
                  ),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircleAvatar(
                      backgroundColor: HexColor("#235390"),
                      child: Image.asset(
                        "assets/images/phone.png",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    top: 8.0,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.70),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "MESSAGE",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            //liste des messages
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: DBService().getMessage(widget.user!.id!),
                builder: (context, s1) {
                  if (s1.hasData) {
                    return StreamBuilder<List<Message>>(
                      stream: DBService().getMessage(widget.user!.id!, false),
                      builder: (context, s2) {
                        if (s2.hasData) {
                          //on a recupéré les messages des deux parties
                          var messages = [...s1.data!, ...s2.data!];
                          messages.sort(
                              (i, j) => i.createdAt!.compareTo(j.createdAt!));
                          messages = messages.reversed.toList();
                          return messages.length == 0
                              ? Center(
                                  child: Text(
                                    "Aucun message",
                                    style: GoogleFonts.nunito(
                                      color: HexColor("#235390"),
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: messages.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  reverse: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    final msg = messages[index];
                                    return MessageWidget(message: msg);
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
              ),
            ),
            /*Expanded(
              child: messages.isEmpty
                  ? buildText('Say Something..')
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      //reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) => MessageWidget(
                        name: messages[index].name,
                        message: messages[index],
                        isMe: messages[index].idUser == 10,
                      ),
                    ),
            ),*/
            //body end
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //height: 50,
                      child: TextField(
                        controller: _controller,
                        autocorrect: true,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: HexColor("#235390"),
                              )),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text",
                          fillColor: Colors.white70,
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              await getImage();
                            },
                            child: Icon(
                              Icons.image,
                              color: Colors.black, // HexColor("#AFAFAF"),
                            ),
                          ),
                        ),
                        onChanged: (value) => setState(() {
                          message = value;
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: message.trim().isEmpty
                          ? () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return Container();
                              }));
                            }
                          : sendMessage,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor("#235390"),
                            border: Border.all(
                              color: message.trim().isEmpty
                                  ? HexColor("#AFAFAF")
                                  : HexColor("#235390"),
                            )),
                        child: Icon(
                          message.trim().isEmpty ? Icons.mic_none : Icons.send,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          "Dites quelque chose ...",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: HexColor("#AFAFAF"),
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
