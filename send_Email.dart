// import 'package:flutter/material.dart';
//
// class sendEmail extends StatefulWidget {
//   const sendEmail({super.key});
//
//   @override
//   State<sendEmail> createState() => _sendEmailState();
// }
//
// class _sendEmailState extends State<sendEmail> {
//   final TextEditingController _emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//           height: MediaQuery.of(context).size.height,
//     width: MediaQuery.of(context).size.width,
//     padding: EdgeInsets.all(5),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       SizedBox(height: 20,),
//       Text("sign up with email",
//       style: TextStyle(
//         color: Colors.blueAccent,
//         fontSize: 25,
//         fontWeight: FontWeight.w600,
//       ),
//
//       ),
//       SizedBox(height: 20,),
//       Container(
//         height: 100,
//         width:300,
//       child:
//               TextFormField(
//         controller: _emailController,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           labelText: "Email",
//           labelStyle: const TextStyle(color: Colors.black),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty || !value.contains("@")) {
//             return 'Please enter a valid email';
//           }
//           return null;
//         },
//       ),
//
//
//       ),
//       Container(
//         alignment: Alignment.bottomRight,
//         height: 48,
//         width: 250,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blueAccent,
//           ),
//           child: Text(
//             "Send",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 17
//             ),
//           ),
//           onPressed: (){sendEmail();}
//       ),
//
//
//
//
//
//       )])),
//     ));
//   }
// }
