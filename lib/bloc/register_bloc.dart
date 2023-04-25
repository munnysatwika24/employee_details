import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/food_court_event.dart';
import '../repository/food_court_list_repository.dart';
import '../state/base_state.dart';
class RegisterBloc extends Bloc<HomeEvent,UserFoodCourtState>{
   FoodCourtRepository repositoryFood=FoodCourtRepository();
  RegisterBloc({UserFoodCourtState? userFoodCourtState}):super(UserLoadingState()){
  on<PostUserEvent>(_onpostlist);
  on<DeleteEmployeesDetails>(_deleteListBloc);
}
  Future<void> _onpostlist(event, Emitter<UserFoodCourtState>emit) async {
    emit(UserLoadingState());
    print("AddEmployeesDetails");
    try {
      final updateUsersList = await repositoryFood.postList(event.request);
      emit(UserLoadedStates(event: "PostUserEvent", data: updateUsersList));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
   Future<void> _deleteListBloc(event,emit)async{
     emit(UserLoadingState());
     print("Deleting..");
     try{
       var deletedList = repositoryFood.deleteEmployees();
       emit(UserLoadedStates(data: deletedList, event: 'DeleteEmployeesDetails'));
       print("Response :: ${deletedList}");
     }catch(e){
       emit(UserErrorState(e.toString()));
     }
   }
}