import 'package:flutter/material.dart';
import 'package:untitled/Models/insuranceModel.dart';
import 'package:untitled/services/api.dart';
import 'package:untitled/uni/multipleScreens/profileScreen1.dart';
import 'package:url_launcher/url_launcher.dart';

import 'UpdateInsuranceDetails.dart';

class insurance extends StatefulWidget {
  const insurance({super.key});

  @override
  State<insurance> createState() => _insuranceState();
}

class _insuranceState extends State<insurance> {
  final Api api = Api();

  Future<InsuranceModel> fetchInsurance() async {
    var response = await api.insurance();
    if (response.status == 200) {
      return response;
    } else {
      throw Exception('Failed to load insurance data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Insurance Info'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => profile1 ()));
          },
        ),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child:Column(
               children: [
             Container(
               height: 628,
               child: FutureBuilder<InsuranceModel>(
                 future: fetchInsurance(),
                 builder: (BuildContext context, AsyncSnapshot<InsuranceModel> snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return const Center(child: CircularProgressIndicator());
                   } else if (snapshot.hasError) {
                     return Center(child: Text('Error: ${snapshot.error}'));
                   } else if (snapshot.hasData) {
                     final insuranceData = snapshot.data?.data;
                     if (insuranceData == null || insuranceData.isEmpty) {
                       return const Center(child: Text('No data available'));
                     }
                     return ListView.builder(
                       itemCount: snapshot.data?.data?.length,
                       itemBuilder: (context, index) {
                         final snapshot = insuranceData[index];
                         return Container(
                           height: 140,
                           padding: EdgeInsets.all(5),
                           margin: EdgeInsets.only(bottom: 9),
                           color: Colors.grey[200],
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Policy Number',
                                     style: const TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w300,
                                     ),
                                   ),
                                   Text(
                                    snapshot.insuranceNumber?? '',
                                     style: const TextStyle(
                                       fontSize: 19,
                                       fontWeight: FontWeight.w700,
                                     ),
                                   ),
                                   Text(
                                     'Insurance Company Name',
                                     style: const TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w300,
                                     ),
                                   ),
                                   Text(
                                     snapshot.insuranceCompanyName ?? '',
                                     style: const TextStyle(
                                       fontSize: 19,
                                       fontWeight: FontWeight.w700,
                                     ),
                                   ),
                                     GestureDetector(
                                       child: Container(
                                         child: Text("Policy/insurance.file",
                                         style: TextStyle(
                                           color: Colors.blue,
                                         ),
                                         ),
                                       ),
                                     onTap: ()async{
                                       final Uri url = Uri.parse(snapshot.file?.first??"");
                                       if (!await launchUrl(url)) {
                                         throw Exception('Could not launch $_url');
                                       }
                                     },
                                     )],
                               ),
                               Container(
                                 height: 100,
                                 child: IconButton(
                                   alignment: Alignment.topCenter,
                                   icon: const Icon(Icons.delete, size: 25,color: Colors.red,),
                                   onPressed: () {
                                     // Handle delete action
                                   },
                                 ),
                               ),
                             ],
                           ),
                         );
                       },
                     );
                   } else {
                     return const Center(child: Text('No data available'));
                   }
                 },
               ),
             ),

           Container(
             height: 48,
             width: 333,
             padding: EdgeInsets.only(left: 5,right: 5),
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.teal,
               ),
               child: Text("Add new insurance",
               style: TextStyle(
                 fontSize: 20,
                 color: Colors.white,
                fontWeight: FontWeight.w500,
               ),
               ),
               onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> updateInsurance()));},
             ) ,
           ) ,


               ])),
      ),

    ));
  }
}

class _url {
}
