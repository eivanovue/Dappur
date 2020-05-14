import 'package:dappur/views/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

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
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 55),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  validator: (val) => val.isEmpty ? "Enter Valid Email" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15
                                  ),
                                  ),
                                  onSaved: (val){
                                    email = val;
                                  },
                                ),
                                SizedBox(height: 50,),
                                TextFormField(
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  obscureText: true,
                                  validator: (val) => val.isEmpty ? "Enter Password " : null,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.white,
                                      ),
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
                                SizedBox(height: 50,),
                                GestureDetector(
                                  onTap: () async{
                                  if(_formKey.currentState.validate()){
                                    _formKey.currentState.save();

                                    setState(() {
                                      _loading = true;
                                    });

                                    dynamic result =  await _auth
                                        .signInWithEmailAndPassword(email.trim(), password);

                                    if(result == null){
                                      setState(() {
                                        error = "Incorrect credentials." ;
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
                                    child: Text("Sign In",textAlign: TextAlign.center,style: GoogleFonts.montserrat(
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
                        SizedBox(height: 20,),
                        Text("OR",style: TextStyle(
                            fontSize: 14,
                            color: Colors.white60
                        ),),
                        SizedBox(height: 20,),
                        GestureDetector(
                            onTap: () async {
//                            checkBiometrics();
//                            if(_canCheckBiometric){
//                              await _authorizeNow();
//                              if(_authorizedOrNot == "Authorized"){
//                                _authService.signInAnom();
//                              }else{
//                                cantCheckBiometricsDialog(context);
//                              }
//                            }else{
//                              cantCheckBiometricsDialog(context);
//                            }
                            },
                            child: Image.asset("assets/images/fingerprint.png", height: 36, width: 36,)
                        ),
                        SizedBox(height: 30,),
                        GestureDetector(
                          onTap: (){
                            widget.toggleView();
                          },
                          child: Text("Don't have an account?", style: GoogleFonts.montserrat(
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