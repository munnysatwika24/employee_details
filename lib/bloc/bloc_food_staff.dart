import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/base_state.dart';
import '../events/food_court_event.dart';
import '../model_class/food_court_update.dart';
import '../repository/food_court_list_repository.dart';

class FoodCourtBloc extends Bloc<HomeEvent,UserFoodCourtState> {
  FoodCourtRepository repositoryFood=FoodCourtRepository();

  FoodCourtBloc({UserFoodCourtState? userFoodCourtState}) : super(UserLoadingState()) {
    on<FoodCourtListEvent>(_onfoodCourtList);
    on<UpdateNewUserEvent>(_onupdateStaff);

  }

  Future<void> _onfoodCourtList(event, emit) async {
    emit(UserLoadingState());
    try {
      final foodCourtLists = await repositoryFood.getFoodCourtList();

      emit(UserLoadedState(foodCourtLists,));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }



  Future<void> _onupdateStaff(UpdateNewUserEvent event, emit) async {
    emit(UserLoadingState());
    try {
      final foodCourtListNew = await repositoryFood.getFoodCourt(event.request);
      emit(UserLoadedStates(data:foodCourtListNew,event: "UpdateNewUserEvent" ));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }


}
