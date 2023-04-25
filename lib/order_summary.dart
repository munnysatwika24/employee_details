import 'dart:convert';

import 'package:demo/model_class/meal_model_class.dart';
import 'package:demo/model_class/ordered_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  List<OrderedItems> _meals = [];
  // List<FoodItems> foodItemsList = [];
  List<FoodItemsList> foodItems = [];
  List foodCourt = ["5 Star Chicken", "Amritsar Wala", "Dakshin"];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/order_summary.json');
    // final data = await json.decode(response);
    final List parsedList = json.decode(response);

    _meals = parsedList.map((val) =>  OrderedItems.fromJson(val)).toList();
    print("ORDER DATA:: ${_meals.toString()}");
    // setState(() {
    // });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
            Text(
              "Order Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spac,
                    children: [
                      Text(
                        "Order id: ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text("#2028",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        width: 170,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            side:
                                const BorderSide(width: 1, color: Colors.redAccent),
                            // shape:OutlineInputBorder(borderRadius: ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Cancelled",
                            style: TextStyle(color: Colors.redAccent),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "12 Mar 2023 ,  ",
                        style: TextStyle(color: Colors.black26),
                      ),
                      Text("4:50 pm", style: TextStyle(color: Colors.black26))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Your Order",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                    // height: 630,
                    // width: 450,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _meals.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return vendorWiseDataWidget(_meals[index]);
                        }),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  vendorWiseDataWidget(OrderedItems orderedItems){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        // height: 200,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/order_food1.jpg",
                    height: 50,
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        orderedItems.vender,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.redAccent)),
                        child: Center(
                          child: Text(
                            "Cancelled",
                            style: TextStyle(
                                color: Colors.redAccent),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),


              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orderedItems.items!=null && orderedItems.items.length>0?orderedItems.items.length:0,
                  itemBuilder: (context,idx){
                return itemWidget(orderedItems.items[idx]);
              }),
              Divider(
                color: Colors.black,
                thickness: 0,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Item Price from ${orderedItems.vender}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₹${orderedItems.total.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tax & Charges",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(
                    "₹${orderedItems.tax.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  itemWidget(Item item){
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${item.quantity} x ${item.itemName}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black26),
                ),
                Text(
                    "₹${item.price.toString()}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black26)),
              ],
            ),
          ),

        ],
      ),
    );
  }

  // _items() {
  //   for (int i = 0; i < _meals.length; i++) {}
  // }

  // showFoodItems() {
  //   FoodItems foodItemsList1 = FoodItems(
  //       title: 'Chicken Fingers',
  //       price: " ₹ 95.0",
  //       quantity: 2,
  //       quantity2: "(3pcs)",
  //       foodItems: ["idly"]);
  //   foodItemsList.add(foodItemsList1);
  //   FoodItems foodItemsList2 = FoodItems(
  //     title: 'Chicken Shorts Mini',
  //     price: " ₹ 136.8",
  //     quantity: 2,
  //     quantity2: "(6pcs)",
  //     foodItems: ["vada"],
  //   );
  //   foodItemsList.add(foodItemsList2);
  //   FoodItems foodItemsList3 = FoodItems(
  //     title: 'Chicken Mini Biryani',
  //     price: " ₹ 200.0",
  //     quantity: 1,
  //     quantity2: "(half)",
  //     foodItems: ["idly"],
  //   );
  //   foodItemsList.add(foodItemsList3);
  //   FoodItemsList foodItem1 = FoodItemsList(
  //       item: "Dal Thadaka",
  //       price: "₹ 200.0",
  //       quantity: 2,
  //       quantity2: "(Full)");
  //   foodItems.add(foodItem1);
  //   FoodItemsList foodItem2 = FoodItemsList(
  //       item: "Hyderabadhi Veg Biryani",
  //       price: "₹ 200.0",
  //       quantity: 1,
  //       quantity2: "(Full)");
  //   foodItems.add(foodItem2);
  //   FoodItemsList foodItem3 = FoodItemsList(
  //       item: "Malabar paratha",
  //       price: "₹ 95.0",
  //       quantity: 1,
  //       quantity2: "(2 malabar Parathas)");
  //   foodItems.add(foodItem3);
  // }
}
