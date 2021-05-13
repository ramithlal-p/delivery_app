import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_button.dart';

class FoodExploreCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;

  FoodExploreCard({this.title, this.description, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0, offset: Offset(0, 0.5), color: Colors.black38)
          ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/breakfast.jpeg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.0,
              ),
              Text(
                "$title",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "$description",
                style: TextStyle(fontSize: 10.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Text(
                    "\u20B9 $price",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SmallButton(
                    btnText: "Buy",
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
