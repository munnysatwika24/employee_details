import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodCourtList extends StatefulWidget {
  const FoodCourtList({Key? key}) : super(key: key);

  @override
  State<FoodCourtList> createState() => _FoodCourtListState();
}

class _FoodCourtListState extends State<FoodCourtList> {
  List _foodCourtList = [];
  Future<void> foodCourtJson() async {
    final String response =
        await rootBundle.loadString('assets/json/food_court_List.json');
    final data = await json.decode(response);
    setState(() {
      _foodCourtList = data["items"];
      print(" sath::${_foodCourtList}");
    });
  }

  @override
  void initState() {
    foodCourtJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FoodCourts",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Image.asset(
                      "assets/images/img.png",
                      height: 30,
                      width: 30,
                      color: Colors.black45,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.white30),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset(0, 1),
                        color: Colors.black12)
                  ]),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                    hintText: "Search For FoodCourts Here",
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.black12,
                    )),
              ),
            ),
            Container(
              height: 700,
              width: 400,
              margin: EdgeInsets.all(5),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: _foodCourtList != null && _foodCourtList.length > 0
                      ? _foodCourtList.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: 90,
                        width: 200,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  _foodCourtList[index]["image"],
                                  height: 50,
                                  width: 90,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_foodCourtList[index]["foodCourt"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)
                                    ),SizedBox(height: 10,),
                                    Text(_foodCourtList[index]["location"],
                                        style: TextStyle(
                                          color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15)
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
