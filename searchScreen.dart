import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:SizedBox(height: 50,
         child: TextField(
          decoration: InputDecoration(
            filled:true,
            alignLabelWithHint: true,
            fillColor: Colors.grey,
            hintText: "search",
            helperStyle: TextStyle(
              color: Colors.grey,
              fontSize: 20
            ),

            prefixIcon: Icon(Icons.search,color: Colors.black,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
            ),

          ),
        )
      )),
      body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    ),);
  }
}
