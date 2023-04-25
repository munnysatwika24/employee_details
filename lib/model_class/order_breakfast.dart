// To parse this JSON data, do
//
//     final foodItems = foodItemsFromJson(jsonString);

import 'dart:convert';

FoodItems foodItemsFromJson(String str) => FoodItems.fromJson(json.decode(str));

String foodItemsToJson(FoodItems data) => json.encode(data.toJson());

class FoodItems {
  FoodItems({
    required this.items,
  });

  List<Item> items;

  factory FoodItems.fromJson(Map<String, dynamic> json) => FoodItems(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.image,
    required this.itemName,
    required this.price,
  });

  String image;
  String itemName;
  double price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    image: json["image"],
    itemName: json["itemName"],
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "itemName": itemName,
    "price": price,
  };
}