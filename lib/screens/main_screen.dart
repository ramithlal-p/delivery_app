import 'package:flutter/material.dart';
import 'package:food_delivery/admin/pages/add_food_items.dart';
import 'package:food_delivery/pages/explore_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/order_page.dart';
import 'package:food_delivery/pages/profile_page.dart';
import 'package:food_delivery/scoped_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    // call the fetch methods on food
    widget.model.fetchfoods();

    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage(model: widget.model);
    profilePage = ProfilePage();
    pages = [homePage, favoritePage, orderPage, profilePage];

    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            currentTabIndex == 0
                ? "Food Delivery App"
                : currentTabIndex == 1
                    ? "All Food Items"
                    : currentTabIndex == 2
                        ? "Orders"
                        : "Profile",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                },
                title: Text("Add Food Item"),
                leading: Icon(Icons.list),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
        ),
        body: currentPage,
      ),
    );
  }
}
