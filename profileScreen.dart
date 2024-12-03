import 'package:flutter/material.dart';
import 'package:untitled/Models/loginUpModel.dart';
import 'package:untitled/services/api.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final api = Api();
  bool _isLoading = false;

  Future<void> DeleteProfile() async {
    setState(() {
      _isLoading = true;
    });


    try {
      final response = await api.DeleteProfile();
      if (response.success == true) {
        print("Successfully deleted profile: ${response.message}");
      } else {
        print("Unexpected response format: ${response.message}");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                    child: _isLoading
                        ? SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                        : Text(
                      "Delete Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: DeleteProfile,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
