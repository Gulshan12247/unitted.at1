import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api.dart';
import 'insuranceInfo.dart';

class updateInsurance extends StatefulWidget {
  const updateInsurance({super.key});

  @override
  State<updateInsurance> createState() => _updateInsuranceState();
}

class _updateInsuranceState extends State<updateInsurance> {
  final TextEditingController _insuranceNumber = TextEditingController();
  final TextEditingController _insuranceCompanyNameController = TextEditingController();
  final TextEditingController _FileController = TextEditingController();
  final TextEditingController _InsuranceDetailsController= TextEditingController();
  bool isloading = false;
  final Api api = Api();

  Map<String, String> get file => file;


  Future<void>updateInsurance() async {
    final params = {
      "insuranceNumber": _insuranceNumber.text,
      "insuranceCompanyName": _insuranceCompanyNameController.text,
      // "file":_FileController.text,
      "InsuranceDetails":  _InsuranceDetailsController.text,
    };
    try {
      final responce  = await api.updateInsurance(params as String ,token as File , File as Map<String, String>,file);


      if (responce?.status==200) {
        print("token: ${responce?.token}");


        print("Successfully logged in");
      }
      else {
        print(" ${responce?.message}");
        Fluttertoast.showToast(msg: responce?.message??"something went wrong",
          textColor: Colors.white,
          fontSize: 15,
          backgroundColor: Colors.black,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {

      print("Exception occurred: $e");


    } }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child:SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=> insurance()));},
                            child: Icon(Icons.arrow_back,
                              size: 25,),
                          ),
                          SizedBox(width: 80,),
                          Text("Add New Policy",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: 350,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("policy number"),
                            SizedBox(height: 10,),
                            TextField(
                              controller: _insuranceNumber,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: InputBorder.none

                              ),
                            ),
                            Text("Insurance Company Name"),
                            SizedBox(height: 10,),
                            TextField(
                              controller: _insuranceCompanyNameController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: InputBorder.none

                              ),
                            ),
                            Text(" File"),
                            SizedBox(height: 10,),
                            TextField(
                              controller: _FileController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.file_copy),
                                  onPressed: pickFileFromFileManager,
                                ),
                              ),
                            ),
                            Text("Enter insurance details"),
                            SizedBox(height: 10,),

                            TextField(
                              controller: _InsuranceDetailsController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: InputBorder.none

                              ),
                            ),


                          ]),),

                    SizedBox(height: 40,),
                    Container(
                      height: 48,
                      width: 333,
                      padding: EdgeInsets.only(left: 5,right: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: Text("Save",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: updateInsurance,
                      ) ,
                    ) ,
                  ],
                ),
              )),
        )
    );
  }
  Future<void> pickFileFromFileManager() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? filePath = result.files.single.path;
      print("Selected file: $filePath");
      if (filePath != null) {
        setState(() {
          _FileController.text = filePath;
        });
      }
    } else {
      setState(() {
        _FileController.text = "No file selected";
      });
      print("No file selected");
    }
  }

}

mixin token {
}
