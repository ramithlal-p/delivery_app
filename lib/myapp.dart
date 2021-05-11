import 'package:flutter/material.dart';
import 'package:food_delivery/admin/pages/add_food_items.dart';
import 'package:food_delivery/scoped_model/main_model.dart';
import 'package:food_delivery/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: mainModel,
        child: MaterialApp(
          title: "Food Delivery App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.blueAccent),
          home: MainScreen(model: mainModel),
        ));
  }
}
