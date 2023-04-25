import 'package:demo/model_class/post_request.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../model_class/food_court_update.dart';
import '../model_class/post_request.dart';
import '../model_class/post_request.dart';
import '../model_class/update_user_request.dart';
abstract class HomeEvent extends Equatable{
  const HomeEvent();
}
class FoodCourtListEvent extends HomeEvent{


  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class UpdateNewUserEvent extends HomeEvent{
  UpdateNewUser request;
  // String name;
  // String job;
  UpdateNewUserEvent({required this.request});
  @override
  List<Object?> get props => [this.request,];
}
class PostUserEvent extends HomeEvent{
  PostRequestModel request;
  // final String email;
  // final String password;
  // PostUserEvent({required this.email,required this.password});
  PostUserEvent({required this.request});
  @override
  // TODO: implement props
  List<Object?> get props => [request];
}
class DeleteEmployeesDetails extends HomeEvent {
  const DeleteEmployeesDetails();
  @override
  List<Object?> get props => [];

}