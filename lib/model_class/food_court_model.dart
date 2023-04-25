// To parse this JSON data, do
//
//     final cartItems = cartItemsFromJson(jsonString);

import 'dart:convert';

List<CartItems> cartItemsFromJson(String str) => List<CartItems>.from(json.decode(str).map((x) => CartItems.fromJson(x)));

String cartItemsToJson(List<CartItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItems {
  CartItems({
    required this.vender,
    required this.total,
    required this.tax,
    required this.items,
  });

  String vender;
  double total;
  double tax;
  List<Item> items;

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
    vender: json["Vender"],
    total: json["total"]?.toDouble(),
    tax: json["tax"]?.toDouble(),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Vender": vender,
    "total": total,
    "tax": tax,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.foodKind,
    required this.itemName,
    required this.price,
  });

  FoodKind foodKind;
  String itemName;
  double price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    foodKind: foodKindValues.map[json["foodKind"]]!,
    itemName: json["itemName"],
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "foodKind": foodKindValues.reverse[foodKind],
    "itemName": itemName,
    "price": price,
  };
}

enum FoodKind { ASSETS_IMAGES_NONVEG_JPG, ASSETS_IMAGES_VEGETARIAN_JPG }

final foodKindValues = EnumValues({
  "assets/images/nonveg.jpg": FoodKind.ASSETS_IMAGES_NONVEG_JPG,
  "assets/images/vegetarian.jpg": FoodKind.ASSETS_IMAGES_VEGETARIAN_JPG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
