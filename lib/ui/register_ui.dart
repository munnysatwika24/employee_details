import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc.dart';
import '../events/food_court_event.dart';
import '../model_class/food_court_update.dart';
import '../model_class/post_request.dart';
import '../model_class/post_response.dart';
import '../model_class/update_user_request.dart';
import '../repository/food_court_list_repository.dart';
import '../state/base_state.dart';

class RegisterLogin extends StatefulWidget {
  const RegisterLogin({Key? key}) : super(key: key);

  @override
  State<RegisterLogin> createState() => _RegisterLoginState();
}

class _RegisterLoginState extends State<RegisterLogin> {
  // late Future<PostRespondModel> userRegister;
  bool isShow = false;
  // bool isshowResponse = true;
  List<UpdateResponseModel> updateList = [];
  UpdateResponseModel updateResponse = UpdateResponseModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  PostRespondModel response = PostRespondModel();
  List<PostRespondModel> employList = [];
  RegisterBloc _bloc = RegisterBloc();
  String? deleteData;
  int listIndex = 0;

  _callDeleteEmployeeAPI() {
    _bloc.add(DeleteEmployeesDetails());
  }

  _callUpdateEmployeeAPI(UpdateResponseModel employeesList) {
    employeesList.name = nameController.text;
    employeesList.job = jobController.text;
    UpdateNewUser request = UpdateNewUser();
    UpdateResponseModel updateResponse = UpdateResponseModel();
    request.name = employeesList.name;
    request.job = employeesList.job;
    _bloc.add(UpdateNewUserEvent(request: request));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (_) => _bloc,
      child: buildPage(),
    ));
  }

  Widget buildPage() {
    return BlocListener<RegisterBloc, UserFoodCourtState>(
        listener: (context, state) async {
      if (state is UserErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(milliseconds: 4000),
              content: Text('${state.error}'),
              backgroundColor: Colors.black12),
        );
      }
    }, child: BlocBuilder<RegisterBloc, UserFoodCourtState>(
            builder: (context, state) {
      if (state is UserLoadedStates) {
        if (state.event == "PostUserEvent") {
          response = state.data;
          employList.add(response);
        }
        if (state.event == "DeleteEmployeesDetails") {
          print("delete response::${state.data}");
          // deleteData = state.data;
          if (state.data != null) {
            print("list:${employList}");
            employList.remove(employList[listIndex]);
          }
        }

        if (state.event == "UpdateNewUserEvent") {
          updateResponse = state.data;
          print(" updatess::${updateResponse}");
          updateList.add(updateResponse);
          print("updatess1223::${updateResponse}");
        }
      }

      return Center(
        child: Container(child: buildUi()),
      );
    }));
  }

  Widget buildUi() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              headerBar(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: "Enter your Name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: jobController,
                      decoration: InputDecoration(hintText: "Job"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            PostRequestModel request = PostRequestModel();
                            request.name = nameController.text;
                            request.job = jobController.text;
                            _bloc.add(PostUserEvent(request: request));
                            setState(() {
                              isShow = true;
                              // isshowResponse;
                              print("test:${nameController.text}");
                              print("test1:${jobController.text}");

                              nameController.clear();
                              jobController.clear();
                            });
                          },
                          child: Text("Submit")),
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: isShow && employList.length > 0,
                  child: Container(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: employList.length,
                    itemBuilder: (BuildContext context, index) {
                      return SizedBox(
                          height: 100,
                          width: 50,
                          child: Card(
                              elevation: 4,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            employList[index].name.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            employList[index].job.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          employList[index]
                                              .createdAt
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black12),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              listIndex = index;
                                              _callDeleteEmployeeAPI();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Text(
                                                            "Add New Staff Here"),
                                                        TextField(
                                                          controller:
                                                              nameController,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      "Enter Name"),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              jobController,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      "job"),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _callUpdateEmployeeAPI(
                                                                  updateList[
                                                                      index]);
                                                              print(
                                                                  "stafff:name:${nameController.text}");
                                                              print(
                                                                  "stafff:job:${jobController.text}");
                                                              nameController
                                                                  .clear();
                                                              jobController
                                                                  .clear();
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Submit",
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ))
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )));
                    },
                  )))
            ],
          ),
        ),
      ),
    );
  }

  Widget headerBar() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Container(
        margin: EdgeInsets.all(50),
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Image.asset(
            "assets/images/isthara_corporate_logo_2.png",
            height: 80,
          ),
        ),
      ),
    );
  }
}
