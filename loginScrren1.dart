import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api.dart';
import 'homeScreen1.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usertypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final Api api = Api();
  Future<void> login1() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading=true;
      });
      final params = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "usertype":'4',
      };

      try {
        final response = await api.login1(params);
        setState(() {
          isLoading = false;
        });

        if (response?.success == true) {
          print("token: ${response?.token}");

          ///////store information in shared preference//////////////
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString('token', response?.token ?? "");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen1()),
          );

          print("Successfully logged in");
        }
        else {
          print(" ${response?.message}");
          Fluttertoast.showToast(msg: response?.message??"something went wrong",
            textColor: Colors.white,
            fontSize: 15,
            backgroundColor: Colors.black,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      } catch (e) {
        setState(() {
          isLoading=false;
        });
        print("Exception occurred: $e");

      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(5),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    "Login Form",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains("@")) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 5) {
                              return 'Password must be at least 5 characters';
                            }
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text(
                            "Change Password",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {

                          },
                        ),
                        TextButton(
                          child: const Text(
                            "New Account",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 48,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      child:isLoading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      )
                          : Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed:isLoading?null:login1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
