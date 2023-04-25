// To parse this JSON data, do
//
//     final orderedItems = orderedItemsFromJson(jsonString);

import 'dart:convert';

OrderedItems orderedItemsFromJson(String str) => OrderedItems.fromJson(json.decode(str));

String orderedItemsToJson(OrderedItems data) => json.encode(data.toJson());


class OrderedItems {
  OrderedItems({
    required this.vender,
    required this.total,
    required this.tax,
    required this.items,
  });

  String vender;
  double total;
  double tax;
  List<Item> items;

  factory OrderedItems.fromJson(Map<String, dynamic> json) => OrderedItems(
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
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  String itemName;
  int quantity;
  double price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemName: json["itemName"],
    quantity: json["quantity"],
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "itemName": itemName,
    "quantity": quantity,
    "price": price,
  };
}
