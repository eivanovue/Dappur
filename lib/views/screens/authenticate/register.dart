import 'package:dappur/views/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  bool _loading = false;
  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loading ? Scaffold(
          backgroundColor: Color(0xff32343d),
          body: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        ) : Scaffold(
          backgroundColor: Color(0xff32343d),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(

                    width: double.infinity,
//                  height: double.infinity,
//                  child: Image.asset("assets/images/background.png",fit: BoxFit.fill,),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 13,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("Dappur", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 42,color: Colors.white,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w700
                                  )
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 90,),
                        Form(
                        key: _formKey,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  validator: (val) => val.isEmpty ? "Enter valid email address." : null,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    hintText: "Email",hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15
                                  ),
                                  ),
                                  onSaved: (val){
                                    email = val;
                                  },
                                ),
                                SizedBox(height: 16,),
                                TextFormField(
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  obscureText: true,
                                  validator: (val) => val.length < 6 ? "Password must be at least six characters long." : null,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    hintText: "Password",hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15
                                  ),
                                  ),
                                  onSaved: (val){
                                    password = val;
                                  },
                                ),
                                SizedBox(height: 30,),
                                GestureDetector(
                                  onTap: () async{
                                  if(_formKey.currentState.validate()){
                                    _formKey.currentState.save();

                                    setState(() {
                                      _loading = true;
                                    });
                                    dynamic result =  await _auth
                                        .registerWithEmailAndPassword(email, password);

                                    if(result == null){
                                      setState(() {
                                        error = "Please supply a valid email." ;
                                        _loading = false;
                                      });
                                    }
                                  }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Color(0xff1b1c21),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Text("Register",textAlign: TextAlign.center,style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            letterSpacing: 1,
                                          fontWeight: FontWeight.w500
                                        )
                                    ),),
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Text(
                                    error,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14.0
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        GestureDetector(
                          onTap: (){
                            widget.toggleView();
                          },
                          child: Text("Already have an account?", style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 0.5
                              )
                          ),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
