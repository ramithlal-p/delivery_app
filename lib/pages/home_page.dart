import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/scoped_model/main_model.dart';
import 'package:food_delivery/widgets/brought_food.dart';
import 'package:food_delivery/widgets/food_category.dart';
import 'package:food_delivery/widgets/hometopview.dart';
import 'package:food_delivery/widgets/search_file.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Food> _food = foods;

  @override
  void initState() {
    //widget.model.fetchfoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            children: <Widget>[
              HomeTopInfo(),
              FoodCategory(),
              SizedBox(
                height: 20.0,
              ),
              SearchField(),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Frequently Bought Foods",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("I' pressed");
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ScopedModelDescendant(builder:
                  (BuildContext context, Widget child, MainModel model) {
                return Column(
                    children: model.foods.map(_buildFoodItems).toList());
              })
            ]));
  }

  Widget _buildFoodItems(Food food) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFood(
        id: food.id,
        name: food.name,
        imagePath: food.imagePath,
        discount: food.discount,
        price: food.price,
      ),
    );
  }
}
