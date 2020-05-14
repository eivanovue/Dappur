import 'package:dappur/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:dappur/views/screens/authenticate/authenticate.dart';
import 'package:dappur/views/screens/chat/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either Home or Authenticate Widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}
