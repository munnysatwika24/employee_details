// // import 'package:demo/model_class/list_of_food_courts.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import '../state/base_state.dart';
// // import '../bloc/bloc_food_staff.dart';
// // import '../events/food_court_event.dart';
// //
// // import '../model_class/food_court_update.dart';
// // import '../model_class/update_user_request.dart';
// // import '../repository/food_court_list_repository.dart';
// //
// // class MyFoodCourtList extends StatefulWidget {
// //   const MyFoodCourtList({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyFoodCourtList> createState() => _MyFoodCourtListState();
// // }
// //
// // class _MyFoodCourtListState extends State<MyFoodCourtList> {
// //
// //    FoodCourtBloc _bloc = FoodCourtBloc();
// //   List<Foodcourt> staff = [];
// //
// //   TextEditingController nameController = TextEditingController();
// //   TextEditingController jobController = TextEditingController();
// // int indexupdate = 0;
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: BlocProvider(
// //       create: (_) =>_bloc,
// //
// //       child: buildPage(),
// //     ));
// //   }
// //
// //   Widget buildPage() {
// //     return BlocListener<FoodCourtBloc, UserFoodCourtState>(
// //         listener: (context, state) async {
// //       if (state is UserErrorState) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //               duration: Duration(milliseconds: 4000),
// //               content: Text('${state.error}'),
// //               backgroundColor: Colors.black12),
// //         );
// //         // a=state.data;
// //       }
// //       else if (state is UserLoadedState) {
// //         staff = state.foodCourtList;
// //         print("staffff::${staff}");
// //
// //       }
// //       else if (state is UserLoadedStates) {
// //         if(state.event == "UpdateNewUserEvent"){
// //           // updateResponse = state.data;
// //           // print(" update::${updateResponse}");
// //         }
// //
// //
// //       }
// //     }, child: BlocBuilder<FoodCourtBloc, UserFoodCourtState>(
// //             builder: (context, state) {
// //       // if (state is UserLoadingState) {
// //       //   return Container(
// //       //     child: Center(
// //       //       child: CircularProgressIndicator(),
// //       //     ),
// //       //   );
// //       // }
// //
// //       return Center(
// //         child: Container(child: buildUi()),
// //       );
// //     }));
// //   }
// //
// //   Widget buildUi() {
// //     return SingleChildScrollView(
// //       child: Padding(
// //         padding: EdgeInsets.all(5),
// //         child: Container(
// //           child: Column(
// //             children: [
// //               headerBar(),
// //               Container(
// //                 padding: EdgeInsets.all(5),
// //                 child: ListView.builder(
// //                     physics: BouncingScrollPhysics(),
// //                     itemCount:6,
// //                     shrinkWrap: true,
// //                     itemBuilder: (
// //                       context,
// //                       index,
// //                     ) {
// //                       return Container(
// //                         margin: EdgeInsets.all(8),
// //                         height: 100,
// //                         width: 50,
// //                         child: Card(
// //                           margin: EdgeInsets.symmetric(
// //                             horizontal: 5,
// //                           ),
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child:Row(children: [Padding(padding: EdgeInsets.all(10),child: Text(
// //                                 updateList[index].name.toString()))],)
// //                             // Row(
// //                             //   mainAxisAlignment: MainAxisAlignment.start,
// //                             //   children: [
// //                             //     CircleAvatar(
// //                             //       backgroundImage:
// //                             //           NetworkImage(staff[index].avatar),
// //                             //     ),
// //                             //     Padding(
// //                             //       padding: const EdgeInsets.all(8.0),
// //                             //       child: Column(
// //                             //         crossAxisAlignment:
// //                             //             CrossAxisAlignment.start,
// //                             //         children: [
// //                             //           Text(
// //                             //             staff[index].id.toString(),
// //                             //             textAlign: TextAlign.center,
// //                             //             style: TextStyle(
// //                             //                 fontWeight: FontWeight.bold),
// //                             //           ),
// //                             //           Text(
// //                             //             staff[index].firstName,
// //                             //             textAlign: TextAlign.center,
// //                             //             style: TextStyle(
// //                             //                 fontWeight: FontWeight.bold),
// //                             //           ),
// //                             //           Text(staff[index].email,
// //                             //               style: TextStyle(
// //                             //                   fontWeight: FontWeight.bold))
// //                             //         ],
// //                             //       ),
// //                             //     ),
// //                             //   ],
// //                             // ),
// //                           ),
// //                         ),
// //                       );
// //                     }),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget headerBar() {
// //     return Padding(
// //       padding: EdgeInsets.only(top: 30),
// //       child: Container(
// //         child: Row(
// //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: [
// //             Padding(
// //                 padding: const EdgeInsets.only(left: 20),
// //                 child: Icon(Icons.arrow_back_ios)),
// //             Padding(
// //               padding: const EdgeInsets.only(right: 10),
// //               child: Image.asset(
// //                 "assets/images/isthara_corporate_logo_2.png",
// //                 height: 80,
// //               ),
// //             ),
// //             InkWell(
// //               child: Container(
// //                 child: Padding(
// //                   padding: EdgeInsets.only(left: 130),
// //                   child: Row(
// //                     children: [
// //                       Icon(Icons.add, color: Colors.pinkAccent),
// //                       Text(
// //                         "Add User",
// //                         style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.pinkAccent),
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                        title : Column(
//                         children: [
//                           Text("Add New Staff Here"),
//
//                           TextField(
//                             controller: nameController,
//                             decoration: InputDecoration(hintText: "Enter Name"),
//                           ),
//                           TextField(
//                             controller: jobController,
//                             decoration: InputDecoration(hintText: "job"),
//                           ),
//                         ],
//                       ),
//                       actions: [
//                         ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 indexupdate;
//                                 _callUpdateEmployeeAPI(updateList[0]);
//                               print("stafff:name:${nameController.text}");
//                               print("stafff:job:${jobController.text}");
//                                 nameController
//                                     .clear();
//                                 jobController.clear();
//                             });
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               "Submit",
//                               style: TextStyle(fontSize: 10),
//                             ))
//                       ],
//                     );
//                   },
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
