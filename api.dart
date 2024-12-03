import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/GovtDocModel.dart';
import 'package:untitled/Models/insuranceModel.dart';
import 'package:untitled/Models/loginUpModel.dart';
import 'package:untitled/services/api_constants.dart';
import 'package:untitled/uni/multipleScreens/GovtDoc.dart';
import 'package:untitled/uni/multipleScreens/UpdateInsuranceDetails.dart';

import '../Models/SignUpModel.dart';
import '../Models/UpdateScreenModel.dart';
import '../Models/DeleteProfileModel.dart';
import '../Models/GetImagesModel.dart';
import '../Models/login1Model.dart';
import '../Models/post_model.dart';
import '../Models/updateInsuranceDetailsModel.dart';
import '../Models/userListModel.dart';


class Api {
  static Map<String, String> _JSON_HEADERS = {
    "content-type": "application/json",
  };


  Future<LoginModel?> login(Map<String, String> map) async {
    final mapData = json.encode(map);
    print(ApiConstant.baseUrl + ApiConstant.login);

    var response = await http.post(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.login),
        headers: _JSON_HEADERS,
        body: mapData);
    // log(response.body);
    // if (response.statusCode == 200) {
    return LoginModel.fromJson(json.decode(response.body));
    // }else{
    //
    // }
  }


  // post sign  api

  Future<SignUpModel?> siqnUp(Map<String, String> map) async {
    final mapData = json.encode(map);
    print(ApiConstant.baseUrl + ApiConstant.signUp);
    var response = await http.post(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.signUp),
        headers: _JSON_HEADERS,
        body: mapData);
    // log(response.body);
    if (response.statusCode == 200) {
      return SignUpModel.fromJson(json.decode(response.body));
    }
  }

  // put change password


  Future<ChangePasswordModel?> changePassword(Map<String, String> map) async {
    final mapData = json.encode(map);
    print(ApiConstant.baseUrl + ApiConstant.changePassword);
    var response = await http.put(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.changePassword),
        headers: _JSON_HEADERS,
        body: mapData);
    log(response.body);
    if (response.statusCode == 200) {
      return ChangePasswordModel.fromJson(json.decode(response.body));
    }
    throw Exception("faled to update password${response.statusCode}");
  }


  // Get api


  Future<PostModel> fetchPost() async {
    try {
      final response = await http.get(
          Uri.parse(ApiConstant.baseUrl + ApiConstant.fetchPost),
          headers: _JSON_HEADERS);
      print(json.decode(response.body.toString()));
      return PostModel.fromJson(json.decode(response.toString()));
    } on Exception catch (e) {
      throw ("error $e");
    }
  }


  //get api


  Future<GetImagesModel> getImages({
    required int page,
  }) async {
    try {
      String url =
          "${ApiConstant.basePixaUrl}${ApiConstant
          .apiKey}&image_type=photo&pretty=true";
      final response = await http.get(Uri.parse(url));
      return GetImagesModel.fromJson(json.decode(response.body.toString()));
    } on Exception catch (e) {
      throw e;
    }
  }


  // the api of delete profile


  Future<DeleteProfileModel> DeleteProfile() async {
    print(ApiConstant.baseUrl + ApiConstant.DeleteProfile);
    {
      final response = await http.delete(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.DeleteProfile),
        headers: _JSON_HEADERS,
      );
      log('Response: ${response.statusCode}');
      if (response.statusCode == 200) {
        return DeleteProfileModel.fromJson(json.decode(response.body));
      }
      throw Exception('Failed to delete profile: ${response.statusCode}');
    }
  }


  ////////////    using the post api   ///////

  Future<Login1model?> login1(Map<String, String> map) async {
    final mapData = json.encode(map);
    print(ApiConstant.baseApiUrl + ApiConstant.login1);

    var response = await http.post(
        Uri.parse(ApiConstant.baseApiUrl + ApiConstant.login1),
        headers: _JSON_HEADERS,
        body: mapData);
    return Login1model.fromJson(json.decode(response.body));
  }


  /////////    the get api for profile details//////

  Future<UserListModel> userList() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');

    print(ApiConstant.baseApiUrl + ApiConstant.profileDetails);
    print('token : ${token}');
    final response = await http.get(
        Uri.parse(ApiConstant.baseApiUrl + ApiConstant.profileDetails),
        headers: {
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY3M2ExNzM3OGI5M2FkNDZkMTE0Y2E1NiIsImxhc3ROYW1lIjoiVGVqYSIsImVtYWlsIjoicmF2aUB5b3BtYWlsLmNvbSIsInVzZXJ0eXBlIjoiNCIsImxhdCI6MCwibG5nIjowLCJsYXN0TG9naW5UeXBlIjoibm9ybWFsIn0sImlhdCI6MTczMTkyNjA4MCwiZXhwIjoxNzYzNDYyMDgwfQ.rJ_wBGK6K7M5lvBJDkrmqHTsg3vtd_3gnO5Pb5HHhmE',
        }
    );
    print('response : ${response.body}');
    if (response.statusCode == 200) {
      return UserListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile details. Status Code: ${response.statusCode}');
    }
  }


         ///////// api  for  get insurance detail   ///////


           Future<InsuranceModel>insurance()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
         String? token = sp.getString('token');
    print(ApiConstant.baseApiUrl+ApiConstant.insurance);
        print('token:${token}');
    final Responce = await http.get(
      Uri.parse(ApiConstant.baseApiUrl+ApiConstant.insurance),
      headers: {'Authorization': 'Bearer $token',}
    );
  print('response : ${Responce.statusCode}');
  if (Responce.statusCode == 200) {
  return InsuranceModel.fromJson(json.decode(Responce.body));
         }    else {
      throw Exception('Failed to load profile details. Status Code: ${Responce.statusCode}');
    }
  }

  /////////       get api for govtDoc    //////////

  Future<GovtDocModel>govtDoc()async{
         SharedPreferences sp = await SharedPreferences.getInstance();
             String? token = sp.getString('token');
                 print(ApiConstant.baseApiUrl+ApiConstant.govtDoc);
    print('token:${token}');
               final Responce = await http.get(
        Uri.parse(ApiConstant.baseApiUrl+ApiConstant.govtDoc),
           headers: {'Authorization': 'Bearer $token',}
    );
         print('response : ${Responce.statusCode}');
    if (Responce.statusCode == 200) {
      return GovtDocModel.fromJson(json.decode(Responce.body));
    }    else {
      throw Exception('Failed to load profile details. Status Code: ${Responce.statusCode}');
    }
  }

  /////// post api for update insurance


  Future<UpdateInsuranceDetails?> updateInsurance(String token, File file, Map<String, String> map, Map<String, String>m) async {
    final mapData = json.encode(map);
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    print(ApiConstant.baseApiUrl + ApiConstant.updateInsurance);
    print('token:${token}');
    var response = await http.post(
        Uri.parse(ApiConstant.baseApiUrl + ApiConstant.updateInsurance),
        headers: {'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',},
        body: mapData
      );
    // if (response.statusCode == 200) {
      return UpdateInsuranceDetails.fromJson(json.decode(response.body));
    // }
    // else {
    //   throw Exception('Failed to load profile details. Status Code: ${response
    //       .statusCode}');
    // }
  }
}






