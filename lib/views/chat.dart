import 'package:dappur/data/data.dart';
import 'package:dappur/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:emoji_picker/emoji_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> messages = new List();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    messages = getMessages();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        if (!visible) {
          _isVisible = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Visibility(
            visible: _isVisible,
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1270&q=80",
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Alex Anton",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text("5 minutes ago"),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ChattingTile(
                      isByMe: messages[index].isByMe,
                      message: messages[index].message,
                    );
                  }),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                  color: Color(0xffF4F5FA),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xffe7e7ef),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.asset(
                      "assets/images/more.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      onTap: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      onSubmitted: (val) {
                        _isVisible = true;
                      },
                      decoration: InputDecoration.collapsed(
                          hintText: "Aa",
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xffe7e7ef),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print("smily tapped");
                      },
                      child: Image.asset(
                        "assets/images/smile.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChattingTile extends StatelessWidget {
  final bool isByMe;
  final String message;
  ChattingTile({@required this.isByMe, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      alignment: isByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: isByMe ? Color(0xffff410f) : Color(0xfffff3f1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: isByMe ? Radius.circular(30) : Radius.circular(0),
                bottomRight:
                    isByMe ? Radius.circular(0) : Radius.circular(30))),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 2 / 3),
          child: Text(
            message,
            style: TextStyle(
                color: isByMe ? Colors.white : Color(0xff650000),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
