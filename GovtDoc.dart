import 'package:flutter/material.dart';
import 'package:untitled/Models/GovtDocModel.dart';
import 'package:untitled/uni/multipleScreens/profileScreen1.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/api.dart';
class govtDoc extends StatefulWidget {
  const govtDoc({super.key});

  @override
  State<govtDoc> createState() => _govtDocState();
}

class _govtDocState extends State<govtDoc> {
  final Api api = Api();
  Future<GovtDocModel>fetchgovtDoc() async{
   var responce = await api.govtDoc();
   if(responce.status==200)
   {
     return responce;
   } else{ throw Exception('Failed to load insurance data');}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Govt Doc'),
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
                        height: 630,
                        child:FutureBuilder<GovtDocModel>(
                          future: fetchgovtDoc(),
                          builder: (BuildContext context, AsyncSnapshot<GovtDocModel> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else if (snapshot.hasData) {
                              final GovtDocData = snapshot.data?.data;
                              if (GovtDocData == null || GovtDocData.isEmpty) {
                                return const Center(child: Text('No data available'));
                              }
                              return ListView.builder(
                                itemCount: snapshot.data?.data?.length,
                                itemBuilder: (context, index) {
                                  final snapshot = GovtDocData[index];

                                  //// main container of
                                  return Container(
                                    height: 150,
                                    width: 350,
                                    margin: EdgeInsets.only(bottom: 9),
                                    color: Colors.grey[200],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:220,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Document type',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                               snapshot.name??'',
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'Government id number',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                snapshot.govtIdNumber??"",
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),

                                              ]),
                                        ),
                    Container(
                   height: 100,
                    color: Colors.grey[100],
                    child: IconButton(
                          alignment: Alignment.topCenter,
                           icon: const Icon(Icons.delete, size: 25,color: Colors.red,),
                                            onPressed: () {
                                            },
                                          ),
                                        ),
                                      ],
                                    ),

                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Text("Front side of document",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                     ),

                                   ),
                           ],
                           )),
                              onTap: ()async{
                                          final Uri url = Uri.parse(snapshot.front??"");
                                          if (!await launchUrl(url)) {
                                            throw Exception('Could not launch $_url');
                                          }
                                        },
                                      ),
                                      GestureDetector(
                                        child: Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Back side of document",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue,
                                                  ),),
                                              ],
                                            )),
                                        onTap: ()async{
                                          final Uri url = Uri.parse(snapshot.back??"");
                                          if (!await launchUrl(url)) {
                                            throw Exception('Could not launch $_url');
                                          }
                                        },
                                      ),


                                    ],
                                  )]
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
                          child: Text("Add new doc",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: (){},
                        ) ,
                      ) ,


                    ])),
          ),

        )
    );
  }
}

class _url {
}
