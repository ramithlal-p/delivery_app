import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_list_tile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(0, 4.0),
                              color: Colors.black)
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/sachin.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sachin Tendulkar",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+91495368263",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        height: 25.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            "Edit",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Account",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      CustomListTile(
                        icon: Icons.location_on,
                        text: "Location",
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                        icon: Icons.visibility,
                        text: "Change Password",
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                        icon: Icons.shopping_basket,
                        text: "Shopping",
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                        icon: Icons.payment,
                        text: "Payment",
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Notification",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("App Notification",
                              style: TextStyle(fontSize: 16.0)),
                          Switch(
                            value: turnOnNotification,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnNotification = value;
                              });
                            },
                          )
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location Tracking",
                              style: TextStyle(fontSize: 16.0)),
                          Switch(
                            value: turnOnLocation,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnLocation = value;
                              });
                            },
                          )
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Other",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Language", style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Currency", style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
