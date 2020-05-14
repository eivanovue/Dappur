import 'package:dappur/data/data.dart';
import 'package:dappur/models/story_model.dart';
import 'package:dappur/models/chat_model.dart';
import 'package:dappur/views/services/auth.dart';
import 'file:///C:/Users/eivanovue/Desktop/dappur/lib/views/screens/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  List<StoryModel> stories = new List();
  List<ChatModel> chats = new List();

  @override
  void initState() {
        super.initState();

    stories = getStories();
    chats = getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff32343d),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Dappur",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500
                      ))
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff444446),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () async {
                        await _auth.signOut();
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xff444446),
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),

              /// stories
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 120,
                child: ListView.builder(
                  itemCount: stories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return StoryTile(
                        imgUrl: stories[index].imgUrl,
                        username: stories[index].username);
                  },
                ),
              ),

              /// chats
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: <Widget>[
                            Text("Recent",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            Spacer(),
                            Icon(
                              Icons.more_vert,
                              color: Colors.black45,
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: chats.length,
                          itemBuilder: (context, index) {
                            return ChatTile(
                                imgUrl: chats[index].imgUrl,
                                name: chats[index].name,
                                lastMessage: chats[index].lastMessage,
                                haveunreadmessages:
                                    chats[index].haveunreadmessages,
                                unreadmessages: chats[index].unreadmessages,
                                lastSeenTime: chats[index].lastSeenTime);
                          }),
                    ],
                  ))
            ],
          )),
        ));
  }
}

class StoryTile extends StatefulWidget {
  final String imgUrl;
  final String username;

  StoryTile({@required this.imgUrl, @required this.username});

  @override
  _StoryTileState createState() => _StoryTileState();
}

class _StoryTileState extends State<StoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                widget.imgUrl,
                height: 63,
                width: 63,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(widget.username,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w600))
          ],
        ));
  }
}

class ChatTile extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String lastMessage;
  final bool haveunreadmessages;
  final int unreadmessages;
  final String lastSeenTime;
  ChatTile({
    @required this.imgUrl,
    @required this.name,
    @required this.lastMessage,
    @required this.haveunreadmessages,
    @required this.unreadmessages,
    @required this.lastSeenTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                imgUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(lastMessage,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontFamily: "Neue Haas Grotesk"))
                ],
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  Text(lastSeenTime),
                  SizedBox(
                    height: 16,
                  ),
                  haveunreadmessages
                      ? Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xffff410f),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "$unreadmessages",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ))
                      : Container()
                ]))
          ])),
    );
  }
}
