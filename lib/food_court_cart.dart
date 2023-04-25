

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'food_court_lists.dart';
import 'model_class/food_court_model.dart';

class FoodCourtCart extends StatefulWidget {
  const FoodCourtCart({Key? key}) : super(key: key);

  @override
  State<FoodCourtCart> createState() => _FoodCourtCartState();
}

class _FoodCourtCartState extends State<FoodCourtCart> {
  bool isSwitch = true;
  bool isOrderSelection = true;
  String orderStatus = "Self Pickup";

  int addValue = 1;
  List<CartItems> _foodCart=[];
  Future<void> cartJson() async {
    final String response =
        await rootBundle.loadString('assets/json/cart.json');
    // final data = await json.decode(response);
    final List parsedList = json.decode(response);
    _foodCart = parsedList.map((val) =>  CartItems.fromJson(val)).toList();
    // print("ORDER DATA:: ${_foodCart.toString()}");

    setState(() {
      // print(" sath::${_foodCart}");
    });
  }
  @override
  void initState(){
    cartJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                Image.asset(
                  "assets/images/isthara_corporate_logo_2.png",
                  height: 70,
                  width: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Platina",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "Fc-1",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          child: Icon(Icons.keyboard_arrow_down),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodCourtList()));
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
              ),
            Container(
                height: 630,
                width: 450,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:_foodCart!=null&& _foodCart.length>0?_foodCart.length:0,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return foodCartItems(_foodCart,index);

                    }),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                    hintText: "Any Suggestion ? we will pass it on"),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.percent_rounded, color: Colors.grey),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Apply Coupon",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: 220,
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey)
                        ],
                      ),
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Bill Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Item Total",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Text("Price")
                    ],
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Taxes & Charges",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Text("Price")
                    ],
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Payable",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Text("Price")
                    ],
                  ),
                  Container(
                    // margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Redeem Points",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Available : 0.0 ",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          Switch(
                            inactiveThumbColor: Colors.orangeAccent,
                            activeColor: Colors.white,
                            // inactiveTrackColor: Colors.white70,
                            activeTrackColor: Colors.orangeAccent[700],
                            value: isSwitch,
                            onChanged: (value) {
                              setState(() {
                                isSwitch = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  color: Colors.black12,
                                  offset: Offset(0, 1))
                            ],
                            color: Colors.white,
                            border: Border.all(color: Colors.white)),
                        width: double.infinity,
                        height: 60,
                        // color: Colors.orange,
                        child: Row(
                          children: [
                            Radio(
                              value: "Self Pickup",
                              activeColor: Colors.orangeAccent[700],
                              onChanged: (value2) {
                                setState(() {
                                  orderStatus = value2!;
                                  isOrderSelection;
                                });
                              },
                              groupValue: orderStatus,
                            ),
                            Text("Self Pickup"),
                            Radio(
                              value: "Deliver Order",
                              activeColor: Colors.orangeAccent[700],
                              onChanged: (value2) {
                                setState(() {
                                  orderStatus = value2!;
                                  isOrderSelection;
                                });
                              },
                              groupValue: orderStatus,
                            ),
                            Text("Deliver Order"),
                            Radio(
                              value: "Dine In",
                              activeColor: Colors.orangeAccent[700],
                              onChanged: (value2) {
                                setState(() {
                                  orderStatus = value2!;
                                  isOrderSelection;
                                });
                              },
                              groupValue: orderStatus,
                            ),
                            Text("Dine In"),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          onPressed: () {},
                          child: Text("  Total Payable Amount ₹ ${788}  ")),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  foodCartItems(List<CartItems> cartItems, int index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/lunch_cart.png"),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItems[index].vender,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold
                ),
              ),
              // Text("Al Saba"),
              SizedBox(
                height: 10,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.orangeAccent)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.remove,
                            color: Colors.orangeAccent,
                            size: 15,
                          ),
                          onTap: () {
                            setState(() {
                              addValue--;
                            });
                          },
                        ),
                        Text(
                          "${addValue}",
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                        InkWell(
                          child: Icon(Icons.add,
                              color: Colors.orangeAccent, size: 15),
                          onTap: () {
                            print(addValue);
                            setState(() {
                              addValue++;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text(cartItems[index].items[index].price.toString())
                ],
              ),
            ],
          ),
        ],
      ),
    );


  }
}
