import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/admin/pages/add_food_items.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/scoped_model/main_model.dart';
import 'package:food_delivery/widgets/food_explore_card.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritePage extends StatefulWidget {
  final MainModel model;

  const FavoritePage({this.model});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fetchfoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext scxt, Widget child, MainModel model) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: RefreshIndicator(
              onRefresh: model.fetchfoods,
              child: ListView.builder(
                itemCount: model.foodLength,
                itemBuilder: (BuildContext lcxt, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext mcxt) => AddFoodItem())),
                    child: FoodExploreCard(
                      title: model.foods[index].name,
                      description: model.foods[index].description,
                      price: model.foods[index].price,
                    ),
                  );
                },
              )),
        );
      }),
    );
  }
}
