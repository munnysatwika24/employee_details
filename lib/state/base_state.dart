import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model_class/food_court_update.dart';
import '../model_class/list_of_food_courts.dart';
import '../model_class/post_response.dart';
import '../model_class/update_user_request.dart';

@immutable
abstract class UserFoodCourtState extends Equatable {}
//data loading state
class UserLoadingState extends UserFoodCourtState {
  UserLoadingState();

  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserFoodCourtState {
  UserLoadedState( this.foodCourtList, );
  final List<Foodcourt> foodCourtList;
  // final List<UpdateNewUser> updateList;
  @override
  List<Object?> get props => [foodCourtList,];
}
class UserLoadedState1 extends UserFoodCourtState {
  UserLoadedState1( this.updateList, );
  final List<UpdateResponseModel> updateList;
  // final List<UpdateNewUser> updateList;
  @override
  List<Object?> get props => [updateList,];
}
// class UserLoadedStatePost extends UserFoodCourtState {
//   UserLoadedStatePost( this.postList, );
//    PostRespondModel postList;
//   // final List<UpdateNewUser> updateList;
//   @override
//   List<Object?> get props => [postList,];
// }
class UserLoadedStates<T> extends UserFoodCourtState {
   T data;
   String event;
  UserLoadedStates( {required this.data,required this.event} );
  // PostRespondModel postList;
  // final List<UpdateNewUser> updateList;

  String toString() => 'DataLoaded';

  @override
  // TODO: implement props
  List<Object?> get props => [data,event];




}

class UserErrorState extends UserFoodCourtState {
  UserErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
