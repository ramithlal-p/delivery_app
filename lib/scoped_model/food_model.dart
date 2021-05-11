import 'dart:convert';
import 'package:food_delivery/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];
  bool _isLoading = false;

  bool get IsLoading {
    return _isLoading;
  }

  int get foodLength {
    return _foods.length;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async {
    // _foods.add(food);
    _isLoading = true;
    notifyListeners();
    try {
      final Map<String, dynamic> foodData = {
        "title": food.name,
        "description": food.description,
        "category": food.category,
        "price": food.price,
        "discount": food.discount
      };
      var url = Uri.parse(
          "https://deliveryapp-9db19-default-rtdb.asia-southeast1.firebasedatabase.app/food.json");
      final http.Response response =
          await http.post(url, body: json.encode(foodData));
      // print(response);
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData["name"]);

      Food foodWithId = Food(
          id: responseData["name"],
          name: food.name,
          description: food.description,
          category: food.category,
          price: food.price,
          discount: food.discount);
      _foods.add(foodWithId);
      _isLoading = false;
      notifyListeners();
      //fetchfoods();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      // print("Connection error : $e");
    }
  }

  Future<bool> fetchfoods() async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response = await http.get(Uri.parse(
          "https://deliveryapp-9db19-default-rtdb.asia-southeast1.firebasedatabase.app/food.json"));
      final Map<String, dynamic> fetchedData = json.decode(response.body);
      //print(fetchedData);
      // ignore: deprecated_member_use
      List<Food> foodItems = List<Food>();
      fetchedData.forEach((String id, dynamic foodData) {
        Food foodItem = Food(
          id: id,
          name: foodData["title"],
          category: foodData["category"],
          description: foodData["description"],
          discount: foodData["discount"],
          price: foodData["price"],
        );
        foodItems.add(foodItem);
      });
      _foods = foodItems;
      _isLoading = false;
      notifyListeners();
      Future.value(true);
    } catch (e) {
      _isLoading = true;
      notifyListeners();
      Future.value(true);
    }
  }
}
