import 'package:flutter/material.dart';
import 'package:food_delivery/pages/signin_page.dart';
import 'package:food_delivery/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _toggleconfirmvisibility = true;
  bool _togglevisibility = true;

  Widget _buildUserNameTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "User Name",
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
    );
  }

  Widget _buildEmailTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
    );
  }

  Widget _buildPassWordTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _togglevisibility = !_togglevisibility;
              });
            },
            icon: _togglevisibility
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          ),
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
      obscureText: _togglevisibility,
    );
  }

  Widget _buildConfirmPassWordTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Confirm Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _toggleconfirmvisibility = !_toggleconfirmvisibility;
              });
            },
            icon: _toggleconfirmvisibility
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          ),
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
      obscureText: _toggleconfirmvisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          _buildUserNameTextFeild(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildEmailTextFeild(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildPassWordTextFeild(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildConfirmPassWordTextFeild()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Button(btnText: "SignUp"),
                  Divider(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have a account ? ",
                        style: TextStyle(
                            color: Color(0xFFBDC2CB),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SignInPage()));
                        },
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  )
                ])));
  }
}
