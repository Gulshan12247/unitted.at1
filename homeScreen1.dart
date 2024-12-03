import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/services/api.dart';


import '../../Models/userListModel.dart';
import 'loginScrren1.dart';



class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final Api api = Api();
  final String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY3M2ExNzM3OGI5M2FkNDZkMTE0Y2E1NiIsImxhc3ROYW1lIjoiVGVqYSIsImVtYWlsIjoicmF2aUB5b3BtYWlsLmNvbSIsInVzZXJ0eXBlIjoiNCIsImxhdCI6MCwibG5nIjowLCJsYXN0TG9naW5UeXBlIjoibm9ybWFsIn0sImlhdCI6MTczMTkyNjA4MCwiZXhwIjoxNzYzNDYyMDgwfQ.rJ_wBGK6K7M5lvBJDkrmqHTsg3vtd_3gnO5Pb5HHhmE';

  @override
  void initState() {
    super.initState();
  }
  void logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login1()),
    );
  }


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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home Screen", textAlign: TextAlign.center),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'logout') {
                logout();
              }
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem<String>(
                  child: Text("Logout"),
                  value: 'logout',
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<UserListModel>(
            future: userList(),
            builder: (BuildContext context, AsyncSnapshot<UserListModel> snapshot) {

              debugPrint('snapshot.data ${snapshot.data?.toJson()}');

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                 return Container(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                    Text(snapshot.data?.data?.firstName??''),
                       Text(snapshot.data?.data?.email??''),
                       Text(snapshot.data!.data?.id??''),

                ]
                   ));
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }
}


