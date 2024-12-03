
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/userListModel.dart';
import '../../services/api.dart';
import 'GovtDoc.dart';
import 'insuranceInfo.dart';

class profile1 extends StatefulWidget {
  const profile1({super.key});

  @override
  State<profile1> createState() => _profile1State();
}

class _profile1State extends State<profile1> {

  final Api api = Api();
  final String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY3M2ExNzM3OGI5M2FkNDZkMTE0Y2E1NiIsImxhc3ROYW1lIjoiVGVqYSIsImVtYWlsIjoicmF2aUB5b3BtYWlsLmNvbSIsInVzZXJ0eXBlIjoiNCIsImxhdCI6MCwibG5nIjowLCJsYXN0TG9naW5UeXBlIjoibm9ybWFsIn0sImlhdCI6MTczMTkyNjA4MCwiZXhwIjoxNzYzNDYyMDgwfQ.rJ_wBGK6K7M5lvBJDkrmqHTsg3vtd_3gnO5Pb5HHhmE';
    bool isoloading = false;

  Future<UserListModel> userList() async {
    var response = await api.userList();
    if (response.status==200) {
      print("Successfully loaded data");
      return response;
    } else {
      throw Exception('Failed to load user data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
        child:SingleChildScrollView(
        child:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                     child: FutureBuilder<UserListModel>(
                future: userList(),
                 builder: (BuildContext Context , AsyncSnapshot<UserListModel>snapshot){
               debugPrint('snapshot.data ${snapshot.data?.toJson()}');

            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }else if (snapshot.hasError) {
             return Center(child: Text('Error: ${snapshot.error}'));
             }   else if(snapshot.hasData){
              return Container(
               height: 300,
               width: 350,
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(alignment: Alignment.topLeft),
                    Container(
                      width: 300,
                      child: Text("profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),


                    SizedBox(height: 30),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey, // Background color for image loading state
                          ),
                        ),
                        ClipOval(
                          child: Image.network(
                            snapshot.data?.data?.profilePic ?? '',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),



                    SizedBox(height: 10),
                    Text(snapshot.data?.data?.firstName??'',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(snapshot.data!.data?.email??'',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ///////////    1

            SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Icon(Icons.person),
                           Text("EditProfile",
                             style: TextStyle(
                               fontSize: 17,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                         ],
                      ),
                    ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt_outlined),iconSize: 29,alignment: Alignment.bottomCenter
                  ),
                  ],
                ),


              ////////////   2


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 115,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.payment),
                        Text("Payments",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt_outlined),iconSize: 29,alignment: Alignment.bottomCenter
                  ),
                ],
              ),

              //////////  3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 152,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.payment),
                        Text("Insurance info",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => insurance()),);},
                      icon: Icon(Icons.arrow_right_alt_outlined),
                      iconSize: 29,alignment: Alignment.bottomCenter
                  ),
                ],
              ),

              ///////////       4

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.payment),
                        Text("Govt doc",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => govtDoc()),);},
                      icon: Icon(Icons.arrow_right_alt_outlined),
                      iconSize: 29,alignment: Alignment.bottomCenter
                  ),
                ],
              ),

             //////////////     5

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 113,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.language),
                        Text("language",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt_outlined),
                      iconSize: 29,alignment: Alignment.bottomCenter
                  ),
                ],
              ),

              Container(
                width: 340,
                padding: EdgeInsets.only(right: 248),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.logout,color: Colors.red,),
                    Text("logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
        ),
    )]));
          }
         else {
           return const Center(child: Text('No data available'));
    }
                }
                )

      ))));
  }
}





















































































// for dublication code of insurance screen



// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:untitled/Models/insuranceModel.dart';
// import 'package:untitled/services/api.dart';
// import 'package:untitled/uni/multipleScreens/profileScreen1.dart';
// class insurance extends StatefulWidget {
//   const insurance({super.key});
//
//   @override
//   State<insurance> createState() => _insuranceState();
// }
//
// class _insuranceState extends State<insurance> {
//   final Api api = Api();
//   final String Token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY3NDQ1ZWRjYmEwMDQ5N2Y3ZGZjMDYxYiIsImxhc3ROYW1lIjoiVHlhZ2kiLCJlbWFpbCI6InRveUB5b3BtYWlsLmNvbSIsInVzZXJ0eXBlIjoiNCIsImxhdCI6MCwibG5nIjowLCJsYXN0TG9naW5UeXBlIjoibm9ybWFsIn0sImlhdCI6MTczMjYxNTI2MiwiZXhwIjoxNzY0MTUxMjYyfQ.50Tv9WgMzvDGa9oI1s6ADegufdbtpQjFZ5u6vi7h4mM";
//   bool isoloading = false;
//   Future<InsuranceModel> insurance() async {
//     var response = await api.insurance();
//     if (response.status==200) {
//       print("Successfully loaded ");
//       return response;
//     } else {
//       throw Exception('Failed to load user data');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child:Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.all(10),
//             child:FutureBuilder<InsuranceModel>(
//     future: insurance(),
//     builder: (BuildContext Context , AsyncSnapshot<InsuranceModel>snapshot){
//     debugPrint('snapshot.data ${snapshot.data?.toJson()}');
//
//     if(snapshot.connectionState==ConnectionState.waiting){
//     return const Center(child: CircularProgressIndicator());
//     }else if (snapshot.hasError) {
//     return Center(child: Text('Error: ${snapshot.error}'));
//     }   else if(snapshot.hasData){
//     return  Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                 child: Row(
//             children: [
//             IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: (){Navigator.pop(
//                       context,
//                       MaterialPageRoute(builder: (context) => profile1()),);},
//                   ),
//               Text("Insurance info",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w500,
//                 ),
//               )
//
//             ])),
//
//
//              //////////////////////////////////////////////////////////////
//          SizedBox(height: 30,),
//                 Container(
//                   color: Colors.grey[200],
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "policy number",
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             Text(
//                               snapshot.data?.data!.first.insuranceNumber ?? "",
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             Text(
//                               "insurance Company name",
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             Text(
//                               snapshot.data?.data!.first.insuranceCompanyName ?? "",
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             Text("",
//                               style: TextStyle(
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.delete,
//                           size: 25,
//                         ),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//
//    SizedBox(height: 450,),
//                 Container(
//                height: 48,
//                width: 333,
//                child: ElevatedButton(
//                  style:ElevatedButton.styleFrom(
//                    backgroundColor: Colors.teal
//                  ),
//                  child: Text("Add new policy",
//                  style: TextStyle(
//                    fontWeight: FontWeight.w500,
//                    fontSize: 18,
//                    color: Colors.white
//
//                  ),),
//                onPressed: (){},
//                ),
//              ),
//
//               ],
//             );
//            }
//               else {
//            return const Center(child: Text('No data available'));
//          }
//
//
//             }
//
//           ),
//
//
//       ),
//     ));
//   }
// }

