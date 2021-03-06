import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_web/animation/fade_animation.dart';
import 'package:food_web/main.dart';
import 'package:food_web/service/auth.dart';
import 'package:food_web/widget/loading.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback toggleView;

  SignupPage({this.toggleView});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  FocusNode textFieldFocus = FocusNode();
  String email = '';
  String password = '';
  String phone = '';
  String address = '';

  bool hidePassword = true;
  bool loading = false;

  hideKeyboard() => textFieldFocus.unfocus();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 80.0,
                        ),
                        FadeAnimation(
                            .2,
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 1.2,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      validator: (val) => val.length == 0
                                          ? 'Enter your Email'
                                          : null,
                                      onChanged: (val) => email = val.trim(),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 12.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      validator: (val) => val.length < 6
                                          ? 'Password least 6 characters'
                                          : null,
                                      onChanged: (val) => password = val.trim(),
                                      obscureText: hidePassword,
                                      focusNode: textFieldFocus,
                                      textAlign: TextAlign.justify,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      validator: (val) => val != password
                                          ? 'Those passwords didn\'t match. Try again.'
                                          : null,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 12.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      onChanged: (val) => phone = val.trim(),
                                      validator: (val) =>
                                          val.trim().length < 10 ||
                                                  val.trim().length > 11
                                              ? 'Phone Number'
                                              : null,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 12.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Phone Number",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      onChanged: (val) => address = val.trim(),
                                      validator: (val) => val.trim().length == 0
                                          ? 'Type your address'
                                          : null,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 12.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Address",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 28.0,
                        ),
                        FadeAnimation(
                            .25,
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password, phone, address);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Container(
                                height: 55.0,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 2.5,
                                      ),
                                      child: Text(
                                        "I\'m ready",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Icon(
                                      Feather.arrow_right,
                                      size: 16.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 16.0,
                        ),
                        FadeAnimation(
                            .3,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Already have an account ? ",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0)),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.toggleView();
                                    });
                                  },
                                  child: Text("Login",
                                      style: TextStyle(
                                          color: Colors.blue[500],
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontSize: 16.0)),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
