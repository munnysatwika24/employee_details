import 'package:demo/food_court_cart.dart';
import 'package:demo/home_bakers_screen.dart';
import 'package:demo/order_summary.dart';
import 'package:demo/repository/food_court_list_repository.dart';
import 'package:demo/ui/my_list.dart';
import 'package:demo/ui/register_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: RepositoryProvider(create: (context)=>FoodCourtRepository(),child:RegisterLogin() ,),));
}

