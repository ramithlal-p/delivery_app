import 'package:flutter/material.dart';
import 'package:food_delivery/pages/signup_page.dart';
import 'package:food_delivery/widgets/button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _togglevisibility = true;

  Widget _buildEmailTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your email or username",
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
    );
  }

  Widget _buildPassWordTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your Password",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          _buildEmailTextFeild(),
                          SizedBox(
                            height: 20,
                          ),
                          _buildPassWordTextFeild(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Button(
                    btnText: "SignIn",
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have a account ? ",
                        style: TextStyle(
                            color: Color(0xFFBDC2CB),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SignUpPage()));
                        },
                        child: Text(
                          "SignUp",
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
